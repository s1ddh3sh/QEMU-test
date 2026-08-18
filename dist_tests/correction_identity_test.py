#!/usr/bin/env python3
"""correction_identity_test.py — checks whether delta = correct XOR faulty
equals one of the FUT's input operands directly, across N trials. This is
the deterministic version of the correction-based fault attack: if it
holds, delta literally IS the skipped/corrected operand, no statistics
needed to establish leakage."""

import glob, json
import numpy as np

def load_trials(dist_dir):
    trials = []
    for cpath in sorted(glob.glob(f"{dist_dir}/correct_trial*.json")):
        seed = cpath.split("correct_trial")[1].split(".json")[0]
        fpath = f"{dist_dir}/faulty_trial{seed}.json"
        c = json.load(open(cpath))
        f = json.load(open(fpath))
        trials.append((c, f))
    return trials

def compute_delta(c, f, out_buf="s", active_len=None):
    co, fo = np.array(c["outputs"][out_buf]), np.array(f["outputs"][out_buf])
    if active_len is not None:
        co, fo = co[:active_len], fo[:active_len]
    return np.bitwise_xor(co, fo)

def identity_match_rate(trials, delta_key, out_buf="s", active_len=None):
    """delta_key: which input buffer to compare delta against (e.g. 'Ox')"""
    matches, total = 0, 0
    per_position_matches = None
    for c, f in trials:
        delta = compute_delta(c, f, out_buf, active_len)
        candidate = np.array(c["inputs"][delta_key])[:len(delta)]
        match = (delta == candidate)
        if per_position_matches is None:
            per_position_matches = np.zeros(len(delta), dtype=int)
        per_position_matches += match.astype(int)
        matches += match.sum()
        total += len(delta)
    return matches / total, per_position_matches / len(trials)

if __name__ == "__main__":
    trials = load_trials("tests_mayo/mat_add/dist")
    ACTIVE_LEN = 78  # from calibration / active_lengths.json

    for candidate in ["Vdec", "Ox"]:
        overall_rate, per_pos = identity_match_rate(trials, candidate, active_len=ACTIVE_LEN)
        print(f"delta == {candidate}: overall match rate = {overall_rate:.4f}")
        print(f"  per-position match rate: {np.round(per_pos, 3)}")