# test_qemu — per-function fault-leakage testing for PQC implementations

This repo builds individual functions from three post-quantum crypto
implementations — **Dilithium** (ML-DSA), **Kyber** (ML-KEM), and **MAYO** —
into standalone bare-metal ARM Cortex-M4 ELF images, one function at a time,
and runs them to check whether an injected fault "leaks" a secret: does the
fault's effect on the function's output depend on the secret input, or does
it look the same regardless of what the secret was?

The faulty variants themselves are **not** produced by this repo — they come
from a separate IR-mutation tool (upstream, in the sibling `*-LLVM` repos)
that clones each function's LLVM IR and mutates one instruction (skip a
line, corrupt a binary operand, flip a load/store, etc.). This repo's job is
entirely **detection**: given a `correct.elf` and one or more `faulty.elf`
variants of the same function, decide whether the fault is statistically
visible from the outside.
<!-- 
## Repo layout

```
test_qemu/
├── dilithium_build.sh, kyber_build.sh, mayo_build.sh   # per-function .ll -> .elf build + witness extraction
├── dilithium.json, kyber.json, mayo.json               # per-function {"secret-buf", "fixed-scalars"} config
├── obj/, common/                                        # linker script, libpqm4hal, shared C sources
├── build/tests_<algo>/<func>/[<fault-dir>/]<name>.elf   # build output tree
├── tests_dilithium/, tests_kyber/, tests_mayo/          # -> symlinks into sibling *-LLVM repos:
│                                                           qemu_witness.json, active_lengths.json,
│                                                           and every test result file, per function/fault
├── dist_tests/
│   ├── common/                                          # shared Unicorn-emulation backend (see below)
│   ├── dilithium/, kyber/, mayo/                        # per-scheme test drivers + orchestration scripts
│   │   ├── ineffective_<algo>.py, correction_<algo>.py  # the two statistical tests (read trial JSON, backend-agnostic)
│   │   ├── setup/driver_dist.py                         # QEMU+gdb trial driver (original backend)
│   │   ├── setup/collect_dist_unicorn.py, distributions_unicorn.py, calibrate_unicorn.py
│   │   │                                                 # Unicorn in-process trial driver (new backend)
│   │   ├── run_tests_unicorn.sh                          # full exhaustive sweep, Unicorn backend
│   │   └── run_combined_unicorn.sh                       # early-stopping sweep, Unicorn backend (dilithium/kyber only — RECOMMENDED)
│   └── setup/                                            # an older/parallel capture-based prototype pipeline
├── report_findings.py                                    # collates every test result into per-scheme CSV + chart
├── report.sh, fault_detection_report.md                  # older markdown report (mayo/kyber only)
└── reports/                                               # separate IR-diff/rule-based report-generation tooling
```

`tests_dilithium/`, `tests_kyber/`, `tests_mayo/`, and `*_function_inputs/`
are symlinks into sibling repos (`Dilithium-LLVM`, `Kyber-LLVM`,
`MAYO-LLVM`/`MAYO-LLVM-Examples`) — that's where the harness-generated `.ll`
sources, the traced `function_inputs/*.json` samples, and every witness/
result file this repo produces actually live on disk. -->

## The pipeline, end to end

### 1. Per-function harness generation (upstream, not in this repo)

For a target function, a C++ IR-mutation tool wraps it in a synthetic
`main()` that loads scalar arguments from patchable global anchors
(`__mbc_arg_<fn>_<arg>`), allocates buffer arguments as tagged
`alloca`s (`!llvmbmc.var`), calls the function, and records a scalar
return value via `__mbc_ret_anchor_<fn>`. It also produces one or more
**faulty** `.ll` siblings — the same harness, but with the target function's
IR cloned and one instruction mutated.

### 2. Build: `.ll` → ELF (`dilithium_build.sh` / `kyber_build.sh` / `mayo_build.sh`)

```bash
./dilithium_build.sh tests_dilithium/pqcrystals_dilithium2_ref_poly_add   # one function
./dilithium_build.sh                                                     # every function
```

Each `.ll` is compiled with `llc` for `cortex-m4` (thumb2, hard-float),
linked against `obj/ldscript.ld` + `libpqm4hal` for the `mps2-an386`
board, and — for Dilithium/Kyber — has its `randombytes` symbol
redefined to a deterministic bare-metal implementation. The build step
also runs `extract_qemu_witness.py`, which parses the harness `.ll`
and the matching `function_inputs/<fn>.json` trace sample to write
**`qemu_witness.json`**: the function's argument layout (role, byte
length, scalar-anchor name or pointer, and — where traced — a
**distribution** string like `"uniform in [-eta, eta]"` describing what
realistic values for that buffer look like).

### 3. Collecting trials: two backends, same trial JSON schema

A **trial** is one execution of one ELF (correct or faulty) with every
input buffer/scalar filled — either from its declared distribution
(realistic) or a plain uniform fill — and every `role: output` buffer read
back afterward. The result is always
`{"inputs": {...}, "outputs": {...}}`.

- **QEMU + gdb** (`dist_tests/<algo>/setup/driver_dist.py`, driven by
  `collect_dist.py`): boots `qemu-system-arm -M mps2-an386 -S -gdb
  tcp::1234`, then a `gdb-multiarch -batch` script breaks at `main()`'s
  true entry, writes scalar anchors, breaks at the function-under-test's
  raw entry to resolve pointer-argument addresses off gdb's live DWARF
  frame, fills every buffer, runs to a manually-set return-address
  breakpoint, and reads outputs. One QEMU + gdb process pair per trial —
  robust, but ~1s+ of subprocess/boot overhead each time.

- **Unicorn** (`dist_tests/common/`, driven by
  `dist_tests/<algo>/setup/collect_dist_unicorn.py`) — **the newer,
  in-process backend**: the same board (MPS2-AN386's memory map is
  reused unmodified from `obj/ldscript.ld`) is emulated directly with
  the [Unicorn](https://www.unicorn-engine.org/) CPU engine instead of a
  real QEMU + gdb process pair. It runs the guest from reset to
  `main()`'s true first instruction (exact, no gdb prologue-skip
  ambiguity), writes scalar anchors, then — at the function-under-test's
  **raw, pre-prologue entry** — reads its pointer arguments straight out
  of `r0`–`r3`/the incoming stack per AAPCS, using DWARF (via
  `dist_tests/common/dwarf_params.py`) only to learn which formal
  parameters are pointer-typed and in what order, not to evaluate a live
  frame location. No QEMU, no gdb, no subprocess per trial — a full trial
  is one in-process function call, ~15–20x faster.

  ```
  dist_tests/common/
  ├── platform.py, elfimage.py, machine.py   # MPS2-AN386 board model + ELF loader + Unicorn wrapper
  ├── dwarf_params.py                        # pointer/non-pointer formal-parameter order via DWARF
  └── unicorn_runner.py                      # run_trial(): the in-process collect/probe driver
  ```

  Both backends produce byte-for-byte identical output for the same
  inputs (cross-checked directly against real QEMU+gdb during
  development).

### 4. The two statistical tests

Both are **paired**: they compare `f_correct(secret, background)` against
`f_faulty(secret, background)` while varying `secret` and holding
`background` (every other input) fixed, using the trial JSON files above.

- **`ineffective_<algo>.py`** — for two secret values `s1`, `s2`:
  `d1 = (f_correct(s1,p) == f_faulty(s1,p))`,
  `d2 = (f_correct(s2,p) == f_faulty(s2,p))`. If `d1 != d2` for some pair,
  the fault is *silently absorbed* for one secret value but not another —
  its visibility depends on the secret.
- **`correction_<algo>.py`** — `Delta(s) = f_correct(s,p) XOR/mod-sub
  f_faulty(s,p)`. If `Delta(s1) != Delta(s2)` for some pair, the fault
  doesn't reduce to one fixed, secret-independent correction term.

Either kind of disagreement means the fault's effect on the output carries
information about the secret — i.e. it **leaks**.

### 5. Two ways to run a sweep

- **`run_tests_unicorn.sh <func_name>`** (all three algos) — the full
  exhaustive pipeline: calibrate active buffer lengths → sweep the secret
  through **every** value `0..field_mod-1` with one shared random
  background → run both paired tests. `field_mod` is auto-derived from
  the secret buffer's own declared distribution (e.g. MAYO is always 16 —
  GF(16); a Dilithium/Kyber secret's domain size comes straight from its
  distribution's real range, which can be very large — e.g. a
  `masking vector y` buffer's domain is 262144).
- **`run_combined_unicorn.sh <func_name>`** (Dilithium/Kyber only —
  **the recommended entry point**) — same auto-derivation, but sweeps
  secret values `sv = 0, 1, 2, ...` and **stops as soon as either test
  finds a hit** (existence questions don't need the rest of the domain).
  In practice this settles in tens to a few hundred trials even when the
  full domain would be hundreds of thousands. Resumable: it reuses any
  already-collected trial file on disk instead of re-running it.

Both take only the function name; `--secret-buf`/`--fixed-scalars` are
looked up from `<algo>.json` (`{"func_name": {"secret-buf": "...",
"fixed-scalars": "..."}}`) unless passed explicitly.

```bash
# Dilithium/Kyber: early-stopping, in-process, recommended
./dist_tests/dilithium/run_combined_unicorn.sh pqcrystals_dilithium2_ref_polyvecl_add
./dist_tests/kyber/run_combined_unicorn.sh pqcrystals_kyber768_ref_poly_add

# MAYO: full sweep (no early-stop variant), in-process
./dist_tests/mayo/run_tests_unicorn.sh mat_add

# Original QEMU+gdb backend (any algo) — still available
./dist_tests/dilithium/run_tests.sh pqcrystals_dilithium2_ref_poly_add a --secret-pos 0
```

Every faulty ELF found anywhere under the function's build directory
(`build/tests_<algo>/<func_name>/`, recursively) is swept in turn, each
into its own result file under `tests_<algo>/<func_name>/<fault-stem>/`.

### 6. Reporting: `report_findings.py`

Scans `tests_mayo/`, `tests_kyber/`, `tests_dilithium/` for every
`test_result.txt` (early-stop backend) and
`ineffective_paired_result.txt`/`correction_paired_result.txt`
(full-sweep backend), and collates them into one CSV per scheme
(`fault_report_<scheme>.csv`, long format: one row per fault × test ×
result source) plus a combined `fault_report_all.csv`. `--plot` also
renders `fault_report_<scheme>.png` — a detection-rate-by-function bar
chart (requires `matplotlib`).

```bash
python3 report_findings.py                        # all three schemes, CSV only
python3 report_findings.py --schemes mayo --plot   # one scheme + chart
```

This supersedes `report.sh`/`fault_detection_report.md` (which only ever
covered MAYO/Kyber's paired-sweep results in markdown) — `report_findings.py`
covers all three schemes, both backends' result formats, and machine-readable
output.

## Setup

```bash
pip install -r dist_tests/common/requirements.txt   # unicorn, capstone, pyelftools, numpy
pip install matplotlib                               # optional, for report_findings.py --plot
```

The Unicorn backend needs no other tools. The original QEMU+gdb backend
additionally needs `qemu-system-arm` and `gdb-multiarch` on `PATH`. Building
ELFs needs the `arm-none-eabi-*` GCC toolchain.

## Other files worth knowing about

- **`reports/`** — a separate tool that reads the faulty `.ll`/IR diff
  itself (not test results) to describe *what* a given mutation does
  structurally; complementary to, not a replacement for, the leakage
  tests above.
- **`dist_tests/setup/`** — an older, simpler capture-based prototype
  (`driver_internal_capture.py`, `collect_distribution_internal.py`) with
  its own trial JSON schema (`"captured"` key), superseded by the
  `dist_tests/<algo>/setup/` pipeline described above.
- **MAYO's `driver_dist_sig.py`** — a separate, more advanced
  whole-signature fault harness (faults a function called from within a
  real `mayo_sign_signature` call, not the standalone per-function
  driver) — not covered by the Unicorn backend or `run_combined_unicorn.sh`.
