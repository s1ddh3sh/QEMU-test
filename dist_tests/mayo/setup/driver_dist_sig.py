#!/usr/bin/env python3
"""
driver_dist_sig.py -- gdb batch-mode collector for the FUSED whole-signature
binary produced by fuseback_gated. Unlike driver_dist.py (which tests a
function in a standalone FUT harness with its own scalar anchors), here the
function-under-test (e.g. mat_add) is embedded inside a real signing call, so:

  * its scalar args (m, n, ...) are compile-time constants at the call site,
    NOT backed by mutable __mbc_arg_* globals -- there is nothing to inject,
    so any witness scalar entry whose anchor doesn't resolve is warned about
    and skipped, not treated as an error.
  * it is called MULTIPLE times (once per k-round), and because the gated
    module dispatches the armed occurrence to <func>__faulted instead of
    <func>, "the N-th call" is only well-defined if you count hits on BOTH
    symbols as one sequence. This script does that.
  * the quantity you actually want to read is the ENTRY function's output
    argument (sig), not the FUT's own local output -- captured by breaking
    at the entry function BEFORE the FUT ever executes.

Sequence of breakpoints hit, in order:
    main entry (capture return addr)
      -> entry_func entry (capture sig's address; delete this bp)
      -> func / func__faulted, repeated k times (count combined hits;
         at the hit whose combined count == target-occ, inject Vdec/Ox/etc;
         every other hit is left untouched -- it runs with whatever the
         real signing algorithm computed)
      -> return_addr in main (main complete; read sig)

Required env vars:
    GDB_DRIVER_ELF             path to the fused ELF
    GDB_DRIVER_WITNESS         mat_add's witness (Vdec/Ox/s + any scalars;
                               scalars are skipped with a warning if their
                               anchor global isn't present in this binary)
    GDB_DRIVER_FUNC            FUT symbol, e.g. "mat_add"
    GDB_DRIVER_ENTRY_FUNC      entry symbol, e.g.
                               "pqmayo_MAYO_1_ref_mayo_sign_signature"
    GDB_DRIVER_ENTRY_OUTPUT_LEN  byte length of the entry's output buffer
                               (e.g. 431 for MAYO-1 sig)
    GDB_DRIVER_FIELD_MOD       field modulus for random fill
    GDB_DRIVER_ACTIVE_LENGTHS  path to active_lengths.json (Vdec/Ox lengths)
    GDB_DRIVER_TRIAL_SEED      RNG seed for this trial
    GDB_DRIVER_VARIANT         "correct" | "faulty"
    GDB_DRIVER_OUTDIR          results directory

Optional:
    GDB_DRIVER_FUNC_FAULTED       default: GDB_DRIVER_FUNC + "__faulted"
    GDB_DRIVER_TARGET_OCC         default: 1 (which combined call to inject
                                  into -- must match the fault's target
                                  occurrence baked in by fuseback_gated)
    GDB_DRIVER_ENTRY_OUTPUT_NAME  default: "sig" -- substring match
                                  (case-insensitive) against the entry
                                  frame's pointer-arg names, excluding any
                                  name containing "len"
    GDB_DRIVER_ENTRY_OUTPUT_INDEX  0-based positional fallback into the
                                  entry frame's pointer args, used only if
                                  the name match is ambiguous or absent
    GDB_DRIVER_FIXED_SCALARS      comma list, same meaning as driver_dist.py
    GDB_DRIVER_OVERRIDE_BUF/POS/VAL  same meaning as driver_dist.py --
                                  applied to the injected occurrence only

Output JSON: {"inputs": {...}, "outputs": {"sig": [...]}}
  ("sig" is the key regardless of the entry's real parameter name, so the
  existing test scripts' --out-buf sig works unchanged.)

Caveat: this script does NOT read the FUT's own local output (e.g. mat_add's
"s") at completion. By the time main finishes, the entry function's stack
frame has already been popped; the memory is not reliably valid to read even
though it often still holds stale bytes. "sig" is safe because it is an
alloca in MAIN's own frame, which is still live when we stop at return_addr.
If you need the FUT-local output too, read it immediately when you inject
(same breakpoint hit), not at the end -- not implemented here since it wasn't
requested, but the injection point is exactly where you'd add it.

Note: collect_dist.py hardcodes the driver script path
(_DRIVER_SCRIPT = .../driver_dist.py). Point it at this file instead --
either copy this script over that path in a separate working directory, or
add one line making that path overridable via an env var. driver_dist.py
itself is untouched.

Expects QEMU already running:
    qemu-system-arm -M mps2-an386 -kernel <elf> -nographic -semihosting -S -gdb tcp::1234
"""

import gdb
import json
import os
import random
import sys

GDB_TARGET = "localhost:1234"


# ---------------------------------------------------------------------------
# Memory / connection helpers (duplicated from driver_dist.py, kept minimal
# and unmodified in spirit so behaviour matches exactly)
# ---------------------------------------------------------------------------

def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    packed = bytes(v & 0xFF for v in values)
    inferior.write_memory(addr, packed)


def read_bytes(addr, count):
    inferior = gdb.selected_inferior()
    raw = inferior.read_memory(addr, count)
    return list(bytes(raw))


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


def connect(elf_path):
    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)


def get_pointer_args(frame):
    block = frame.block()
    while block and not block.function:
        block = block.superblock
    if block is None:
        raise RuntimeError("no debug info block found for this frame")
    args = []
    for sym in block:
        if sym.is_argument and sym.type.code == gdb.TYPE_CODE_PTR:
            args.append(sym)
    return args


def get_fixed_scalars():
    raw = os.environ.get("GDB_DRIVER_FIXED_SCALARS") or ""
    return set(s for s in raw.split(",") if s)


def get_override():
    override_buf = os.environ.get("GDB_DRIVER_OVERRIDE_BUF", "")
    override_pos = int(os.environ.get("GDB_DRIVER_OVERRIDE_POS", "-1"))
    override_val = int(os.environ.get("GDB_DRIVER_OVERRIDE_VAL", "-1"))
    return override_buf, override_pos, override_val


def break_at_main_true_entry():
    """Same approach as driver_dist.py: resolve main()'s true entry via
    parse_and_eval, stop there, capture $lr for a manual return-address
    breakpoint (main's caller has no CFI, so `finish` can't be used)."""
    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1
    if main_entry == 0:
        raise RuntimeError("could not resolve symbol 'main'")

    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != "main":
        raise RuntimeError(f"stopped in '{frame.name()}', expected 'main'")
    bp_main.delete()

    return_addr = int(gdb.parse_and_eval("$lr")) & ~1
    return return_addr


# ---------------------------------------------------------------------------
# sig-aware helpers
# ---------------------------------------------------------------------------

def resolve_symbol_addr(symbol):
    """Resolve a function's entry address via parse_and_eval, bypassing
    GDB's name/linespec resolution entirely -- the same technique
    break_at_main_true_entry() already uses for main(), applied uniformly.
    Bare `gdb.Breakpoint(f"*{symbol}")` on this target/binary has been
    observed to fail inside GDB's own location parser (surfacing as
    `TypeError: str expected, not tuple`, with no Python traceback from our
    code at all, i.e. the crash is inside GDB's C/py glue before any of our
    lines run) -- most likely an ARM/Thumb interworking veneer or duplicate
    local-symbol artifact making the bare name ambiguous to the linespec
    parser. Returns None if the symbol can't be resolved at all (e.g. the
    faulted variant absent from this particular ELF)."""
    try:
        addr = int(gdb.parse_and_eval(f"(unsigned long)&{symbol}")) & ~1
    except gdb.error:
        return None
    return addr or None


def resolve_entry_output_addr(entry_func):
    """Break at entry_func's raw entry address (NOT by name -- see
    resolve_symbol_addr), resolve the output pointer arg (by name match,
    falling back to an explicit positional index), delete the breakpoint,
    and return its address. Leaves execution stopped at entry_func's entry
    (the caller continues from here toward the FUT breakpoints)."""
    out_name = os.environ.get("GDB_DRIVER_ENTRY_OUTPUT_NAME", "sig").lower()
    idx_env = os.environ.get("GDB_DRIVER_ENTRY_OUTPUT_INDEX", "")

    addr_entry = resolve_symbol_addr(entry_func)
    if addr_entry is None:
        raise RuntimeError(f"could not resolve address of '{entry_func}'")

    bp = gdb.Breakpoint(f"*0x{addr_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if int(frame.pc()) != addr_entry:
        raise RuntimeError(
            f"stopped at pc=0x{int(frame.pc()):x}, expected entry "
            f"0x{addr_entry:x} for '{entry_func}' (frame name: {frame.name()})")

    ptr_args = get_pointer_args(frame)
    matches = [s for s in ptr_args
              if out_name in s.name.lower() and "len" not in s.name.lower()]

    if len(matches) == 1:
        chosen = matches[0]
    elif idx_env:
        i = int(idx_env)
        if i >= len(ptr_args):
            raise RuntimeError(
                f"GDB_DRIVER_ENTRY_OUTPUT_INDEX={i} out of range; "
                f"{entry_func} has pointer args {[s.name for s in ptr_args]}")
        chosen = ptr_args[i]
    else:
        raise RuntimeError(
            f"could not uniquely resolve entry output arg (name match "
            f"'{out_name}' found {len(matches)} candidates among "
            f"{[s.name for s in ptr_args]}). Set GDB_DRIVER_ENTRY_OUTPUT_NAME "
            f"or GDB_DRIVER_ENTRY_OUTPUT_INDEX.")

    addr = int(chosen.value(frame))
    bp.delete()
    return addr, chosen.name


def try_make_breakpoint_at_symbol(symbol):
    """Resolve symbol's entry address (see resolve_symbol_addr) and break
    there. Returns (addr, Breakpoint), or (None, None) if the symbol can't
    be resolved in this ELF (e.g. the faulted variant isn't present in a
    stripped-down build). Deliberately does NOT use a name-based linespec --
    see resolve_symbol_addr's docstring for why."""
    addr = resolve_symbol_addr(symbol)
    if addr is None:
        print(f"[!] could not resolve '{symbol}' in this ELF", file=sys.stderr)
        return None, None
    return addr, gdb.Breakpoint(f"*0x{addr:x}", internal=False)


# ---------------------------------------------------------------------------
# main collection routine
# ---------------------------------------------------------------------------

def run_collect_sig():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_WITNESS"]
    func = os.environ["GDB_DRIVER_FUNC"]
    func_faulted = os.environ.get("GDB_DRIVER_FUNC_FAULTED", f"{func}__faulted")
    entry_func = os.environ.get("GDB_DRIVER_ENTRY_FUNC",
                                "pqmayo_MAYO_1_ref_mayo_sign_signature")
    entry_out_len = int(os.environ["GDB_DRIVER_ENTRY_OUTPUT_LEN"])
    field_mod = int(os.environ["GDB_DRIVER_FIELD_MOD"])
    active_lengths_path = os.environ["GDB_DRIVER_ACTIVE_LENGTHS"]
    trial_seed = int(os.environ["GDB_DRIVER_TRIAL_SEED"])
    variant = os.environ["GDB_DRIVER_VARIANT"]
    out_dir = os.environ["GDB_DRIVER_OUTDIR"]
    target_occ = int(os.environ.get("GDB_DRIVER_TARGET_OCC", "1"))

    fixed_scalars = get_fixed_scalars()
    override_buf, override_pos, override_val = get_override()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    connect(elf_path)

    # Phase 0: main entry -> return-address bp for later, and fix mlen.
    #
    # mlen is loaded from its anchor INSIDE main (before the call), so by the
    # time we're stopped inside entry_func the value is already baked into a
    # register/stack slot -- this MUST be written now, at main's true entry,
    # not in Phase 1. Same timing rule driver_dist.py already documents for
    # its own scalar-anchor writes.
    return_addr = break_at_main_true_entry()

    mlen_anchor = os.environ.get("GDB_DRIVER_ENTRY_MLEN_ANCHOR",
                                 f"__mbc_arg_{entry_func}_mlen")
    mlen_value = int(os.environ.get("GDB_DRIVER_ENTRY_MLEN_VALUE", "32"))
    try:
        mlen_addr = int(gdb.parse_and_eval(f"&{mlen_anchor}"))
        write_bytes(mlen_addr, list(mlen_value.to_bytes(4, "little")))
        print(f"[i] wrote mlen={mlen_value} via anchor '{mlen_anchor}'")
    except gdb.error:
        print(f"[!] mlen anchor '{mlen_anchor}' not found in this ELF -- mlen "
              f"stays at its compiled-in default (was observed as 0 in "
              f"testing, which prevents the signing loop from being entered "
              f"at all). Set GDB_DRIVER_ENTRY_MLEN_ANCHOR to the real name "
              f"if it differs.", file=sys.stderr)

    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    # Phase 1: entry function -> capture sig's address before any FUT call,
    # and fix csk (and optionally the message) while still stopped here --
    # main's own memset of these buffers has already run by this point, and
    # entry_func hasn't read them yet.
    sig_addr, sig_arg_name = resolve_entry_output_addr(entry_func)
    print(f"[i] entry output '{sig_arg_name}' resolved at 0x{sig_addr:x} "
          f"(len={entry_out_len})")

    entry_frame = gdb.selected_frame()  # resolve_entry_output_addr left us here
    entry_ptr_args = {s.name: s for s in get_pointer_args(entry_frame)}

    # mlen and csk are NOT read via DWARF/frame-arg lookup below. This is a
    # plain AAPCS C call (no fastcc), so p/sig/siglen/m -- the first four
    # pointer args -- go in r0-r3 and are valid immediately at entry, which
    # is why sig's address above resolved correctly. mlen and csk are the
    # 5th/6th args, passed on the STACK, and DWARF typically locates
    # stack-passed parameters relative to the canonical frame address (CFA),
    # which isn't established until the callee's prologue runs. We break at
    # the raw entry (deliberately, so sig is captured before anything else
    # executes), so any CFA-relative read for these two is evaluated against
    # a frame that doesn't exist yet -- this is what produced mlen=0 (even
    # right after writing 32 to its anchor) and csk=0x0 in testing: the
    # WRITE was fine, the DISPLAY was reading the wrong computed address.
    #
    # Fix: read them directly off the ABI-guaranteed location instead. At a
    # plain AAPCS call's entry point, $sp points exactly at the first
    # stack-passed argument -- word 0 is mlen, word 1 is csk.
    mlen_word = int(os.environ.get("GDB_DRIVER_ENTRY_MLEN_STACK_WORD", "0"))
    csk_word = int(os.environ.get("GDB_DRIVER_ENTRY_CSK_STACK_WORD", "1"))
    sp = int(gdb.parse_and_eval("$sp"))

    def read_stack_word(word_idx):
        return int.from_bytes(bytes(read_bytes(sp + 4 * word_idx, 4)), "little")

    mlen_at_entry = read_stack_word(mlen_word)
    print(f"[i] mlen at entry (read via $sp+{4*mlen_word}, NOT DWARF): "
          f"{mlen_at_entry} (expected {mlen_value} if the Phase-0 anchor "
          f"write took effect)")
    if mlen_at_entry != mlen_value:
        print(f"[!] mlen at entry ({mlen_at_entry}) does not match what was "
              f"written to the anchor ({mlen_value}) -- the anchor write "
              f"itself may not be taking effect, not just a display issue. "
              f"Investigate before trusting this run.", file=sys.stderr)

    csk_name = os.environ.get("GDB_DRIVER_ENTRY_CSK_NAME", "csk")
    csk_len = int(os.environ.get("GDB_DRIVER_ENTRY_CSK_LEN", "24"))
    csk_seed = int(os.environ.get("GDB_DRIVER_ENTRY_CSK_SEED", "0"))
    csk_addr = read_stack_word(csk_word)
    if csk_addr == 0:
        raise RuntimeError(
            f"'{csk_name}' resolved to a NULL pointer even reading directly "
            f"off $sp+{4*csk_word} (bypassing DWARF entirely). This means "
            f"the value genuinely isn't on the stack where AAPCS says it "
            f"should be for a plain C call with 4 leading pointer args -- "
            f"double-check this function isn't actually being called with a "
            f"non-standard calling convention (grep the .ll for 'fastcc' or "
            f"other cc attributes on this specific call site), or that "
            f"GDB_DRIVER_ENTRY_CSK_STACK_WORD={csk_word} is the right word "
            f"offset for csk's actual position.")
    csk_rng = random.Random(csk_seed)
    write_bytes(csk_addr, [csk_rng.randrange(256) for _ in range(csk_len)])
    print(f"[i] wrote {csk_len} bytes to '{csk_name}' at 0x{csk_addr:x} "
          f"(seed={csk_seed}, resolved via $sp+{4*csk_word}) -- any fixed "
          f"bit pattern is a valid compact-sk seed for this purpose; it "
          f"does not need to come from a real mayo_keypair() call")

    msg_name = os.environ.get("GDB_DRIVER_ENTRY_MSG_NAME", "m")
    if msg_name in entry_ptr_args and mlen_value > 0:
        msg_addr = int(entry_ptr_args[msg_name].value(entry_frame))
        if msg_addr != 0:
            msg_rng = random.Random(int(os.environ.get("GDB_DRIVER_ENTRY_MSG_SEED", "0")))
            write_bytes(msg_addr, [msg_rng.randrange(256) for _ in range(mlen_value)])
            print(f"[i] wrote {mlen_value} message bytes to '{msg_name}' at "
                  f"0x{msg_addr:x}")

    # siglen: main initializes *siglen to 0 (a plain output-length slot, from
    # its own perspective). But many sign() APIs use this SAME pointer on
    # input to communicate the caller's buffer CAPACITY, and check
    # *siglen >= required_size before writing anything -- if that check is
    # an assert() rather than a returned error code, an incoming 0 aborts
    # the whole process via semihosting immediately, with no error
    # propagated up and no return through main/crt0 at all. That matches
    # every symptom seen so far (no mat_add hit, no crt0 return-address hit,
    # clean-looking "exited normally"). Set it to the real buffer capacity.
    siglen_name = os.environ.get("GDB_DRIVER_ENTRY_SIGLEN_NAME", "siglen")
    if siglen_name in entry_ptr_args:
        siglen_ptr_addr = int(entry_ptr_args[siglen_name].value(entry_frame))
        if siglen_ptr_addr != 0:
            incoming = int.from_bytes(bytes(read_bytes(siglen_ptr_addr, 4)), "little")
            write_bytes(siglen_ptr_addr, list(entry_out_len.to_bytes(4, "little")))
            print(f"[i] '{siglen_name}' pointee was {incoming} at entry "
                  f"(main initializes it to 0) -- set to {entry_out_len} "
                  f"(the real sig buffer capacity) before continuing")
    else:
        print(f"[!] entry frame has no pointer arg named '{siglen_name}' "
              f"(available: {list(entry_ptr_args.keys())})", file=sys.stderr)

    # Phase 2: FUT + faulted-variant breakpoints, combined occurrence count.
    # Addresses (not names) drive every decision below -- frame.name() is
    # used only for an informational print, never for control flow, since
    # it's the thing that was unreliable in the first place.
    addr_func, bp_fut = try_make_breakpoint_at_symbol(func)
    addr_func_f, bp_fut_f = try_make_breakpoint_at_symbol(func_faulted)
    if addr_func is None and addr_func_f is None:
        raise RuntimeError(f"neither '{func}' nor '{func_faulted}' resolved")
    fut_addrs = {a for a in (addr_func, addr_func_f) if a is not None}

    rng = random.Random(trial_seed)
    written_inputs = {}
    occurrence = 0
    injected = False

    while True:
        gdb.execute("continue", to_string=True)

        inferior = gdb.selected_inferior()
        if not inferior.is_valid() or not inferior.threads():
            raise RuntimeError(
                f"target exited before reaching occurrence {target_occ} of "
                f"{func}/{func_faulted} (saw {occurrence} so far) and before "
                f"return_addr 0x{return_addr:x} -- the program is taking an "
                f"early-return / error path somewhere inside {entry_func}, "
                f"or exiting directly via semihosting from inside it, rather "
                f"than looping into the FUT and returning normally. Check "
                f"the function's return value (the __mbc_ret_anchor_* global "
                f"in main) and/or step through it interactively from its "
                f"entry to find the guard clause responsible.")

        frame = gdb.selected_frame()
        pc = int(frame.pc())

        if pc == return_addr:
            break  # main is done

        if pc not in fut_addrs:
            raise RuntimeError(
                f"unexpected stop at pc=0x{pc:x} (frame name: {frame.name()}); "
                f"expected one of {[hex(a) for a in fut_addrs]} or "
                f"return_addr 0x{return_addr:x}")

        occurrence += 1
        if occurrence != target_occ:
            continue  # let this call run with the algorithm's real values

        if injected:
            raise RuntimeError(
                f"hit occurrence {target_occ} twice -- breakpoint bookkeeping "
                f"is wrong (bp not deleted / duplicate address?)")

        # --- inject: pointer buffers first (Vdec, Ox, ...), matched by
        #     argument name -- works for both func and func__faulted since
        #     CloneFunctionInto preserves argument names.
        ptr_args = {s.name: s for s in get_pointer_args(frame)}
        for name, spec in layout.items():
            if spec.get("type") == "scalar":
                continue
            if spec.get("role") not in ("input",) and not spec.get("also_input"):
                continue
            if name not in ptr_args:
                print(f"[!] witness names '{name}' but function at "
                      f"pc=0x{pc:x} has no such pointer arg; skipping",
                      file=sys.stderr)
                continue
            addr = int(ptr_args[name].value(frame))
            fill_len = active_lengths.get(name, spec["length"])
            vals = random_fill(rng, field_mod, fill_len)
            if name == override_buf and 0 <= override_pos < len(vals):
                vals[override_pos] = override_val
            write_bytes(addr, vals)
            key = f"{name}_pre" if spec.get("also_input") else name
            written_inputs[key] = vals

        # --- scalars: only meaningful if this witness entry's anchor still
        #     exists in the fused binary. In the embedded case m/n are
        #     compile-time constants at this call site (no anchor was ever
        #     generated for them), so this is expected to warn-and-skip.
        for name, spec in layout.items():
            if spec.get("type") != "scalar" or spec.get("role") != "input":
                continue
            anchor = spec.get("anchor", "")
            try:
                addr = int(gdb.parse_and_eval(f"&{anchor}"))
            except gdb.error:
                print(f"[i] scalar '{name}' anchor '{anchor}' not present in "
                      f"this binary (expected for embedded constants) -- "
                      f"leaving it at its compiled-in value", file=sys.stderr)
                continue
            if name in fixed_scalars:
                val = spec.get("init_value", 0)
            elif name == override_buf and override_pos == 0:
                val = override_val
            else:
                val = rng.randrange(field_mod)
            write_bytes(addr, [val])
            written_inputs[name] = [val]

        injected = True

    if not injected:
        raise RuntimeError(
            f"target occurrence {target_occ} never reached (saw only "
            f"{occurrence} combined call(s) to {func}/{func_faulted}); "
            f"check --target-occ against the actual per-signature call count")

    sig_bytes = read_bytes(sig_addr, entry_out_len)
    outputs = {"sig": sig_bytes}

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump({"inputs": written_inputs, "outputs": outputs}, f)

    print(f"[i] wrote {out_path} (occurrence {target_occ}/{occurrence} injected)")


def main():
    mode = os.environ.get("GDB_DRIVER_MODE", "collect")
    if mode != "collect":
        print(f"[!] driver_dist_sig.py only implements 'collect' mode "
              f"(got {mode!r})", file=sys.stderr)
        sys.exit(2)
    run_collect_sig()


if __name__ == "__main__":
    main()