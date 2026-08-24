#!/usr/bin/env python3
"""collect_distribution_internal.py — N-trial collection using
driver_internal_capture.py. The SAME capture_witness.json (derived
once from correct.elf's .ll) drives both correct.elf and faulty.elf --
this script is where the two ELFs are first both needed."""
import argparse
import json
import os
import subprocess
import time

TRIAL_TIMEOUT_SEC = 30

# Kept in sync with driver_internal_capture.py's DISTRIBUTIONS registry
# purely for early CLI-side validation -- the driver script itself is
# still the source of truth and will raise if this list ever drifts.
KNOWN_DISTRIBUTIONS = {
    "uniform_bytes", "eta2", "eta3", "eta4", "cbd_eta2", "cbd_eta3",
}


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


def run_collect_trial(elf_path, capture_witness_path, func, trial_seed,
                       variant, out_dir, machine, dist_spec_json,
                       default_dist, pre_transform_spec_json, debug=False):
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_CAPTURE_WITNESS": capture_witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_TRIAL_SEED": str(trial_seed),
        "GDB_DRIVER_VARIANT": variant,
        "GDB_DRIVER_OUTDIR": out_dir,
        "GDB_DRIVER_DIST_SPEC": dist_spec_json,
        "GDB_DRIVER_DEFAULT_DIST": default_dist,
        "GDB_DRIVER_PRE_TRANSFORM_SPEC": pre_transform_spec_json,
    })
    expected_out = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    stdout_target = None if debug else subprocess.DEVNULL
    stderr_target = None if debug else subprocess.DEVNULL

    driver_script = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                  "driver_internal_capture.py")

    result = None
    try:
        result = subprocess.run(
            ["gdb-multiarch", "-nx", "-batch", "-x", driver_script],
            env=env, stdout=stdout_target, stderr=stderr_target,
            timeout=TRIAL_TIMEOUT_SEC,
        )
    except subprocess.TimeoutExpired:
        print(f"[!] trial seed={trial_seed} variant={variant} HUNG "
              f"(>{TRIAL_TIMEOUT_SEC}s) -- killed, no output written")
        return False
    finally:
        qemu_proc.terminate()
        try:
            qemu_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            qemu_proc.kill()
            qemu_proc.wait()

    if not os.path.exists(expected_out):
        rc = result.returncode if result is not None else "N/A"
        print(f"[!] trial seed={trial_seed} variant={variant} produced NO "
              f"output file at {expected_out} -- gdb exit code {rc}. "
              f"Re-run with --debug to see gdb's actual output.")
        return False
    return True


def parse_dist_spec(raw):
    """Parses --dist-spec into a validated dict[buffer_name] -> dist
    key, accepting either a JSON object string or a comma-separated
    name=dist list for convenience on the command line, e.g.:
        --dist-spec '{"s1":"eta2","s2":"eta2"}'
        --dist-spec 's1=eta2,s2=eta2'
    """
    if raw is None:
        return {}
    raw = raw.strip()
    if not raw:
        return {}

    if raw.startswith("{"):
        try:
            spec = json.loads(raw)
        except json.JSONDecodeError as e:
            raise argparse.ArgumentTypeError(f"--dist-spec is not valid JSON: {e}")
    else:
        spec = {}
        for pair in raw.split(","):
            pair = pair.strip()
            if not pair:
                continue
            if "=" not in pair:
                raise argparse.ArgumentTypeError(
                    f"--dist-spec entry '{pair}' is missing '=' "
                    f"(expected buffer_name=dist_key)"
                )
            name, dist_key = pair.split("=", 1)
            spec[name.strip()] = dist_key.strip()

    unknown = {v for v in spec.values() if v not in KNOWN_DISTRIBUTIONS}
    if unknown:
        raise argparse.ArgumentTypeError(
            f"--dist-spec references unknown distribution(s) {sorted(unknown)}. "
            f"Valid options: {sorted(KNOWN_DISTRIBUTIONS)}"
        )
    return spec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--capture-witness", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument("-n", type=int, default=400)
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--debug", action="store_true",
                     help="show gdb/qemu stdout+stderr instead of suppressing it")
    ap.add_argument(
        "--dist-spec", type=str, default=None,
        help="Per-buffer input distribution, as JSON "
             "('{\"s1\":\"eta2\",\"s2\":\"eta2\"}') or comma-separated "
             "name=dist pairs ('s1=eta2,s2=eta2'). Buffers not listed "
             "fall back to --default-dist. Valid distribution keys: "
             + ", ".join(sorted(KNOWN_DISTRIBUTIONS))
    )
    ap.add_argument(
        "--default-dist", type=str, default="uniform_bytes",
        choices=sorted(KNOWN_DISTRIBUTIONS),
        help="Distribution used for any input buffer not named in "
             "--dist-spec (default: uniform_bytes, i.e. legacy "
             "raw-byte behavior)."
    )
    ap.add_argument(
        "--pre-transform-spec", type=str, default=None,
        help="JSON list of {\"label\",\"func\",\"arg_name\",\"size\"} "
             "objects, each capturing a buffer's value at a callee's "
             "entry point BEFORE that callee mutates it in place (e.g. "
             "capturing s1 before polyvecl_ntt transforms it). Example: "
             "'[{\"label\":\"s1_pre_ntt\","
             "\"func\":\"pqcrystals_dilithium2_ref_polyvecl_ntt\","
             "\"arg_name\":\"v\",\"size\":4096}]'"
    )
    args = ap.parse_args()

    dist_spec = parse_dist_spec(args.dist_spec)
    dist_spec_json = json.dumps(dist_spec)

    if args.pre_transform_spec:
        try:
            pre_transform_spec = json.loads(args.pre_transform_spec)
        except json.JSONDecodeError as e:
            raise SystemExit(f"error: --pre-transform-spec is not valid JSON: {e}")
        if not isinstance(pre_transform_spec, list):
            raise SystemExit("error: --pre-transform-spec must be a JSON list")
        for spec in pre_transform_spec:
            missing = [k for k in ("label", "func", "arg_name", "size") if k not in spec]
            if missing:
                raise SystemExit(
                    f"error: --pre-transform-spec entry {spec} missing "
                    f"required key(s): {missing}"
                )
        pre_transform_spec_json = json.dumps(pre_transform_spec)
    else:
        pre_transform_spec_json = "[]"

    os.makedirs(args.outdir, exist_ok=True)

    if dist_spec:
        print(f"[i] per-buffer distributions: {dist_spec} "
              f"(default for unlisted buffers: '{args.default_dist}')")
    else:
        print(f"[i] no --dist-spec given -- all input buffers use "
              f"'{args.default_dist}'")

    n_ok = 0
    for i in range(args.n):
        print(f"=== trial {i} ===")
        ok_c = run_collect_trial(args.correct_elf, args.capture_witness, args.func,
                                  i, "correct", args.outdir, args.machine,
                                  dist_spec_json, args.default_dist,
                                  pre_transform_spec_json, args.debug)
        ok_f = run_collect_trial(args.faulty_elf, args.capture_witness, args.func,
                                  i, "faulty", args.outdir, args.machine,
                                  dist_spec_json, args.default_dist,
                                  pre_transform_spec_json, args.debug)
        if ok_c and ok_f:
            n_ok += 1

    print(f"[i] done. {n_ok}/{args.n} trial pairs successfully written to {args.outdir}")


if __name__ == "__main__":
    main()