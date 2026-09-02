#!/usr/bin/env python3
"""
calibrate.py — determines the empirically "active" (input-sensitive)
prefix length of each input buffer, by binary search against the
correct.elf's output. Writes active_lengths.json for use by the N-trial
collection step.

Assumption (worth checking if a buffer's calibrated length looks wrong):
the FUT reads a CONTIGUOUS PREFIX of each input buffer -- i.e. sensitivity
to input bytes is monotonic in prefix length. This holds for straightforward
m/n-bounded loops (mat_add, lincomb) but can fail for non-contiguous access
patterns (e.g. strided or pointer-chain access). If a buffer's active
length calibrates to something implausible, fall back to a block-scan
(partition into chunks, probe each independently) instead of prefix binary
search -- not implemented here, flagged as a known limitation.

Safety: a buffer's declared "length" in qemu_witness.json comes from an
LLVM alloca size, which can be a worst-case/MAX-sized harness buffer far
larger than what's actually needed for the parameter set under test (or,
if witness extraction mismatched buffers, can simply be wrong). Blindly
randomizing/probing at that full declared length on a memory-constrained
QEMU target can overrun real available RAM, corrupting adjacent state and
crashing the target before any output can be read back -- this shows up
as a RuntimeError/gdb.MemoryError deep in run_probe with no useful
diagnostic. MAX_SAFE_PROBE_LEN below caps the *initial* reference probe
so this failure mode is caught with a clear message instead of crashing
blind, and per-buffer failures are isolated so one bad buffer doesn't
abort calibration for every other buffer in the same function.

Usage:
    python3 calibrate.py --witness results/mat_add/qemu_witness.json \
        --elf correct.elf --field-mod 16 --machine mps2-an386 \
        --fixed-scalars m_vec_limbs,colrow_ab
"""
import argparse
import json
import os
import subprocess
import tempfile
import time

SKIP_CALIBRATION_BELOW = 128  # buffers <= this size: just use full
                                 # length directly, calibration overhead
                                 # isn't worth it for small buffers

# If a buffer's declared length exceeds this, the initial reference probe
# is capped here instead of using the raw declared length directly. This
# is a SAFETY cap, not a correctness claim -- if the true active length is
# beyond the cap, calibration will under-report it (see the warning this
# prints). Override with --max-probe-len if a target genuinely has more
# RAM headroom than this default assumes.
MAX_SAFE_PROBE_LEN = 8192


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


_DRIVER_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "driver_dist.py")


def run_probe(elf_path, witness_path, func, field_mod, buf_name,
               probe_len, seed, co_seed, machine, fixed_scalars=""):
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tf:
        probe_out = tf.name
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_WITNESS": witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_MODE": "probe",
        "GDB_DRIVER_FIELD_MOD": str(field_mod),
        "GDB_DRIVER_PROBE_BUF": buf_name,
        "GDB_DRIVER_PROBE_LEN": str(probe_len),
        "GDB_DRIVER_PROBE_SEED": str(seed),
        "GDB_DRIVER_CO_SEED": str(co_seed),
        "GDB_DRIVER_PROBE_OUT": probe_out,
        "GDB_DRIVER_FIXED_SCALARS": fixed_scalars,
    })
    try:
        result = subprocess.run(
            ["gdb-multiarch", "-nx", "-batch", "-x", _DRIVER_SCRIPT],
            env=env, capture_output=True, text=True, timeout=60,
        )
    finally:
        qemu_proc.terminate()
        try:
            qemu_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            qemu_proc.kill()
            qemu_proc.wait(timeout=5)

    if not os.path.exists(probe_out) or os.path.getsize(probe_out) == 0:
        crash_hint = ""
        if "MemoryError" in (result.stdout + result.stderr) or "exited normally" in result.stdout:
            crash_hint = (
                "\n[hint] this looks like the target crashed or exited "
                "before the driver's return breakpoint was reached, "
                "which is the usual signature of probe_len being larger "
                "than the buffer can actually support on this target "
                "(e.g. an over-declared/MAX-sized alloca, or a witness-"
                "extraction bug pairing this key with the wrong buffer). "
                "Check qemu_witness.json's declared length for "
                f"'{buf_name}' ({probe_len} bytes here) before assuming "
                "the target itself is broken."
            )
        raise RuntimeError(
            f"probe (buf={buf_name}, len={probe_len}, seed={seed}) produced "
            f"no output.{crash_hint}\n--- gdb stdout ---\n{result.stdout}\n"
            f"--- gdb stderr ---\n{result.stderr}"
        )
    with open(probe_out) as f:
        result_json = json.load(f)
    os.unlink(probe_out)
    return result_json


class CalibrationFailed(Exception):
    """Raised when a buffer can't be safely calibrated at all."""


def calibrate_buffer(elf_path, witness_path, func, field_mod, buf_name,
                      full_length, machine, n_repeats=3, base_seed=0,
                      fixed_scalars="", max_probe_len=MAX_SAFE_PROBE_LEN):
    """
    Find the minimal prefix length L such that zeroing everything from
    index L onward still reproduces the SAME output as using the full
    buffer -- i.e. the point past which additional bytes no longer
    influence the FUT. This is different from "does prefix L differ
    from an all-zero input", which is trivially true for L=1 whenever
    byte 0 matters at all, and does not measure how far sensitivity
    extends.

    Raises CalibrationFailed (with a clear message) instead of letting a
    target crash propagate as an opaque traceback -- callers should catch
    this per-buffer and continue with the rest of the function's buffers.
    """
    co_seed = base_seed

    # SAFETY: never blindly probe at an arbitrarily large declared
    # length -- cap the search space up front and say so loudly. This is
    # what the previous version got wrong: `reference = probe(full_length,
    # base_seed)` used the raw declared length as its very first call,
    # with no guard, which is exactly what crashed QEMU on a ~145KB
    # buffer on a memory-constrained embedded target.
    effective_length = full_length
    if full_length > max_probe_len:
        print(
            f"[!] {buf_name}: declared length {full_length} exceeds the "
            f"safety cap ({max_probe_len}). This usually means either (a) "
            f"the source alloca is a worst-case/MAX-sized buffer much "
            f"bigger than what this parameter set actually uses, or (b) "
            f"qemu_witness.json paired this key with the wrong call "
            f"argument (see extract_qemu_witness.py's name-matching -- "
            f"check for a sibling buffer reporting the exact same "
            f"length, which would confirm a mismatch rather than a "
            f"genuinely large buffer). Capping the calibration search to "
            f"{max_probe_len}; if the true active length is beyond that, "
            f"it will be UNDER-reported. Pass --max-probe-len to raise "
            f"this if the target genuinely has the RAM for it."
        )
        effective_length = max_probe_len

    def probe(length, seed):
        return run_probe(elf_path, witness_path, func, field_mod,
                          buf_name, length, seed, co_seed, machine,
                          fixed_scalars)

    # Reference: probe with the (possibly capped) full buffer active.
    # Held fixed -- every candidate L is compared against this, not zero.
    try:
        reference = probe(effective_length, base_seed)
    except (RuntimeError, subprocess.TimeoutExpired) as e:
        raise CalibrationFailed(
            f"{buf_name}: reference probe at length {effective_length} "
            f"failed -- cannot calibrate this buffer at all.\n{e}"
        ) from e

    def matches_reference(length):
        for r in range(n_repeats):
            result = probe(length, base_seed)
            # NOTE: same probe_seed as reference each time -- only the
            # zeroed suffix differs between `length` and `effective_length`,
            # so a mismatch means some byte >= length genuinely mattered.
            if result != reference:
                return False
        return True

    if matches_reference(0):
        # Not sensitive to ANY byte of this buffer at all.
        print(f"[!] {buf_name}: output identical to full-buffer reference "
              f"even with prefix length 0 -- buffer may be unused.")
        return 0

    # Exponential growth: find an upper bound where output already
    # matches the reference.
    lo, hi = 0, 1
    while hi < effective_length and not matches_reference(hi):
        lo = hi
        hi = min(hi * 2, effective_length)

    if not matches_reference(hi):
        if effective_length < full_length:
            print(
                f"[!] {buf_name}: sensitivity extends past the capped "
                f"search length ({effective_length}); reporting "
                f"{effective_length} but the TRUE active length may be "
                f"larger. Re-run with a higher --max-probe-len to find it."
            )
        return effective_length

    # Binary search within (lo, hi] for the minimal L that matches.
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if matches_reference(mid):
            hi = mid
        else:
            lo = mid

    return hi


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--elf", required=True, help="correct.elf")
    ap.add_argument("--field-mod", type=int, default=16)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--out", default=None)
    ap.add_argument(
        "--max-probe-len", type=int, default=MAX_SAFE_PROBE_LEN,
        help="Safety cap on the initial/reference probe length for any "
             "one buffer (default: %(default)s). Declared alloca lengths "
             "beyond this are capped rather than probed directly, to "
             "avoid crashing memory-constrained QEMU targets on "
             "over-declared/MAX-sized or witness-mismatched buffers.",
    )
    ap.add_argument(
        "--fixed-scalars",
        default="",
        help="Comma-separated list of scalar layout names (structural "
             "dimensions like m_vec_limbs, colrow_ab, row_a, col_b) that "
             "must stay at their compiled-in init_value during calibration "
             "instead of being randomized -- otherwise the binary search "
             "can corrupt/misjudge sensitivity by varying a parameter that "
             "should be held fixed.",
    )
    args = ap.parse_args()

    with open(args.witness) as f:
        spec = json.load(f)
    layout = spec["layout"]
    func = spec["function"]

    active_lengths = {}
    failed_buffers = {}
    for name, s in layout.items():
        if s.get("role") != "input":
            continue
        full_len = s["length"]
        if full_len <= SKIP_CALIBRATION_BELOW:
            active_lengths[name] = full_len
            print(f"[i] {name}: length {full_len} <= threshold, skipping calibration")
            continue
        print(f"[i] calibrating {name} (full length {full_len})...")
        try:
            active_len = calibrate_buffer(args.elf, args.witness, func,
                                           args.field_mod, name, full_len,
                                           args.machine,
                                           fixed_scalars=args.fixed_scalars,
                                           max_probe_len=args.max_probe_len)
        except CalibrationFailed as e:
            # Isolate the failure to this ONE buffer -- previously an
            # exception here killed the whole run, so a single
            # oversized/mismatched buffer meant NO buffer for the
            # function got calibrated, even ones that were perfectly fine.
            print(f"[!] {name}: calibration failed, skipping this buffer.\n{e}")
            failed_buffers[name] = str(e)
            continue
        active_lengths[name] = active_len
        print(f"[i] {name}: active length = {active_len} / {full_len}")

    out_path = args.out or os.path.join(os.path.dirname(args.witness), "active_lengths.json")
    with open(out_path, "w") as f:
        json.dump(active_lengths, f, indent=2)
    print(f"[+] wrote {out_path}")
    print(json.dumps(active_lengths, indent=2))

    if failed_buffers:
        print(
            f"\n[!] {len(failed_buffers)} buffer(s) could NOT be "
            f"calibrated and are absent from {out_path}: "
            f"{sorted(failed_buffers.keys())}. Downstream steps that "
            f"need these buffers' active lengths will need the "
            f"underlying issue fixed first (see messages above) -- "
            f"most likely a witness-extraction/length problem, not a "
            f"real target fault."
        )


if __name__ == "__main__":
    main()