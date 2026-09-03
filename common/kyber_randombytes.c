#include <stdint.h>

void randombytes(uint8_t *out, uint32_t outlen) {
  static uint32_t state = 0x243f6a88u;

  while (outlen-- != 0) {
    state ^= state << 13;
    state ^= state >> 17;
    state ^= state << 5;
    *out++ = (uint8_t)state;
  }
}
