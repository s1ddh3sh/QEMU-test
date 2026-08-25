#!/usr/bin/env python3
"""
extract_capture_witness.py — derives a capture witness for ANY function
directly from its main()-driver .ll file, with zero function-specific
hardcoding. Unlike extract_qemu_witness.py, this does NOT try to guess
input/output roles or read a function_inputs/<fn>.json sidecar --
internal-capture mode instead dumps every debug-visible local
automatically at collection time (see driver_internal_capture.py), so
the witness here only needs to describe the FUT's formal arguments
well enough to write inputs into them.

This makes the witness -- and this whole extraction step -- completely
independent of what fault (if any) exists in a given faulty ELF: it is
derived once from main() (present identically in both correct and
faulty .ll, since the fault lives inside the FUT body, not the driver),
and the SAME witness is later used to drive both correct.elf and
faulty.elf during collection.

Usage:
    python3 extract_capture_witness.py dilithium2_sig.ll \
        --function pqcrystals_dilithium2_ref_signature_internal
"""
import argparse
import json
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple

TYPE_SIZES = {"i8": 1, "i16": 2, "i32": 4, "i64": 8, "ptr": 8}

# Matches ANY alloca line, capturing everything after `alloca` up to
# end-of-line -- the type text itself (scalar, ptr, or arbitrarily
# nested array like `[4 x [256 x i32]]`) never contains a comma in
# LLVM IR syntax (array dims use ` x `, not `,`), so the first comma
# on the line always safely separates the type from trailing
# `, align N` / `, !llvmbmc.var !N` metadata -- splitting on it is
# sufficient without needing bracket-aware parsing at this stage.
ALLOCA_LINE_RE = re.compile(
    r'%(?P<name>\w+)\s*=\s*alloca\s+(?P<rest>[^\n]+)'
)


def parse_type_size(type_str: str) -> int:
    """Recursively computes byte size for a (possibly nested) LLVM
    array type string, e.g.:
        "i32"                    -> 4
        "ptr"                    -> 8
        "[256 x i32]"            -> 1024
        "[4 x [256 x i32]]"      -> 4096
        "[2 x [4 x [256 x i32]]]"-> 8192
    Raises ValueError for types it doesn't recognize (e.g. named
    structs like %struct.foo) rather than guessing, so a genuinely
    new shape fails loudly instead of silently returning a wrong size.
    """
    type_str = type_str.strip()
    if type_str.startswith("["):
        if not type_str.endswith("]"):
            raise ValueError(f"malformed array type (unbalanced brackets): '{type_str}'")
        inner = type_str[1:-1].strip()
        m = re.match(r'(?P<count>\d+)\s*x\s*(?P<rest>.+)', inner, re.DOTALL)
        if not m:
            raise ValueError(f"couldn't parse array type '{type_str}' (expected 'N x TYPE')")
        count = int(m.group("count"))
        rest_size = parse_type_size(m.group("rest"))
        return count * rest_size
    if type_str in TYPE_SIZES:
        return TYPE_SIZES[type_str]
    raise ValueError(
        f"don't know how to size type '{type_str}' -- if this is a named "
        f"struct or other non-array type, extend parse_type_size() to "
        f"resolve it (e.g. by looking up its %struct.X = type {{...}} "
        f"definition and summing member sizes)."
    )


def extract_flat_allocas(ll_text: str) -> Dict[str, int]:
    """{var_name: byte size} for every alloca in the text -- scalars
    (`%x = alloca i32`), pointers (`%p = alloca ptr`), single-level
    arrays (`%buf = alloca [78 x i8]`), and arbitrarily nested arrays
    (`%z = alloca [4 x [256 x i32]]`, matching polyvecl/polyveck-style
    locals in main()'s driver code) are all handled by the same
    recursive parser. Allocas whose type can't be parsed (e.g. named
    structs) are skipped rather than raising here -- they simply won't
    appear in the returned dict, and derive_capture_witness() reports
    a clear per-argument error later if one of those is actually
    needed as a call argument."""
    out = {}
    for m in ALLOCA_LINE_RE.finditer(ll_text):
        name = m.group("name")
        if name in out:
            continue
        type_str = m.group("rest").split(",", 1)[0].strip()
        try:
            out[name] = parse_type_size(type_str)
        except ValueError:
            continue  # unresolvable type (e.g. named struct) -- skip silently here
    return out


def find_function_body(ll_text: str, fn_name: str) -> str:
    """Brace-balanced body of `define ... @fn_name(...) ... { ... }`.
    Works for both main() and the FUT itself."""
    pattern = r'define[^\n]*@' + re.escape(fn_name) + r'\s*\([^)]*\)[^\{]*\{'
    m = re.search(pattern, ll_text)
    if not m:
        raise ValueError(f"Could not find definition of @{fn_name} in .ll file")
    start = m.end()
    depth, i = 1, m.end()
    while i < len(ll_text) and depth > 0:
        if ll_text[i] == '{':
            depth += 1
        elif ll_text[i] == '}':
            depth -= 1
        i += 1
    return ll_text[start:i - 1]


def find_fut_call(main_body: str, fn_name: str) -> List[Tuple[str, str]]:
    """Ordered (kind, value) list for the call to @fn_name inside main().
    kind is 'ptr' (value = alloca'd SSA name) or 'imm' (value = literal)."""
    call_re = re.compile(
        r'call\s+(?:fastcc\s+)?[\w%]+\s+@' + re.escape(fn_name) +
        r'\s*\((?P<args>.*?)\)',
        re.DOTALL,
    )
    m = call_re.search(main_body)
    if not m:
        raise ValueError(f"Could not find call to @{fn_name} inside main()")
    args: List[Tuple[str, str]] = []
    for raw in m.group("args").split(","):
        raw = raw.strip()
        if not raw:
            continue
        pm = re.search(r'ptr\s+(?:[\w\s]+\s+)?%(?P<ptr>\w+)', raw)
        if pm:
            args.append(("ptr", pm.group("ptr")))
            continue
        im = re.search(r'i\d+\s+(?P<imm>-?\d+)', raw)
        if im:
            args.append(("imm", im.group("imm")))
            continue
        raise ValueError(f"Unrecognized call argument form: '{raw}'")
    return args


def find_fut_param_names(ll_text: str, fn_name: str) -> List[str]:
    """
    Parses the FUT's own `define ... @fn_name(ptr noundef %sig, ptr
    noundef %siglen, ...)` header to get its formal parameter names, in
    declaration order -- used to name each call argument meaningfully
    (matching driver_internal_capture.py's runtime lookup by name via
    frame.block()) rather than leaving them as anonymous positions.
    """
    pattern = r'define[^\n]*@' + re.escape(fn_name) + r'\s*\((?P<params>[^)]*)\)'
    m = re.search(pattern, ll_text)
    if not m:
        raise ValueError(f"Could not find define header for @{fn_name}")
    names = []
    for raw in m.group("params").split(","):
        raw = raw.strip()
        pm = re.search(r'%(?P<name>\w+)\s*$', raw)
        if pm:
            names.append(pm.group("name"))
        else:
            names.append(None)  # unnamed/scalar-without-debug-name param
    return names


def derive_capture_witness(main_ll_text: str, fut_ll_text: str, fn_name: str) -> Dict:
    """
    main_ll_text: text containing main() (may be the same file as
                  fut_ll_text, or a separate top-level driver .ll --
                  pass the same text twice if both live in one file).
    fut_ll_text:  text containing the FUT's own `define`, used only to
                  read its formal parameter NAMES (not sizes -- sizes
                  come from main()'s allocas, matched positionally).
    """
    allocas = extract_flat_allocas(main_ll_text)
    main_body = find_function_body(main_ll_text, "main")
    call_args = find_fut_call(main_body, fn_name)
    param_names = find_fut_param_names(fut_ll_text, fn_name)

    if len(param_names) != len(call_args):
        raise ValueError(
            f"FUT signature has {len(param_names)} parameters {param_names}, "
            f"but the call in main() has {len(call_args)} arguments -- "
            f"mismatch, cannot align them positionally."
        )

    formal_args = []
    for pname, (kind, val) in zip(param_names, call_args):
        entry = {"name": pname, "kind": kind}
        if kind == "ptr":
            if val not in allocas:
                raise ValueError(
                    f"Call argument %{val} (param '{pname}') has no matching "
                    f"alloca in main() whose type extract_flat_allocas() could "
                    f"size -- cannot determine its byte length. If this buffer "
                    f"is declared with a named struct type (e.g. "
                    f"%struct.foo = type {{...}}), extend parse_type_size() to "
                    f"resolve struct member layouts, not just array nesting."
                )
            entry["length"] = allocas[val]
        else:  # imm
            entry["value"] = int(val)
        formal_args.append(entry)

    return {
        "function": fn_name,
        # Formal arguments only -- driver_internal_capture.py writes
        # random bytes into every 'ptr' entry's address (at the length
        # given here) and passes 'imm' entries through unchanged (they
        # were already baked into main()'s call as literals; recorded
        # here for reference/debugging, not written at runtime).
        #
        # Every LOCAL variable inside the FUT (s1, y, cp, z, mat, w0,
        # w1, h, nonce, ...) is discovered automatically at collection
        # time via the ELF's own debug info -- nothing about them is
        # declared here, so this witness is identical regardless of
        # which fault (if any) the target ELF contains.
        "formal_args": formal_args,
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("ll_file", type=Path,
                     help="path to the .ll containing BOTH main() and the FUT "
                          "definition (pass the same file twice via --fut-ll "
                          "if they're split across two files)")
    ap.add_argument("--function", required=True, help="function-under-test name")
    ap.add_argument("--fut-ll", type=Path, default=None,
                     help="separate .ll containing the FUT's own `define`, "
                          "if different from ll_file")
    ap.add_argument("--out", type=Path, default=None)
    args = ap.parse_args()

    main_text = args.ll_file.read_text()
    fut_text = args.fut_ll.read_text() if args.fut_ll else main_text

    witness = derive_capture_witness(main_text, fut_text, args.function)

    out_path = args.out or (Path("tests_mayo") / args.function / "capture_witness.json")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w") as f:
        json.dump(witness, f, indent=2)

    print(f"[+] wrote {out_path}")
    print(json.dumps(witness, indent=2))


if __name__ == "__main__":
    main()