#!/usr/bin/env python3
"""
extract_qemu_witness.py — derive a layout-only qemu_witness.json for a
Kyber function-under-test directly from its generated main()-driver .ll
file, using the ../function_inputs/<fn>.json trace captured via
PRINT_ARGS in trace.h.

Kyber-specific sample format (differs from the generic mayo tracer):

    {"output":"r","r":[1,0,1,-1,...],"buf":167,
     "distribution":{"r":"centered binomial distribution, eta2"}}

    {"output":"return","pk":208,"sk":242}

  - "output" is either the name of a real argument (the value that key
    holds in the sample is irrelevant to layout -- only whether the
    matching call argument is a pointer matters, exactly as before),
    or the literal sentinel string "return", meaning the function's
    actual scalar return value (via __mbc_ret_anchor_<fn>) is what's
    being treated as the output, independent of any of its pointer
    arguments.
  - "distribution" (optional) maps argument names to one of the
    documented Kyber sampling distributions (centered binomial,
    various R_q domains, byte strings, ...). It is carried straight
    through into the witness layout as an extra "distribution" key, for
    driver_dist.py's collect mode to sample realistic values from
    instead of raw uniform bytes.
  - "distribution" and "output" are metadata, not parameters, and are
    excluded when matching sample keys up against the .ll call's
    argument list.
  - An in-place ("also input") argument -- one that trace.h recorded
    with INOUT(...), e.g. poly_ntt's r -- shows up as a companion
    "<name>_in" key holding trace.h's pre-mutation snapshot. That
    companion key is metadata too (not a call argument on its own);
    its presence is what marks the corresponding output argument
    "also_input": true in the witness layout, telling driver_dist.py to
    randomize it like a normal input AND read it back as an output.
"""

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple


# Standard primitive size map in bytes
TYPE_SIZES = {
    "i8": 1,
    "i16": 2,
    "i32": 4,
    "i64": 8,
    "ptr": 8,
}

# Matches: %Name = alloca [N x <type>] ... !llvmbmc.var !NNN
ALLOCA_RE = re.compile(
    r'%(?P<name>\w+)\s*=\s*alloca\s*\[\s*(?P<count>\d+)\s*x\s*(?P<type>i\d+|ptr|[%\w.]+)\s*\]'
    r'[^\n]*?!llvmbmc\.var'
)

# Start of a bracketed alloca -- used by extract_allocas below to locate
# the outer '[' and then bracket-match forward, since Kyber's polyvec
# buffers are NESTED arrays (e.g. `[3 x [256 x i16]]` for a K=3
# polyvec), which a single non-recursive regex like ALLOCA_RE above
# cannot capture the inner dimension of.
ALLOCA_START_RE = re.compile(r'%(?P<name>\w+)\s*=\s*alloca\s*\[')

# Kyber symbol names are namespaced per KYBER_NAMESPACE(s) in params.h
# (pqcrystals_kyber512_ref_##s / kyber768 / kyber1024) or, for the
# fips202 primitives, pqcrystals_kyber_fips202_ref_##s. The .ll file and
# its call sites/anchors keep this full mangled name, but
# kyber_function_inputs/*.json is written under the short, unmangled
# function name (e.g. "dec.json" for pqcrystals_kyber768_ref_dec) --
# strip_kyber_prefix() is used ONLY when resolving that json path.
_KYBER_NAME_PREFIXES_RE = re.compile(
    r'^pqcrystals_kyber(?:512|768|1024)?_ref_|^pqcrystals_kyber_fips202_ref_'
)


def strip_kyber_prefix(name: str, extra_prefixes=()) -> str:
    for prefix in extra_prefixes:
        if name.startswith(prefix):
            return name[len(prefix):]
    return _KYBER_NAME_PREFIXES_RE.sub('', name, count=1)


def _find_matching_bracket(text: str, open_idx: int) -> int:
    """text[open_idx] must be '['. Returns the index of its matching ']'."""
    depth = 0
    for i in range(open_idx, len(text)):
        if text[i] == '[':
            depth += 1
        elif text[i] == ']':
            depth -= 1
            if depth == 0:
                return i
    raise ValueError("unbalanced '[' in alloca type")


def _parse_array_type(type_text: str):
    """
    type_text is the content INSIDE one outer [...], e.g. "1184 x i8" or
    "3 x [256 x i16]" (a polyvec: 3 polys of 256 i16 coefficients each).
    Recurses through nested array dimensions and returns
    (total_element_count, base_type_str) with the dimensions multiplied
    out -- e.g. "3 x [256 x i16]" -> (768, "i16").
    """
    m = re.match(r'\s*(\d+)\s*x\s*(.*)$', type_text, re.DOTALL)
    if not m:
        raise ValueError(f"cannot parse array type: {type_text!r}")
    count = int(m.group(1))
    rest = m.group(2).strip()
    if rest.startswith('['):
        end = _find_matching_bracket(rest, 0)
        inner_count, inner_base = _parse_array_type(rest[1:end])
        return count * inner_count, inner_base
    return count, rest


def extract_allocas(ll_text: str) -> Dict[str, int]:
    """{var_name: raw alloca total byte size}, in first-appearance order.

    Handles arbitrarily nested array types (e.g. Kyber polyvec's
    `[K x [256 x i16]]`), unlike a single flat regex.
    """
    allocas = {}
    for m in ALLOCA_START_RE.finditer(ll_text):
        var_name = m.group("name")
        open_idx = m.end() - 1  # index of the '[' just matched
        try:
            close_idx = _find_matching_bracket(ll_text, open_idx)
        except ValueError:
            continue

        # Same requirement ALLOCA_RE enforced: only allocas explicitly
        # tagged !llvmbmc.var (on the same statement/line) are harness
        # variables we care about.
        line_end = ll_text.find('\n', close_idx)
        if line_end == -1:
            line_end = len(ll_text)
        if '!llvmbmc.var' not in ll_text[close_idx:line_end]:
            continue

        type_text = ll_text[open_idx + 1:close_idx]
        try:
            count, base_type = _parse_array_type(type_text)
        except ValueError:
            continue

        elem_size = TYPE_SIZES.get(base_type, 1)
        allocas[var_name] = count * elem_size
    return allocas


# Keys that are metadata on a function_inputs sample, never real call
# arguments in their own right.
RESERVED_SAMPLE_KEYS = {"output", "distribution"}


def find_main_body(ll_text: str) -> str:
    """Extract the brace-balanced body of `define ... @main(...) { ... }`."""
    m = re.search(r'define[^\n]*@main\s*\([^)]*\)[^\{]*\{', ll_text)
    if not m:
        raise ValueError("Could not find @main definition in .ll file")
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
    """
    Locate `call [fastcc] <ty> @<fn_name>(...)` inside main() and parse
    its argument list. Tolerates extra pointer attributes like `nonnull`.
    """
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

        # Tolerates optional parameter attributes like `nonnull`, `nocapture`
        pm = re.search(r'ptr\s+(?:[\w\s]+\s+)?%(?P<ptr>\w+)', raw)
        if pm:
            args.append(("ptr", pm.group("ptr")))
            continue

        im = re.search(r'i\d+\s+(?P<imm>-?\d+)', raw)
        if im:
            args.append(("imm", im.group("imm")))
            continue
        rm = re.search(r'i(?P<bits>\d+)\s+%(?P<reg>\w+)', raw)
        if rm:
            args.append(("reg", rm.group("reg")))
            continue
        raise ValueError(f"Unrecognized call argument form: '{raw}'")
    return args


def find_arg_anchor(ll_text: str, reg_name: str) -> Tuple[str, int]:
    """
    Given a register name like 'a_val', find the defining:

        %a_val = load volatile i8, ptr @__mbc_arg_add_f_a, align 1

    and return (anchor_global_name, byte_width).
    """
    pattern = re.compile(
        r'%' + re.escape(reg_name) +
        r'\s*=\s*load\s+volatile\s+i(?P<bits>\d+),\s*ptr\s+@(?P<anchor>[\w.]+)'
    )
    m = pattern.search(ll_text)
    if not m:
        raise ValueError(
            f"Could not find 'load volatile ... @__mbc_arg_*' defining "
            f"register %{reg_name}; scalar-input anchor pattern not found."
        )
    bits = int(m.group("bits"))
    if bits % 8 != 0:
        raise ValueError(f"Unsupported scalar bit width {bits} for %{reg_name}")
    return m.group("anchor"), bits // 8


def find_ret_anchor(ll_text: str, fn_name: str) -> str:
    anchor_name = f"__mbc_ret_anchor_{fn_name}"
    pattern = re.compile(
        r'store\s+volatile\s+i(?P<bits>\d+)[^\n]*?@' + re.escape(anchor_name)
    )
    m = pattern.search(ll_text)
    if not m:
        raise ValueError(
            f"Expected a 'store volatile ... @{anchor_name}' anchor write "
            f"in main() for scalar-output function '{fn_name}', found none."
        )
    return anchor_name


def find_global_init(ll_text: str, anchor_name: str) -> int:
    m = re.search(
        r'@' + re.escape(anchor_name) +
        r'\s*=\s*(?:dso_local\s+)?global\s+i\d+\s+(-?\d+)',
        ll_text
    )
    if not m:
        return 0
    return int(m.group(1))


def load_first_sample(json_path: Path) -> Dict[str, object]:
    with open(json_path) as f:
        for line in f:
            line = line.strip()
            if line:
                return json.loads(line)
    raise ValueError(f"No JSON objects found in {json_path}")


def split_sample_keys(sample: Dict[str, object]) -> Tuple[List[str], set]:
    """
    Split a sample's keys into (param_keys, snapshot_keys):
      - param_keys: keys that correspond 1:1, in order, to the FUT's real
        call arguments -- i.e. everything except "output"/"distribution"
        and any "<name>_in" pre-mutation snapshot companion key.
      - snapshot_keys: the "<name>_in" companion keys found, used only to
        mark the corresponding output argument "also_input": true.
    """
    keys = list(sample.keys())
    key_set = set(keys)
    snapshot_keys = {
        k for k in keys if k.endswith("_in") and k[:-len("_in")] in key_set
    }
    param_keys = [
        k for k in keys if k not in RESERVED_SAMPLE_KEYS and k not in snapshot_keys
    ]
    return param_keys, snapshot_keys


def derive_layout(ll_text: str, fn_name: str, sample: Dict[str, object]) -> Dict[str, dict]:
    allocas = extract_allocas(ll_text)
    call_args = find_fut_call(find_main_body(ll_text), fn_name)

    if "output" not in sample:
        raise ValueError(f"function_inputs sample for '{fn_name}' has no 'output' key")

    raw_output = sample["output"]
    output_keys = raw_output if isinstance(raw_output, list) else [raw_output]
    if not output_keys:
        raise ValueError(f"function_inputs sample for '{fn_name}' has an empty 'output'")

    is_scalar_return = (len(output_keys) == 1 and output_keys[0] == "return")
    if not is_scalar_return and "return" in output_keys:
        raise ValueError(
            f"'{fn_name}': the 'return' sentinel can't be combined with "
            f"named-argument outputs in the same 'output' list ({output_keys})."
        )

    param_keys, _snapshot_keys = split_sample_keys(sample)

    if len(param_keys) != len(call_args):
        raise ValueError(
            f"Mismatch: function_inputs has {len(param_keys)} params "
            f"{param_keys}, call to @{fn_name} has {len(call_args)} "
            f"arguments {call_args}."
        )

    key_to_arg = dict(zip(param_keys, call_args))
    distributions = sample.get("distribution") or {}

    # Built ONCE, not per output key -- a second output name must not
    # wipe out everything the first one already set.
    layout = {}
    ptr_keys = set()

    for key, (kind, val) in key_to_arg.items():
        if kind == "ptr":
            var_name = val
            if var_name not in allocas:
                raise ValueError(
                    f"Call argument %{var_name} (json key '{key}') has no "
                    f"matching alloca with !llvmbmc.var in main()"
                )
            layout[key] = {"role": "input", "length": allocas[var_name]}
            ptr_keys.add(key)

        elif kind == "reg":
            anchor_name, byte_width = find_arg_anchor(ll_text, val)
            layout[key] = {
                "role": "input",
                "type": "scalar",
                "anchor": anchor_name,
                "length": byte_width,
                "init_value": find_global_init(ll_text, anchor_name),
            }

        elif kind == "imm":
            print(
                f"[!] key '{key}' is a bare immediate ({val}); not "
                f"patchable. Check the harness generator emitted an anchor "
                f"for this argument."
            )

        if key in layout and key in distributions:
            layout[key]["distribution"] = distributions[key]


        in_key = f"{key}_in"
        if key in layout and in_key in distributions:
            post = layout[key].get("distribution")
            layout[key]["distribution"] = distributions[in_key]
            if post is not None:
                layout[key]["output_distribution"] = post

    if is_scalar_return:
        anchor = find_ret_anchor(ll_text, fn_name)
        layout["return"] = {
            "role": "output",
            "length": 1,
            "type": "scalar",
            "anchor": anchor,
        }
    else:
        # Mark EVERY declared output key as role="output" -- this is the
        # part that must loop over output_keys; building layout itself
        # must not.
        for output_key in output_keys:
            if output_key not in ptr_keys:
                raise ValueError(
                    f"'output' key '{output_key}' does not map to a "
                    f"pointer argument (and isn't the 'return' sentinel)."
                )
            layout[output_key]["role"] = "output"
            if f"{output_key}_in" in _snapshot_keys:
                # trace.h recorded a pre-mutation snapshot for this key
                # (INOUT(...) tag) -- it's written as a random input
                # before the call AND read back as the real output
                # afterward, not a plain write-only output buffer.
                layout[output_key]["also_input"] = True

    return layout


def build_qemu_witness(fn_name: str, layout: Dict[str, dict]) -> Dict[str, object]:
    return {"function": fn_name, "layout": layout}


def main():
    ap = argparse.ArgumentParser(
        description="Derive layout-only qemu_witness.json from .ll file (Kyber)."
    )
    ap.add_argument("ll_file", type=Path, help="path to <function_name>.ll")
    ap.add_argument(
        "--inputs-dir", type=Path, default=Path("kyber_function_inputs"),
        help="directory containing <function_name>.json trace samples "
             "(default: %(default)s)",
    )
    ap.add_argument(
        "--out-dir", type=Path, default=Path("tests_kyber"),
        help="directory to write <function_name>/qemu_witness.json under "
             "(default: %(default)s)",
    )
    ap.add_argument(
        "--extra-prefix", action="append", default=[],
        help="additional literal prefix to strip from the .ll function "
             "name when looking up its kyber_function_inputs/*.json "
             "(beyond the built-in pqcrystals_kyber{512,768,1024}_ref_ "
             "and pqcrystals_kyber_fips202_ref_). May be passed multiple "
             "times.",
    )
    args = ap.parse_args()

    ll_path = args.ll_file
    if not ll_path.exists():
        print(f"[!] .ll file not found: {ll_path}", file=sys.stderr)
        sys.exit(1)
    if ll_path.suffix != ".ll":
        print(f"[!] expected a .ll file, got: {ll_path}", file=sys.stderr)
        sys.exit(1)

    fn_name = ll_path.stem
    sample_name = strip_kyber_prefix(fn_name, args.extra_prefix)

    inputs_json = args.inputs_dir / f"{sample_name}.json"
    if not inputs_json.exists():
        print(f"[!] function_inputs file not found: {inputs_json}", file=sys.stderr)
        sys.exit(1)

    ll_text = ll_path.read_text()
    sample = load_first_sample(inputs_json)

    layout = derive_layout(ll_text, fn_name, sample)
    witness = build_qemu_witness(fn_name, layout)

    out_dir = args.out_dir / fn_name
    print(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / "qemu_witness.json"
    with open(out_path, "w") as f:
        json.dump(witness, f, indent=2)
        f.write("\n")

    print(f"[+] wrote {out_path}")
    print(json.dumps(witness, indent=2))


if __name__ == "__main__":
    main()