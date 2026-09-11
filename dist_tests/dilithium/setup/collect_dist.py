#!/usr/bin/env python3
"""
collect_dist.py — two collection modes sharing the same correct/faulty
QEMU-boot machinery:

  --mode sweep   (default, original behaviour)
      Sweeps a chosen secret position through every value in
      [0, field_mod), running both correct.elf and faulty.elf at each
      value, with ONE shared background input p held fixed across the
      entire sweep (same trial_seed for every run). Every OTHER
      input buffer/scalar is filled from its declared "distribution" in
      qemu_witness.json (see driver_dist.py's sample_for_distribution)
      rather than a flat uniform fill, so the background stays a
      realistic Dilithium-shaped input; only the swept byte/coefficient
      itself is forced to an explicit value. This is the byte/coefficient
      -granular ineffective/correction-test collector.

  --mode trials  (new: distribution-test collector)
      Collects N independently-randomized trial PAIRS: for t in
      [0, num_trials), runs correct.elf and faulty.elf with trial_seed=
      base_seed+t and NO override at all -- every input (secrets
      included) is drawn fresh from its declared distribution, same as
      a real signing call. Output files are named exactly like the
      sweep mode's per-trial dumps (correct_trial######.json /
      faulty_trial######.json), so the SAME downstream trial-JSON format
      (dist_test.py, or any existing ineffective/correction reader) can
      load them.

      Unlike sweep mode, this produces two i.i.d. POPULATIONS -- N
      correct-ELF outputs and N faulty-ELF outputs, under freshly
      randomized secrets/messages/nonces each trial -- which is exactly
      what a two-sample distribution test (KS, Mann-Whitney, a
      two-proportion test on a band-membership statistic, ...) needs.
      It does NOT test whether a specific coefficient value is
      responsible for anything; it tests whether the *shape* of the
      output differs between the two ELFs at all. See dist_test.py for
      the actual statistical tests run on this mode's output.

Dilithium note on --secret-pos (sweep mode only): the override is a BYTE
position, and a Dilithium coefficient is int32_t, i.e. FOUR bytes
little-endian. To sweep coefficient i's low byte, pass
--secret-pos $((4*i)). Sweeping an arbitrary position is still
meaningful (it's a byte-granular fault analysis), but position i is NOT
coefficient i.

For a COEFFICIENT-SHAPED secret buffer (see driver_dist.py's
_lookup_distribution/is_coeff_shaped check), the override writes the
FULL 4-byte little-endian encoding of secret_val into the coefficient
containing secret_pos -- not just secret_pos's own byte -- so sv=0..
field_mod-1 sweeps genuine coefficient VALUES 0..field_mod-1, letting
--field-mod 8380417 (Dilithium Q) cover the coefficient's entire
domain. For a non-coefficient (byte-string) secret buffer, only the
single byte at secret_pos is overridden, same as before.

Cost:
  sweep mode:  field_mod * 2 QEMU boots total (e.g. 256 * 2 = 512 for a
               full-byte sweep) -- enough to look up every (s1, s2)
               pair's raw output bytes, since all pairs share the same
               field_mod already-computed per-value results. This does
               NOT produce a statistical test (no p-values) -- it's a
               raw, descriptive comparison for a single background p.
               For a real hypothesis test across multiple backgrounds,
               run this with several different --seed values and test
               the resulting per-seed distributions downstream;
               single-seed output here is meant to be read directly.
  trials mode: num_trials * 2 QEMU boots total. This DOES feed a real
               hypothesis test (dist_test.py) -- each trial is an
               independent draw, so the resulting correct-population vs
               faulty-population comparison has a genuine p-value.

Usage (sweep mode, original):
    python3 collect_dist.py \
        --witness tests_dilithium/pqcrystals_dilithium2_ref_poly_ntt/qemu_witness.json \
        --active-lengths tests_dilithium/pqcrystals_dilithium2_ref_poly_ntt/active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func pqcrystals_dilithium2_ref_poly_ntt --field-mod 8380417 \
        --dilithium-mode 2 --secret-buf a --secret-pos 0 \
        --outdir tests_dilithium/pqcrystals_dilithium2_ref_poly_ntt/dist_paired

Usage (trials mode, new -- for the distribution test):
    python3 collect_dist.py --mode trials \
        --witness tests_dilithium/pqcrystals_dilithium2_ref_signature/qemu_witness.json \
        --active-lengths tests_dilithium/pqcrystals_dilithium2_ref_signature/active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func crypto_sign_signature_internal --field-mod 8380417 \
        --dilithium-mode 2 --num-trials 200 --seed 0 \
        --outdir tests_dilithium/pqcrystals_dilithium2_ref_signature/dist_trials
"""

import argparse
import json
import os
import subprocess
import time


class RunFailed(Exception):
    """Raised when a single correct/faulty run doesn't produce output."""


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


_DRIVER_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "driver_dist.py")


def run_one(elf_path, witness_path, active_lengths_path, func, field_mod,
            seed, variant, out_path, machine, fixed_scalars, dilithium_mode,
            secret_buf, secret_pos, secret_val):
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_WITNESS": witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_MODE": "collect",
        "GDB_DRIVER_FIELD_MOD": str(field_mod),
        "GDB_DRIVER_ACTIVE_LENGTHS": active_lengths_path,
        "GDB_DRIVER_TRIAL_SEED": str(seed),
        "GDB_DRIVER_VARIANT": variant,
        "GDB_DRIVER_OUTDIR": os.path.dirname(out_path),
        "GDB_DRIVER_FIXED_SCALARS": fixed_scalars,
        "GDB_DRIVER_DILITHIUM_MODE": str(dilithium_mode),
        "GDB_DRIVER_OVERRIDE_BUF": secret_buf,
        "GDB_DRIVER_OVERRIDE_POS": str(secret_pos),
        "GDB_DRIVER_OVERRIDE_VAL": str(secret_val),
    })
    try:
        # Captures output and enforces a timeout instead of DEVNULL-ing
        # everything -- any gdb/driver error (address resolution
        # failure, target crash, python traceback inside driver_dist.py,
        # etc.) needs to be visible, not swallowed.
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

    produced = os.path.join(os.path.dirname(out_path), f"{variant}_trial{seed:06d}.json")

    # A failed run and a successful one must not look identical to the
    # caller -- this is a hard error with gdb's actual output attached,
    # since that's the only place the real failure reason (a Python
    # traceback from driver_dist.py, a gdb.MemoryError, a crashed
    # target, etc) exists.
    if not os.path.exists(produced):
        raise RunFailed(
            f"{variant} run for {secret_buf}[{secret_pos}]={secret_val} "
            f"(seed={seed}) produced no output file (expected {produced}).\n"
            f"gdb exit code: {result.returncode}\n"
            f"--- gdb stdout ---\n{result.stdout}\n"
            f"--- gdb stderr ---\n{result.stderr}"
        )
    if os.path.abspath(produced) != os.path.abspath(out_path):
        os.replace(produced, out_path)


def run_sweep(args):
    """Original behaviour: byte/coefficient-granular secret sweep with
    a single shared background, correct vs faulty at every value."""
    os.makedirs(args.outdir, exist_ok=True)

    print(f"[i] sweeping {args.secret_buf}[{args.secret_pos}] over "
          f"{args.field_mod} values, background seed p={args.seed} "
          f"(shared across the whole sweep), DILITHIUM_MODE="
          f"{args.dilithium_mode}")
    if args.secret_pos % 4 != 0:
        print(f"[i] note: --secret-pos {args.secret_pos} is not a multiple "
              f"of 4; for a coefficient-shaped buffer this still selects "
              f"coefficient {args.secret_pos // 4} (the whole coefficient "
              f"is overridden regardless of which of its 4 bytes "
              f"secret_pos points at), but for a byte-string buffer it "
              f"targets a specific byte with no coefficient meaning.")
    print(f"[i] total executions: {args.field_mod} * 2 = {args.field_mod * 2}")

    failures = []
    for sval in range(args.field_mod):
        c_path = os.path.join(args.outdir, f"correct_sv{sval:03d}.json")
        f_path = os.path.join(args.outdir, f"faulty_sv{sval:03d}.json")
        print(f"  s={sval}: correct + faulty", flush=True)
        for variant, elf_path, out_path in (
            ("correct", args.correct_elf, c_path),
            ("faulty", args.faulty_elf, f_path),
        ):
            try:
                run_one(elf_path, args.witness, args.active_lengths, args.func,
                        args.field_mod, args.seed, variant, out_path, args.machine,
                        args.fixed_scalars, args.dilithium_mode,
                        args.secret_buf, args.secret_pos, sval)
            except RunFailed as e:
                # Don't let one failed run silently vanish and don't
                # abort the whole sweep on the first failure either --
                # report EVERY failure so the pattern (all of them?
                # just one sval? just one variant?) is visible, which is
                # itself useful diagnostic signal.
                print(f"[!] FAILED: {variant} sval={sval}\n{e}", flush=True)
                failures.append((variant, sval, str(e)))

    if failures:
        print(
            f"\n[!] {len(failures)}/{args.field_mod * 2} runs failed to "
            f"produce output. NO correct_sv*.json / faulty_sv*.json files "
            f"exist for the failed (variant, sval) pairs -- see the "
            f"per-failure gdb output above for the real cause (common "
            f"culprits: the secret-buf/secret-pos override hitting an "
            f"address that overlaps/aliases a different buffer due to a "
            f"qemu_witness.json layout bug, or the target crashing "
            f"outright). Fix the underlying issue and re-run -- do not "
            f"trust an empty dist_paired dir silently."
        )
        raise SystemExit(1)

    print(f"[i] done. {args.field_mod} secret values x 2 variants "
          f"= {args.field_mod * 2} runs in {args.outdir}")


def run_trials(args):
    """New: distribution-test collector. N independent trial pairs,
    every input (including secrets) freshly randomized from its
    declared distribution each trial, no override at all. Produces two
    i.i.d. populations (correct_trial*.json / faulty_trial*.json)
    suitable for a two-sample statistical test -- see dist_test.py.
    """
    os.makedirs(args.outdir, exist_ok=True)

    print(f"[i] collecting {args.num_trials} independent trial pairs "
          f"(correct vs faulty), base seed={args.seed}, "
          f"DILITHIUM_MODE={args.dilithium_mode}")
    print(f"[i] every input (secrets, nonce, message, ...) is freshly "
          f"randomized per trial from its declared distribution -- no "
          f"override is applied. This produces two i.i.d. populations, "
          f"not a per-value lookup table like --mode sweep.")
    print(f"[i] total executions: {args.num_trials} * 2 = {args.num_trials * 2}")

    failures = []
    for t in range(args.num_trials):
        seed = args.seed + t
        c_path = os.path.join(args.outdir, f"correct_trial{t:06d}.json")
        f_path = os.path.join(args.outdir, f"faulty_trial{t:06d}.json")
        print(f"  trial {t}: correct + faulty (seed={seed})", flush=True)
        for variant, elf_path, out_path in (
            ("correct", args.correct_elf, c_path),
            ("faulty", args.faulty_elf, f_path),
        ):
            try:
                # secret_buf="" never matches any layout name, and
                # secret_pos=-1 fails every "0 <= override_pos < width"
                # check in driver_dist.py -- both belt-and-braces ways
                # of guaranteeing the override branch is a complete
                # no-op, so every buffer (secrets included) gets a
                # plain fresh distribution-shaped sample this trial.
                run_one(elf_path, args.witness, args.active_lengths, args.func,
                        args.field_mod, seed, variant, out_path, args.machine,
                        args.fixed_scalars, args.dilithium_mode,
                        secret_buf="", secret_pos=-1, secret_val=-1)
            except RunFailed as e:
                print(f"[!] FAILED: {variant} trial={t}\n{e}", flush=True)
                failures.append((variant, t, str(e)))

    if failures:
        print(
            f"\n[!] {len(failures)}/{args.num_trials * 2} runs failed to "
            f"produce output. NO correct_trial*.json / faulty_trial*.json "
            f"files exist for the failed (variant, trial) pairs -- see "
            f"the per-failure gdb output above. Fix the underlying issue "
            f"and re-run -- a distribution test over a population with "
            f"missing/silently-skipped trials is not trustworthy."
        )
        raise SystemExit(1)

    print(f"[i] done. {args.num_trials} trials x 2 variants "
          f"= {args.num_trials * 2} runs in {args.outdir}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--mode", choices=("sweep", "trials"), default="sweep",
                     help="'sweep' (default): original byte/coefficient "
                          "secret-value sweep with a single shared "
                          "background, for ineffective/correction tests. "
                          "'trials': N independent randomized trial pairs "
                          "for a two-sample distribution test (dist_test.py).")
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument(
        "--field-mod", type=int, default=256,
        help="sweep mode: number of values to sweep the secret position "
             "through. trials mode: only used as the fallback uniform-"
             "byte range for any input with no declared 'distribution' "
             "(default: %(default)s). Pass 8380417 (Dilithium Q) for a "
             "sweep mode run over a coefficient-shaped secret buffer's "
             "ENTIRE domain -- see module docstring on the full-word "
             "override.",
    )
    ap.add_argument(
        "--dilithium-mode", type=int, default=2, choices=(2, 3, 5),
        help="Dilithium parameter set, used to pick "
             "K/L/ETA/TAU/GAMMA1/GAMMA2/OMEGA for distribution-aware "
             "background sampling (default: %(default)s). trace.h only "
             "emits PRINT_ARGS under DILITHIUM_MODE == 2, so witnesses "
             "are normally mode-2 -- change this only if the ELF under "
             "test really is another parameter set.",
    )
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--fixed-scalars", default="")
    ap.add_argument("--secret-buf", default=None,
                     help="required for --mode sweep; ignored for "
                          "--mode trials.")
    ap.add_argument("--secret-pos", type=int, default=None,
                     help="required for --mode sweep (BYTE position "
                          "within secret-buf); ignored for --mode trials. "
                          "Coefficients are int32_t, so coefficient i's "
                          "low byte is at position 4*i. For a "
                          "coefficient-shaped buffer, the WHOLE "
                          "coefficient containing this byte gets "
                          "overridden (see driver_dist.py), so any "
                          "position within it (typically 4*i) selects "
                          "coefficient i.")
    ap.add_argument("--seed", type=int, default=0,
                     help="sweep mode: single shared background seed p "
                          "for every run. trials mode: base seed -- "
                          "trial t uses seed = --seed + t.")
    ap.add_argument("--num-trials", type=int, default=200,
                     help="trials mode only: number of independent "
                          "correct/faulty trial pairs to collect "
                          "(default: %(default)s). Needs to be large "
                          "enough for the downstream test to have power "
                          "-- a few dozen is usually plenty for a fault "
                          "this gross (see dist_test.py), but a few "
                          "hundred gives comfortable margin and lets you "
                          "sanity-check the control (correct vs correct).")
    args = ap.parse_args()

    if args.mode == "sweep":
        if args.secret_buf is None or args.secret_pos is None:
            ap.error("--mode sweep requires --secret-buf and --secret-pos")
        run_sweep(args)
    else:
        run_trials(args)


if __name__ == "__main__":
    main()