#!/usr/bin/env python3
"""
extract_qemu_witness.py — derive a layout-only qemu_witness.json for a
function-under-test directly from its generated main()-driver .ll file.
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

def extract_allocas(ll_text: str) -> Dict[str, int]:
    """{var_name: raw alloca total byte size}, in first-appearance order."""
    allocas = {}
    for m in ALLOCA_RE.finditer(ll_text):
        var_name = m.group("name")
        count = int(m.group("count"))
        elem_type = m.group("type")
        
        # Calculate element byte size (defaults to 1 if custom/unknown struct)
        elem_size = TYPE_SIZES.get(elem_type, 1)
        allocas[var_name] = count * elem_size
    return allocas


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
        
        # Updated regex to match optional parameter attributes like `nonnull`, `nocapture`
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
def derive_layout(ll_text: str, fn_name: str, sample: Dict[str, object]) -> Dict[str, dict]:
    allocas = extract_allocas(ll_text)
    call_args = find_fut_call(find_main_body(ll_text), fn_name)

    if "output" not in sample:
        raise ValueError(f"function_inputs sample for '{fn_name}' has no 'output' key")

    raw_output = sample["output"]
    output_keys = raw_output if isinstance(raw_output, list) else [raw_output]
    if not output_keys:
        raise ValueError(f"function_inputs sample for '{fn_name}' has an empty 'output'")

    all_param_keys = [k for k in sample.keys() if k != "output"]

    # Scalar-return detection: exactly one output key, not itself a real
    # parameter, and the arg-count is short by exactly one.
    is_scalar_return = False
    if len(all_param_keys) == len(call_args):
        param_keys = all_param_keys
    elif (len(all_param_keys) == len(call_args) + 1
          and len(output_keys) == 1
          and output_keys[0] in all_param_keys):
        is_scalar_return = True
        param_keys = [k for k in all_param_keys if k != output_keys[0]]
    else:
        raise ValueError(
            f"Mismatch: function_inputs has {len(all_param_keys)} params "
            f"{all_param_keys}, call to @{fn_name} has {len(call_args)} "
            f"arguments {call_args}."
        )

    key_to_arg = dict(zip(param_keys, call_args))

    # Built ONCE, not per output key -- fixes the bug where a second
    # output name wiped out everything the first had already set.
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

    if is_scalar_return:
        anchor = find_ret_anchor(ll_text, fn_name)
        layout[output_keys[0]] = {
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
                    f"pointer argument."
                )
            layout[output_key]["role"] = "output"

    return layout


def build_qemu_witness(fn_name: str, layout: Dict[str, dict]) -> Dict[str, object]:
    return {"function": fn_name, "layout": layout}


def main():
    ap = argparse.ArgumentParser(
        description="Derive layout-only qemu_witness.json from .ll file."
    )
    ap.add_argument("ll_file", type=Path, help="path to <function_name>.ll")
    args = ap.parse_args()

    ll_path = args.ll_file
    if not ll_path.exists():
        print(f"[!] .ll file not found: {ll_path}", file=sys.stderr)
        sys.exit(1)
    if ll_path.suffix != ".ll":
        print(f"[!] expected a .ll file, got: {ll_path}", file=sys.stderr)
        sys.exit(1)

    fn_name = ll_path.stem

    inputs_json = Path("mayo_function_inputs") / f"{fn_name}.json"
    if not inputs_json.exists():
        print(f"[!] function_inputs file not found: {inputs_json}", file=sys.stderr)
        sys.exit(1)

    ll_text = ll_path.read_text()
    sample = load_first_sample(inputs_json)

    layout = derive_layout(ll_text, fn_name, sample)
    witness = build_qemu_witness(fn_name, layout)

    out_dir = Path("tests_mayo") / fn_name
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