#!/usr/bin/env python3
"""range_check.py — a generic "declared-range" fault test, run in-process via
Unicorn (dist_tests/common/machine.py) against a pair of gated whole-program
ELFs (a correct build and a faulty build).

What this test is (standalone, not defined in terms of the other tests)
-----------------------------------------------------------------------
Many variables in these schemes are, by specification, confined to a fixed,
publicly known domain, and a correct implementation keeps them there on EVERY
input (e.g. Dilithium's released response `z` always satisfies ||z||_inf <
GAMMA1-BETA, because rejection sampling discards any candidate that does not;
Kyber's CBD secret/error coefficients always lie in [-eta, eta]). A fault that
skips a bound check, bypasses a reduction, or corrupts a value can push the
variable OUT of its declared domain.

This test monitors declared variables against their declared domains:

    declaration : (observation point, pointer argument, shape, valid range)
    capture     : hook the observation point, read the variable, evaluate the
                  range predicate, record pass/fail and the extremal value
    control     : the correct build must stay in range on every swept seed
                  (this validates that the declared range really is an invariant)
    detection   : the faulty build leaves the range on some seed while the
                  correct build never does

It is fully generic: covering a new variable is just another (point, range)
row in a scheme config -- no new logic. It leaves every other test untouched.

The flagship instance is the Dilithium "polytope / tail" fault (Azevedo-Oliveira
et al., *Finding a polytope*): skipping the `||z||_inf < GAMMA1-BETA` rejection
check (polyvecl_chknorm on z) makes the signer EMIT a signature whose `z` sits in
the forbidden tail [GAMMA1-BETA, GAMMA1) -- exactly an out-of-range release that
this test catches at `pack_sig` (where the accepted `z` is finalized).

How a variable is captured
--------------------------
We boot the gated ELF to `main`, snapshot a clean machine, then for each secret
seed we CALL the observation entry directly with our own buffers placed in the
MPS2 scratch RAM (the same technique as secret_vector_dist.py -- robust whether
or not the KAT harness yields a clean entry). A probe hooks a chosen symbol and
reads the pointed variable either:

    when="entry"  -- the variable is an already-populated INPUT at the hooked
                     call (e.g. `z` passed to pack_sig): read it at entry.
    when="return" -- the variable is written DURING the hooked call (e.g. a
                     poly written by a sampler): record the pointer at entry,
                     read it at the call's return.

Driven by dist_tests/{kyber,dilithium}/run_range_dist.sh, or run directly with
--scheme.
"""

import argparse
import json
import os
import struct
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from dist_tests.common.machine import Machine, EmulationError  # noqa: E402

RUN_TIMEOUT_US = 60_000_000

# Same direct-call layout as secret_vector_dist.py.
SCRATCH_BASE = 0x30000000      # MPS2_AN386 scratch region (1 MiB)
CALL_SP = 0x300F0000           # call stack top, well above the arg buffers
RET_TRAP = 0x1F000000          # trampoline region; entry returns here and stops


# --------------------------------------------------------------------------
# range predicates
# --------------------------------------------------------------------------

def _decode(raw, coeff_bytes):
    """Decode a variable's raw bytes into signed coefficients."""
    n = len(raw) // coeff_bytes
    fmt = {1: "<%db" % n, 2: "<%dh" % n, 4: "<%di" % n}[coeff_bytes]
    return list(struct.unpack(fmt, raw[: n * coeff_bytes]))


def eval_pred(coeffs, pred):
    """Return (in_range, metric) for a list of signed coefficients.

    `metric` is the extremal coefficient that decides the predicate, kept for
    reporting (it is the one that would violate, or the closest to doing so).

    Predicate kinds (all with a fixed, spec-defined bound):
      inf_norm_lt {bound}   : max |c| <  bound   (centered signed coeffs,
                              matching Dilithium's poly_chknorm == max|coeff|)
      inf_norm_le {bound}   : max |c| <= bound
      coeff_range {lo, hi}  : every lo <= c <= hi
      weight_le   {bound}   : #{c != 0} <= bound
    """
    kind = pred["kind"]
    if kind in ("inf_norm_lt", "inf_norm_le"):
        metric = 0
        for c in coeffs:
            a = -c if c < 0 else c
            if a > metric:
                metric = a
        ok = metric < pred["bound"] if kind == "inf_norm_lt" else metric <= pred["bound"]
        return ok, metric
    if kind == "coeff_range":
        lo, hi = pred["lo"], pred["hi"]
        worst = 0
        ok = True
        for c in coeffs:
            if c < lo or c > hi:
                ok = False
                # keep the coefficient furthest outside the band
                d = (lo - c) if c < lo else (c - hi)
                if d > abs(worst):
                    worst = c
        if ok:
            # in range: report the extremal magnitude as the metric
            worst = max(coeffs, key=abs, default=0)
        return ok, worst
    if kind == "weight_le":
        w = sum(1 for c in coeffs if c != 0)
        return w <= pred["bound"], w
    raise ValueError(f"unknown predicate kind: {kind!r}")


def pred_desc(pred):
    k = pred["kind"]
    if k == "inf_norm_lt":
        return f"||.||_inf < {pred['bound']}"
    if k == "inf_norm_le":
        return f"||.||_inf <= {pred['bound']}"
    if k == "coeff_range":
        return f"coeff in [{pred['lo']}, {pred['hi']}]"
    if k == "weight_le":
        return f"weight <= {pred['bound']}"
    return k


# --------------------------------------------------------------------------
# scheme config
# --------------------------------------------------------------------------

class RangeConfig:
    """Everything that varies between schemes / observation points.

    call_args: the entry's arguments in order, each a (name, kind, v) tuple,
      exactly as in secret_vector_dist.py:
        "out"    -> pointer to a zeroed output buffer of v bytes
        "in"     -> pointer to a zeroed input  buffer of v bytes
        "secret" -> pointer to the swept secret-seed buffer of v bytes
        "scalar" -> the immediate integer v (passed by value)

    probes: a list of dicts, each declaring one range-monitored variable:
        name       -> label
        symbol     -> symbol to hook (the observation point)
        ptr_reg    -> which arg register (0..3) holds the pointer to the variable
        n_elems    -> number of coefficients in the variable
        coeff_bytes-> 1, 2 (i16) or 4 (i32) per coefficient
        when       -> "entry" (variable already populated) or "return"
        pred       -> the range predicate (see eval_pred)
        desc       -> human description
    """

    def __init__(self, name, entry, call_args, probes):
        self.name = name
        self.entry = entry
        self.call_args = call_args
        self.probes = probes
        secret = [a for a in call_args if a[1] == "secret"]
        if len(secret) != 1:
            raise ValueError("exactly one 'secret' call arg is required")
        self.secret_len = secret[0][2]


# --------------------------------------------------------------------------
# session
# --------------------------------------------------------------------------

class RangeSession:
    """Boot one gated ELF, snapshot a clean machine, and capture each declared
    variable for an arbitrary secret seed by CALLING the entry directly."""

    def __init__(self, elf_path, cfg):
        self.cfg = cfg
        self.elf_path = elf_path
        m = Machine.from_elf(elf_path)
        self.m = m
        m.run_until("main")

        try:
            self.entry_addr = m.addr_of(cfg.entry)
        except KeyError:
            raise EmulationError(f"{elf_path}: no symbol named {cfg.entry!r}")

        # The gated fuse_back design keeps the entry's ORIGINAL body and rewrites
        # its CALL SITES to dispatch to a `<entry>__faulted` clone on the target
        # occurrence. When the fault lives INSIDE the entry we call directly
        # (e.g. the z-norm check skip in signature_internal), jumping to the
        # entry symbol runs the unfaulted original and the gate never fires. So
        # if the faulted clone exists, call IT -- that is exactly the entry's
        # behaviour when the fault is active. (Faults in callees have no
        # `<entry>__faulted`; we call the entry and their in-body gated call
        # sites dispatch to the faulted callee as usual.)
        self.faulted = False
        try:
            self.entry_addr = m.addr_of(cfg.entry + "__faulted")
            self.faulted = True
        except KeyError:
            pass

        self.probe_addr = {}
        for p in cfg.probes:
            try:
                self.probe_addr[p["name"]] = m.addr_of(p["symbol"])
            except KeyError:
                raise EmulationError(
                    f"{elf_path}: no symbol named {p['symbol']!r} "
                    f"(probe {p['name']!r})")

        # Lay out the pointer arguments sequentially in the scratch region.
        self.arg_addr = {}
        self.secret_addr = None
        a = SCRATCH_BASE
        for name, kind, v in cfg.call_args:
            if kind == "scalar":
                continue
            a = (a + 7) & ~7
            self.arg_addr[name] = a
            if kind == "secret":
                self.secret_addr = a
            a += v
        if a >= CALL_SP:
            raise EmulationError("scratch arg buffers overflow the call stack")
        self.snap = m.snapshot()

        # For return-mode probes, learn the call's return address(es) once.
        self.probe_rets = {}
        for p in cfg.probes:
            if p["when"] == "return":
                self.probe_rets[p["name"]] = self._probe_rets(
                    self.probe_addr[p["name"]], p["name"])

    def _setup_call(self, seed_bytes):
        cfg = self.cfg
        m = self.m
        reg_vals = []
        stack_vals = []
        for i, (name, kind, v) in enumerate(cfg.call_args):
            if kind == "scalar":
                val = v
            else:
                addr = self.arg_addr[name]
                m.write(addr, b"\x00" * v)
                val = addr
            (reg_vals if i < 4 else stack_vals).append(val)
        m.write(self.secret_addr, bytes(seed_bytes))
        for i, val in enumerate(reg_vals):
            m.set_reg(f"r{i}", val)
        sp = CALL_SP
        if stack_vals:
            sp -= (len(stack_vals) * 4 + 7) & ~7
            for k, val in enumerate(stack_vals):
                m.write(sp + 4 * k, struct.pack("<I", val & 0xFFFFFFFF))
        m.set_reg("sp", sp)
        m.set_reg("lr", RET_TRAP)

    def _probe_rets(self, sym_addr, name):
        """One cheap run to learn the return address(es) of a return-mode
        probe symbol (the LR at each call)."""
        m = self.m
        m.restore(self.snap)
        self._setup_call(b"\x00" * self.cfg.secret_len)
        rets = []

        def h(machine, address, size):
            if len(rets) < 16:
                rets.append(machine.reg("lr") & ~1)

        hh = m.hook_code(h, begin=sym_addr, end=sym_addr, precise=False)
        try:
            m._emu_start(self.entry_addr | 1, RET_TRAP, timeout=RUN_TIMEOUT_US)
        except EmulationError:
            pass
        finally:
            m.unhook(hh)
        if not rets:
            raise EmulationError(
                f"{self.elf_path}: probe symbol for {name!r} never reached "
                f"when calling {self.cfg.entry} directly")
        return sorted(set(rets))

    def capture(self, seed_bytes):
        """Return {probe_name: [(in_range, metric), ...]} for this seed -- one
        tuple per observation of that variable (usually one)."""
        cfg = self.cfg
        m = self.m
        m.restore(self.snap)
        self._setup_call(seed_bytes)

        out = {p["name"]: [] for p in cfg.probes}
        pend = {}
        handles = []

        def make_entry(p):
            buflen = p["n_elems"] * p["coeff_bytes"]
            reg = "r%d" % p["ptr_reg"]
            if p["when"] == "entry":
                def h(machine, address, size):
                    ptr = machine.reg(reg)
                    raw = bytes(machine.read(ptr, buflen))
                    out[p["name"]].append(eval_pred(_decode(raw, p["coeff_bytes"]),
                                                     p["pred"]))
                return h

            def h(machine, address, size):
                pend[p["name"]] = machine.reg(reg)
            return h

        def make_ret(p):
            buflen = p["n_elems"] * p["coeff_bytes"]

            def h(machine, address, size):
                if p["name"] in pend:
                    ptr = pend.pop(p["name"])
                    raw = bytes(machine.read(ptr, buflen))
                    out[p["name"]].append(eval_pred(_decode(raw, p["coeff_bytes"]),
                                                    p["pred"]))
            return h

        for p in cfg.probes:
            a = self.probe_addr[p["name"]]
            handles.append(m.hook_code(make_entry(p), begin=a, end=a, precise=False))
            if p["when"] == "return":
                hr = make_ret(p)
                for ra in self.probe_rets[p["name"]]:
                    handles.append(m.hook_code(hr, begin=ra, end=ra, precise=False))

        try:
            m._emu_start(self.entry_addr | 1, RET_TRAP, timeout=RUN_TIMEOUT_US)
        except EmulationError:
            # A faulty build may fault downstream of an observation it already
            # made; keep what we captured (a partial capture is still a finding).
            pass
        finally:
            for h in handles:
                m.unhook(h)
        return out


# --------------------------------------------------------------------------
# collect / compare / run
# --------------------------------------------------------------------------

def collect(label, elf_path, seeds, cfg):
    sess = RangeSession(elf_path, cfg)
    probes = {p["name"]: {"symbol": p["symbol"], "desc": p["desc"],
                          "pred": pred_desc(p["pred"]),
                          "n_obs": 0, "n_violations": 0, "worst_metric": 0,
                          "violation_samples": []}
              for p in cfg.probes}
    reached = False
    for s in seeds:
        res = sess.capture(s)
        for p in cfg.probes:
            d = probes[p["name"]]
            for ok, metric in res[p["name"]]:
                reached = True
                d["n_obs"] += 1
                if abs(metric) > abs(d["worst_metric"]):
                    d["worst_metric"] = metric
                if not ok:
                    d["n_violations"] += 1
                    if len(d["violation_samples"]) < 8:
                        d["violation_samples"].append(metric)
    if not reached:
        raise EmulationError(
            f"{elf_path}: no declared variable was ever observed "
            f"(observation points never reached)")

    res = {"label": label.strip(), "elf": elf_path, "n_seeds": len(seeds),
           "probes": probes}
    for name, d in probes.items():
        print(f"[i] {label}: {name} ({d['pred']}): "
              f"{d['n_violations']}/{d['n_obs']} observation(s) OUT OF RANGE, "
              f"worst metric {d['worst_metric']}")
    return res


def compare(res_c, res_f, cfg):
    probes = {}
    any_detect = False
    for p in cfg.probes:
        name = p["name"]
        c = res_c["probes"][name]
        f = res_f["probes"][name]
        # Detection: the faulty build leaves the range while the correct build
        # never does -- or simply violates strictly more often than correct.
        detected = (f["n_violations"] > 0 and c["n_violations"] == 0) or \
                   (f["n_violations"] > c["n_violations"])
        probes[name] = {
            "desc": c["desc"], "pred": c["pred"],
            "correct_violations": c["n_violations"], "correct_obs": c["n_obs"],
            "faulty_violations": f["n_violations"], "faulty_obs": f["n_obs"],
            "correct_worst_metric": c["worst_metric"],
            "faulty_worst_metric": f["worst_metric"],
            "faulty_violation_samples": f["violation_samples"],
            "detected": detected,
        }
        any_detect = any_detect or detected
    return {"probes": probes, "range_fault_detected": any_detect}


def run(cfg, correct_elf, faulty_elf, seeds, report=None):
    print("=" * 74)
    print(f"{cfg.name}: declared-range (out-of-bound release) test")
    print("=" * 74)
    try:
        res_c = collect("correct", correct_elf, seeds, cfg)
        res_f = collect("faulty ", faulty_elf, seeds, cfg)
    except EmulationError as e:
        print(f"[!] emulation failed: {e}", file=sys.stderr)
        return 2

    cmp = compare(res_c, res_f, cfg)
    print()
    print("=" * 74)
    print("Verdict")
    print("=" * 74)
    for name, d in cmp["probes"].items():
        print(f"[probe] {name}: {d['desc']}")
        print(f"[i] out-of-range observations: correct "
              f"{d['correct_violations']}/{d['correct_obs']} vs faulty "
              f"{d['faulty_violations']}/{d['faulty_obs']} "
              f"(predicate {d['pred']})")
        print(f"[i] worst value: correct {d['correct_worst_metric']} vs "
              f"faulty {d['faulty_worst_metric']}")
        if d["detected"]:
            print(f"[!] OUT-OF-RANGE RELEASE: the faulty build emitted {name} "
                  f"outside its declared range ({d['pred']}) on "
                  f"{d['faulty_violations']} observation(s) while the correct "
                  f"build never did -- a bound/validity check was bypassed "
                  f"(e.g. the Dilithium polytope/tail fault: skipped z-norm "
                  f"rejection). samples: {d['faulty_violation_samples']}")
        else:
            print(f"[i] {name} stayed within its declared range in both builds.")

    exit_code = 1 if cmp["range_fault_detected"] else 0

    if report:
        with open(report, "w") as fh:
            json.dump({"scheme": cfg.name, "correct": res_c, "faulty": res_f,
                       "comparison": cmp,
                       "range_fault_detected": cmp["range_fault_detected"],
                       "leak_detected": exit_code == 1}, fh, indent=2)
        print(f"[i] report written to {report}")
    return exit_code


# --------------------------------------------------------------------------
# built-in scheme configs
# --------------------------------------------------------------------------

def dilithium_config():
    # Observation point: pack_sig(sig, c, &z, &h) -- &z is arg r2, the ACCEPTED
    # response of the emitted signature. Declared range: ||z||_inf < GAMMA1-BETA
    # (= 131072 - 78 = 130994 for Dilithium2), exactly the rejection bound that
    # polyvecl_chknorm(z, GAMMA1-BETA) enforces. The correct build only reaches
    # pack_sig with an in-range z; a skip of that check (the polytope / tail
    # fault) emits a z in the forbidden tail [GAMMA1-BETA, GAMMA1).
    #
    # z is a polyvecl: L=4 polynomials x N=256 int32 = 1024 coeffs (4096 bytes).
    # Same direct-call args as the Dilithium nonce-reuse test (zeroed valid-shaped
    # sk; the rejection loop runs on norms alone, so it still reaches pack_sig).
    return RangeConfig(
        name="Dilithium",
        entry="pqcrystals_dilithium2_ref_signature_internal",
        call_args=[("sig", "out", 2500), ("siglen", "out", 4),
                   ("m", "in", 32), ("mlen", "scalar", 32),
                   ("pre", "in", 2), ("prelen", "scalar", 0),
                   ("rnd", "secret", 32), ("sk", "in", 2560)],
        probes=[
            {
                # OUTPUT: the released response z, read at pack_sig(sig, c, &z, &h)
                # (&z is arg r2) -- the accepted signature's z. Skipping the
                # z-norm rejection check (the polytope / tail fault) emits a z in
                # the forbidden tail [GAMMA1-BETA, GAMMA1).
                "name": "z", "symbol": "pqcrystals_dilithium2_ref_pack_sig",
                "ptr_reg": 2, "n_elems": 1024, "coeff_bytes": 4, "when": "entry",
                "pred": {"kind": "inf_norm_lt", "bound": 130994},
                "desc": "released response z: ||z||_inf < GAMMA1-BETA (=130994)",
            },
            {
                # EPHEMERAL: the mask y, one poly per poly_uniform_gamma1(&y_i,
                # seed, nonce) call (&y_i is arg r0, written during the call).
                # ExpandMask coeffs lie in (-GAMMA1, GAMMA1] = [-131071, 131072];
                # a fault in the sampler / polyz_unpack pushes one out.
                "name": "y", "symbol": "pqcrystals_dilithium2_ref_poly_uniform_gamma1",
                "ptr_reg": 0, "n_elems": 256, "coeff_bytes": 4, "when": "return",
                "pred": {"kind": "coeff_range", "lo": -131071, "hi": 131072},
                "desc": "mask y: coeff in (-GAMMA1, GAMMA1] = [-131071, 131072]",
            },
            {
                # PUBLIC: the challenge c, written by poly_challenge(&c, seed)
                # (&c is arg r0). SampleInBall produces coeffs in {-1, 0, 1}; a
                # fault in the challenge expansion pushes one out of that set.
                "name": "c", "symbol": "pqcrystals_dilithium2_ref_poly_challenge",
                "ptr_reg": 0, "n_elems": 256, "coeff_bytes": 4, "when": "return",
                "pred": {"kind": "coeff_range", "lo": -1, "hi": 1},
                "desc": "challenge c: coeff in {-1, 0, 1}",
            },
        ])


def kyber_config():
    # Observation point: poly_getnoise_eta1(r, seed, nonce) -- r is arg r0, the
    # sampled secret/error polynomial, written during the call (when="return").
    # Declared range: CBD(eta1) coefficients lie in [-eta1, eta1] = [-2, 2] for
    # kyber768. A fault that biases/corrupts the sampler can push a coefficient
    # out of that fixed band. (Scaffold instance for Kyber; the demonstrated
    # detection is the Dilithium polytope fault above.)
    return RangeConfig(
        name="Kyber",
        entry="pqcrystals_kyber768_ref_indcpa_keypair_derand",
        call_args=[("pk", "out", 1184), ("sk", "out", 2400),
                   ("coins", "secret", 32)],
        probes=[
            {
                # SECRET/EPHEMERAL: the CBD secret/error polynomials, written by
                # poly_getnoise_eta1(&r, seed, nonce) (&r is arg r0, filled during
                # the call). kyber768 CBD(eta1=2) coeffs lie in [-2, 2].
                "name": "s_e",
                "symbol": "pqcrystals_kyber768_ref_poly_getnoise_eta1",
                "ptr_reg": 0, "n_elems": 256, "coeff_bytes": 2, "when": "return",
                "pred": {"kind": "coeff_range", "lo": -2, "hi": 2},
                "desc": "CBD secret/error coeffs in [-eta1, eta1] = [-2, 2]",
            },
            {
                # INTERMEDIATE: the public-key vector t = A.s + e after Barrett
                # reduction, read at poly_reduce(&t_i) (&t_i is arg r0, reduced
                # in place). Kyber's barrett_reduce returns the CENTERED
                # representative in [-(q-1)/2, (q-1)/2] = [-1664, 1664] (q=3329);
                # a fault in the reduction leaves a coefficient out of that band.
                "name": "t_reduced",
                "symbol": "pqcrystals_kyber768_ref_poly_reduce",
                "ptr_reg": 0, "n_elems": 256, "coeff_bytes": 2, "when": "return",
                "pred": {"kind": "coeff_range", "lo": -1664, "hi": 1664},
                "desc": "reduced t = A*s+e coeff in [-(q-1)/2, (q-1)/2] = [-1664, 1664]",
            },
        ])


CONFIGS = {"kyber": kyber_config, "dilithium": dilithium_config}


def main():
    import random
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--scheme", required=True, choices=sorted(CONFIGS))
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--n-seeds", type=int, default=16)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    cfg = CONFIGS[args.scheme]()
    for lbl, p in (("correct", args.correct_elf), ("faulty", args.faulty_elf)):
        if not os.path.isfile(p):
            print(f"[!] {lbl} ELF not found: {p}", file=sys.stderr)
            sys.exit(1)
    if args.n_seeds < 1:
        print("[!] --n-seeds must be >= 1", file=sys.stderr)
        sys.exit(1)

    rng = random.Random(args.seed)
    seeds = [bytes(rng.randrange(256) for _ in range(cfg.secret_len))
             for _ in range(args.n_seeds)]
    sys.exit(run(cfg, args.correct_elf, args.faulty_elf, seeds, args.report))


if __name__ == "__main__":
    main()
