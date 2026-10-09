"""Ineffective-fault decision logic shared by the MAYO / Kyber / Dilithium
tests (offline: ineffective_mayo.py; incremental: early_stop_sweep_unicorn.py).

Inputs are the observations  eq[k][s][pos] = (Delta(s, r_k, p_k)[pos] == 0)
over the N public seeds k (each seed k fixes one public background p_k and,
if the function has an ephemeral input, one ephemeral draw r_k shared by the
correct and faulty run), the swept secret values s, and output positions.

Two modes, matching the query in the document:

 eph=False  (no ephemeral input)
    forall p  exists s1,s2 :  Delta(s1,p) = 0  and  Delta(s2,p) != 0
    -> for EVERY seed k a pair exists; the pair may differ per seed.

 eph=True   (f has an ephemeral input r)
    forall p  exists s1,s2 :  (forall r Delta(s1,r,p)=0) and (forall r Delta(s2,r,p)!=0)
    One (p_k, r_k) per seed, so the inner "forall r" can only be checked
    across seeds: s1 must be ineffective, and s2 effective, on EVERY seed.
    (This also fixes the witness across p, i.e. it is at least as strong
    as the sentence; a leak that only appears because r changes the
    outcome is therefore not reported.)

A positive is a witness on the sampled (p, r) only: refutation is exact,
confirmation of the universal parts needs SMT / more seeds.
"""

import numpy as np


class IneffectiveTracker:
    """Incremental version: feed one swept secret value at a time."""

    def __init__(self, n_pos, n_seeds, eph):
        self.eph = bool(eph)
        shape = (n_pos,) if self.eph else (n_seeds, n_pos)
        self.has_inef = np.zeros(shape, dtype=bool)
        self.has_eff = np.zeros(shape, dtype=bool)
        self.val_inef = np.zeros(shape, dtype=np.int64)
        self.val_eff = np.zeros(shape, dtype=np.int64)

    def update(self, sv, eq):
        """eq: bool array (n_seeds, n) for secret value sv, n <= n_pos."""
        eq = np.asarray(eq, dtype=bool)
        n = eq.shape[1]
        if self.eph:
            inef, eff = eq.all(axis=0), (~eq).all(axis=0)
            sl = slice(0, n)
        else:
            inef, eff = eq, ~eq
            sl = (slice(None), slice(0, n))
        new = inef & ~self.has_inef[sl]
        self.val_inef[sl][new] = sv
        self.has_inef[sl] |= inef
        new = eff & ~self.has_eff[sl]
        self.val_eff[sl][new] = sv
        self.has_eff[sl] |= eff

    def hit(self):
        """None, or (pos, witnesses): witnesses = [(s_ineffective, s_effective)]
        (one entry in eph mode, one per seed otherwise)."""
        ok = self.has_inef & self.has_eff
        if not self.eph:
            ok = ok.all(axis=0)
        pos = np.flatnonzero(ok)
        if pos.size == 0:
            return None
        pos = int(pos[0])
        if self.eph:
            return pos, [(int(self.val_inef[pos]), int(self.val_eff[pos]))]
        return pos, [(int(self.val_inef[k, pos]), int(self.val_eff[k, pos]))
                     for k in range(self.val_inef.shape[0])]


def analyse(eq, eph):
    """Offline version. eq: bool array (K seeds, S secret values, P positions).
    Returns (n_pairs[P], leak[P]); n_pairs>0 iff leak."""
    eq = np.asarray(eq, dtype=bool)
    K, S, P = eq.shape
    if eph:
        n_t = eq.all(axis=0).sum(axis=0)
        n_f = (~eq).all(axis=0).sum(axis=0)
        pairs = n_t * n_f
    else:
        n_t = eq.sum(axis=1)            # (K, P)
        n_f = S - n_t
        pairs = (n_t * n_f).min(axis=0)
    return pairs, pairs > 0
