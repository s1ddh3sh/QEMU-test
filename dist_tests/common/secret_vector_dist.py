#!/usr/bin/env python3
"""secret_vector_dist.py — shared core for the Kyber / Dilithium secret-vector
distribution + coordinate-equality test, run in-process via Unicorn
(dist_tests/common/machine.py) against a pair of gated whole-program ELFs (a
correct build and a faulty build).

Motivation (the "Number 'Not Used' Once" fault family, Ravi et al. 2019)
-----------------------------------------------------------------------
LWE/Fiat-Shamir schemes sample several secret polynomials from one seed, told
apart only by an incrementing one-byte/‑half nonce (a domain separator):

    Kyber keygen  : s[i] = CBD(PRF(noiseseed, i)),  e[i] = CBD(PRF(noiseseed, K+i))
                    (t = A*s + e)
    Dilithium sign: y[i] = ExpandMask(seed, L*kappa + i)          (the mask)

A fault that freezes the nonce makes two of these polynomials IDENTICAL
(s == e in Kyber, y[i] == y[j] in Dilithium), which collapses the LWE/mask
hardness. This test captures the sampled polynomials in both builds and reports

  1. their per-coefficient value DISTRIBUTION (histogram), and
  2. the fraction of COORDINATES at which a configured pair of polynomials is
     identical (e.g. s[i] vs e[i], or y[i] vs y[j]),

averaged over a sweep of N secret seeds, comparing correct vs faulty.

    correct : an equal-coordinate fraction near the chance level of the noise
              distribution (e.g. ~0.2 for Kyber CBD(eta=2))
    faulty  : near 1.0 for the collapsed pair(s) -> nonce reuse detected

How the polynomials are captured
--------------------------------
The per-polynomial sampler (poly_getnoise_eta1 / poly_uniform_gamma1) is hooked
at its entry. On each call we record the destination pointer (arg0), run just
that call's body to completion with a nested emu_start, and read the freshly
written polynomial BEFORE any later in-place transform (e.g. the NTT) can touch
it. Capturing per call makes the test independent of where the fault lives and
of whether downstream passes run.

This module is driven by the per-scheme wrappers
dist_tests/kyber/nonce_reuse_dist_kyber.py and
dist_tests/dilithium/nonce_reuse_dist_dilithium.py (which only supply a
SchemeConfig), or run directly with --scheme.
"""

import argparse
import collections
import json
import math
import os
import struct
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from dist_tests.common.machine import Machine, EmulationError  # noqa: E402

RUN_TIMEOUT_US = 60_000_000

# The gated whole-program `main` runs the scheme's full KAT self-test (Kyber's
# test_keys / Dilithium's test()), which in the bare-metal emulator pulls in a
# /dev/urandom-style randombytes and does not yield a single clean, hookable
# keygen/sign (it ends up spinning in _exit). So instead of booting through the
# harness, we CALL the observation entry directly with our own buffers placed
# in the MPS2 "scratch" RAM region -- the same way the per-function driver main
# does. This works on any build that keeps the entry + sampler as real calls
# (the base IR is `noinline optnone`, so they are), gated or not.
SCRATCH_BASE = 0x30000000      # MPS2_AN386 scratch region (1 MiB)
CALL_SP = 0x300F0000           # call stack top, well above the arg buffers
RET_TRAP = 0x1F000000          # trampoline region; entry returns here and stops


class SchemeConfig:
    """Everything that varies between Kyber and Dilithium.

    call_args: the entry's arguments in order, each a (name, kind, v) tuple:
      kind "out"    -> pointer to a zeroed output buffer of v bytes
      kind "in"     -> pointer to a zeroed input buffer of v bytes
      kind "secret" -> pointer to the swept secret-seed buffer of v bytes
      kind "scalar" -> the immediate integer v (passed by value)
    """

    def __init__(self, name, entry, sampler, n_coeffs, coeff_bytes,
                 n_polys, groups, pairs, pair_desc, call_args):
        self.name = name
        self.entry = entry                  # signing/keygen entry symbol
        self.sampler = sampler              # per-poly sampler symbol to hook
        self.n_coeffs = n_coeffs            # coeffs per polynomial (256)
        self.coeff_bytes = coeff_bytes      # 2 (Kyber i16) or 4 (Dilithium i32)
        self.n_polys = n_polys              # number of sampler calls to capture
        self.groups = groups                # {name: (lo, hi)} index slices
        self.pairs = pairs                  # [(i, j)] poly indices compared
        self.pair_desc = pair_desc          # human label for the pair metric
        self.call_args = call_args
        secret = [a for a in call_args if a[1] == "secret"]
        if len(secret) != 1:
            raise ValueError("exactly one 'secret' call arg is required")
        self.secret_len = secret[0][2]


def _coeffs(raw, coeff_bytes):
    """Decode a polynomial's raw bytes into signed coefficients."""
    n = len(raw) // coeff_bytes
    fmt = {2: "<%dh" % n, 4: "<%di" % n}[coeff_bytes]
    return list(struct.unpack(fmt, raw[: n * coeff_bytes]))


class SecretVectorSession:
    """Boot one gated ELF, snapshot a clean machine state, and capture the
    sampled secret polynomials for an arbitrary secret seed by CALLING the
    entry directly with our own buffers (not via the KAT harness)."""

    def __init__(self, elf_path, cfg):
        self.cfg = cfg
        self.elf_path = elf_path
        m = Machine.from_elf(elf_path)
        self.m = m
        # Boot far enough to load code and set up a valid machine; we take a
        # snapshot here and drive the entry ourselves from each restore.
        m.run_until("main")

        try:
            self.entry_addr = m.addr_of(cfg.entry)
        except KeyError:
            raise EmulationError(f"{elf_path}: no symbol named {cfg.entry!r}")
        self.sampler_addr = m.addr_of(cfg.sampler)

        # Lay out the pointer arguments sequentially in the scratch region.
        self.arg_addr = {}     # name -> address (pointer args only)
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
        self.sampler_rets = self._probe_sampler_rets()

    def _setup_call(self, seed_bytes):
        """Place arguments in scratch, zero the buffers, write the secret seed,
        and set registers/stack so emu_start runs the entry as a fresh call."""
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
        # Secret seed into its buffer.
        m.write(self.secret_addr, bytes(seed_bytes))
        for i, val in enumerate(reg_vals):
            m.set_reg(f"r{i}", val)
        # Args 5+ on the stack (AAPCS), 8-byte aligned.
        sp = CALL_SP
        if stack_vals:
            sp -= (len(stack_vals) * 4 + 7) & ~7
            for k, val in enumerate(stack_vals):
                m.write(sp + 4 * k, struct.pack("<I", val & 0xFFFFFFFF))
        m.set_reg("sp", sp)
        m.set_reg("lr", RET_TRAP)

    def _probe_sampler_rets(self):
        """One cheap run to learn the sampler's return address(es) -- each
        poly is later read exactly at its sampler's return (before any in-place
        transform). With consecutive calls at distinct return sites (Kyber,
        unrolled) there are several; in a loop (Dilithium's mask) they share
        one. Also confirms the sampler is reached at all."""
        m = self.m
        m.restore(self.snap)
        self._setup_call(b"\x00" * self.cfg.secret_len)
        rets = []

        def h(machine, address, size):
            if len(rets) < self.cfg.n_polys:
                rets.append(machine.reg("lr") & ~1)
                if len(rets) >= self.cfg.n_polys:
                    machine.uc.emu_stop()

        hh = m.hook_code(h, begin=self.sampler_addr, end=self.sampler_addr,
                         precise=False)
        try:
            m._emu_start(self.entry_addr | 1, RET_TRAP, timeout=RUN_TIMEOUT_US)
        except EmulationError:
            pass
        finally:
            m.unhook(hh)
        if not rets:
            raise EmulationError(
                f"{self.elf_path}: sampler {self.cfg.sampler} never reached "
                f"when calling {self.cfg.entry} directly")
        return sorted(set(rets))

    def capture(self, seed_bytes):
        """Return a list of coefficient lists, one per sampler call (in call
        order), for the given secret seed -- at most self.cfg.n_polys.

        Each polynomial is read at its sampler's RETURN (two-hook scheme: the
        entry hook records the destination, the return hook reads it), so it is
        captured immediately after it is written and before any later in-place
        transform (e.g. the NTT) can touch it, whatever the call structure."""
        cfg = self.cfg
        m = self.m
        m.restore(self.snap)
        self._setup_call(seed_bytes)
        poly_bytes = cfg.n_coeffs * cfg.coeff_bytes

        polys = []
        pend = {}

        def entry_hook(machine, address, size):
            if len(polys) < cfg.n_polys:
                pend["dest"] = machine.reg("r0")

        def ret_hook(machine, address, size):
            if "dest" in pend and len(polys) < cfg.n_polys:
                raw = bytes(machine.read(pend.pop("dest"), poly_bytes))
                polys.append(_coeffs(raw, cfg.coeff_bytes))
                if len(polys) >= cfg.n_polys:
                    machine.uc.emu_stop()

        handles = [m.hook_code(entry_hook, begin=self.sampler_addr,
                               end=self.sampler_addr, precise=False)]
        for ra in self.sampler_rets:
            handles.append(m.hook_code(ret_hook, begin=ra, end=ra, precise=False))
        try:
            m._emu_start(self.entry_addr | 1, RET_TRAP, timeout=RUN_TIMEOUT_US)
        except EmulationError:
            # A faulty build may fault downstream of the sampling it already
            # did; keep the polys captured so far (a partial capture is itself
            # a finding) rather than failing the whole seed.
            pass
        finally:
            for h in handles:
                m.unhook(h)
        return polys


# --------------------------------------------------------------------------
# statistics
# --------------------------------------------------------------------------

def _value_hist(coeff_lists):
    c = collections.Counter()
    for cl in coeff_lists:
        c.update(cl)
    total = sum(c.values()) or 1
    top = sorted(c.items(), key=lambda kv: -kv[1])[:9]
    return {str(v): cnt / total for v, cnt in sorted(top)}


def _equal_fraction(a, b):
    n = min(len(a), len(b))
    if n == 0:
        return 0.0
    return sum(1 for i in range(n) if a[i] == b[i]) / n


def collect(label, elf_path, seeds, cfg):
    sess = SecretVectorSession(elf_path, cfg)
    # one capture (list of coeff lists) per swept seed
    per_seed = [sess.capture(s) for s in seeds]
    if all(len(p) == 0 for p in per_seed):
        raise EmulationError(
            f"{elf_path}: the sampler {cfg.sampler} was never reached")
    # A build that samples FEWER polynomials than expected has had a secret
    # polynomial skipped entirely (e.g. a fnSkip on the sampler) -- recorded,
    # not errored, as it is itself a secret-handling fault.
    min_polys = min(len(p) for p in per_seed)
    full = [p for p in per_seed if len(p) == cfg.n_polys]

    group_hist = {}
    for gname, (lo, hi) in cfg.groups.items():
        allc = [poly for polys in per_seed for poly in polys[lo:hi]]
        group_hist[gname] = _value_hist(allc) if allc else {}

    # equal-coordinate fraction per configured pair, averaged over the seeds
    # where both polynomials of the pair were captured.
    pair_fracs = []
    for (i, j) in cfg.pairs:
        fr = [_equal_fraction(polys[i], polys[j]) for polys in per_seed
              if len(polys) > max(i, j)]
        pair_fracs.append(sum(fr) / len(fr) if fr else 0.0)
    mean_pair = sum(pair_fracs) / len(pair_fracs) if pair_fracs else 0.0

    res = {
        "label": label.strip(), "elf": elf_path, "n_seeds": len(seeds),
        "n_polys_expected": cfg.n_polys, "min_polys_captured": min_polys,
        "n_full_seeds": len(full),
        "group_hist": group_hist,
        "pair_equal_fracs": pair_fracs,
        "mean_pair_equal_frac": mean_pair,
    }
    print(f"[i] {label}: {len(full)}/{len(seeds)} seed(s) sampled all "
          f"{cfg.n_polys} polys (min captured {min_polys})")
    for gname in cfg.groups:
        hs = " ".join(f"{k}:{v*100:.0f}%" for k, v in res["group_hist"][gname].items())
        print(f"[i] {label}: {gname} value dist (top): {hs}")
    print(f"[i] {label}: {cfg.pair_desc} equal-coordinate fraction "
          f"{mean_pair:.3f} (per pair: {[round(f,3) for f in pair_fracs]})")
    return res


def compare(res_c, res_f, cfg):
    fc = res_c["mean_pair_equal_frac"]
    ff = res_f["mean_pair_equal_frac"]
    # Nonce-reuse collapse: the faulty pair-equality is near-total AND much
    # higher than the correct build's chance level.
    reuse = ff >= 0.90 and ff >= fc + 0.40
    # Skipped-secret collapse: the faulty build samples fewer secret polys.
    missing = res_f["min_polys_captured"] < res_c["min_polys_captured"]
    return {"correct_equal_frac": fc, "faulty_equal_frac": ff, "delta": ff - fc,
            "correct_min_polys": res_c["min_polys_captured"],
            "faulty_min_polys": res_f["min_polys_captured"],
            "nonce_reuse": reuse, "missing_secret_poly": missing,
            "collapsed": reuse or missing}


def run(cfg, correct_elf, faulty_elf, seeds, report=None):
    print("=" * 74)
    print(f"{cfg.name}: secret-vector distribution + coordinate-equality test")
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
    print(f"[i] {cfg.pair_desc} equal-coordinate fraction: "
          f"correct {cmp['correct_equal_frac']:.3f} vs faulty "
          f"{cmp['faulty_equal_frac']:.3f} (delta {cmp['delta']:+.3f})")
    print(f"[i] secret polys sampled: correct {cmp['correct_min_polys']} vs "
          f"faulty {cmp['faulty_min_polys']} (of {cfg.n_polys} expected)")

    if cmp["nonce_reuse"]:
        print(f"[!] NONCE-REUSE COLLAPSE: in the faulty build the {cfg.pair_desc} "
              "polynomials are identical on almost every coordinate, while the "
              "correct build is near the noise chance level -- the sampling nonce "
              "no longer separates them, collapsing the LWE/mask hardness.")
        exit_code = 1
    elif cmp["missing_secret_poly"]:
        print(f"[!] MISSING SECRET POLY: the faulty build sampled only "
              f"{cmp['faulty_min_polys']} of {cfg.n_polys} secret polynomials "
              "(a sampler call was skipped), so part of the secret vector is left "
              "unset -- a secret-generation fault.")
        exit_code = 1
    else:
        print(f"[i] NO COLLAPSE: the faulty build's {cfg.pair_desc} polynomials are "
              "no more equal than the correct build's.")
        exit_code = 0

    if report:
        with open(report, "w") as f:
            json.dump({"scheme": cfg.name, "correct": res_c, "faulty": res_f,
                       "comparison": cmp, "collapse_detected": exit_code == 1},
                      f, indent=2)
        print(f"[i] report written to {report}")
    return exit_code


# --------------------------------------------------------------------------
# built-in scheme configs (also importable by the per-scheme wrappers)
# --------------------------------------------------------------------------

def kyber_config():
    # indcpa_keypair_derand(pk[1184], sk[2400], coins[32]); coins is the swept
    # secret seed. 6 getnoise calls in source order: s[0..2] (nonce 0..2),
    # e[0..2] (3..5).
    return SchemeConfig(
        name="Kyber", entry="pqcrystals_kyber768_ref_indcpa_keypair_derand",
        sampler="pqcrystals_kyber768_ref_poly_getnoise_eta1",
        n_coeffs=256, coeff_bytes=2,
        n_polys=6, groups={"s": (0, 3), "e": (3, 6)},
        pairs=[(0, 3), (1, 4), (2, 5)], pair_desc="s[i] vs e[i]",
        call_args=[("pk", "out", 1184), ("sk", "out", 2400),
                   ("coins", "secret", 32)])


def dilithium_config():
    # signature_internal(sig, siglen, m, mlen, pre, prelen, rnd, sk): the
    # per-signature mask y is 4 poly_uniform_gamma1 calls (L=4). A frozen nonce
    # makes the y polys collide. The swept secret is rnd (the signing
    # randomness that feeds the mask seed rho'); sk is a zeroed valid-shaped
    # buffer (the mask does not need a real key, only well-defined bytes).
    return SchemeConfig(
        name="Dilithium", entry="pqcrystals_dilithium2_ref_signature_internal",
        sampler="pqcrystals_dilithium2_ref_poly_uniform_gamma1",
        n_coeffs=256, coeff_bytes=4,
        n_polys=4, groups={"y": (0, 4)},
        pairs=[(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)],
        pair_desc="y[i] vs y[j]",
        call_args=[("sig", "out", 2500), ("siglen", "out", 4),
                   ("m", "in", 32), ("mlen", "scalar", 32),
                   ("pre", "in", 2), ("prelen", "scalar", 0),
                   ("rnd", "secret", 32), ("sk", "in", 2560)])


CONFIGS = {"kyber": kyber_config, "dilithium": dilithium_config}


def main():
    import random
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--scheme", required=True, choices=sorted(CONFIGS))
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--n-seeds", type=int, default=32)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    cfg = CONFIGS[args.scheme]()
    for lbl, p in (("correct", args.correct_elf), ("faulty", args.faulty_elf)):
        if not os.path.isfile(p):
            print(f"[!] {lbl} ELF not found: {p}", file=sys.stderr)
            sys.exit(1)
    if args.n_seeds < 2:
        print("[!] --n-seeds must be >= 2", file=sys.stderr)
        sys.exit(1)

    rng = random.Random(args.seed)
    seeds = [bytes(rng.randrange(256) for _ in range(cfg.secret_len))
             for _ in range(args.n_seeds)]
    sys.exit(run(cfg, args.correct_elf, args.faulty_elf, seeds, args.report))


if __name__ == "__main__":
    main()
