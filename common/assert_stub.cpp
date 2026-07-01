// assert_stub.cpp
extern "C" void __assert_trap(void) {
    while (1) { __asm__ volatile("bkpt #0"); }
}

void assert(bool cond) {
    if (!cond) __assert_trap();
}