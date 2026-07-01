#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Error: Missing file name argument."
    echo "Usage: $0 <filename_without_extension>"
    echo "Example: $0 main"
    exit 1
fi

# Assign the argument to a descriptive variable
FILENAME="$1"
BUILD_DIR="build"
mkdir -p "$BUILD_DIR"

llc \
  -march=arm \
  -mcpu=cortex-m4 \
  -mattr=+thumb2,+vfp4d16 \
  -float-abi=hard \
  -filetype=obj \
  "${FILENAME}.ll" \
  -o "${BUILD_DIR}/${FILENAME}.o"

arm-none-eabi-gcc \
    "${BUILD_DIR}/${FILENAME}.o" \
    obj/common/assert_stub.o \
    -Lobj \
    -lpqm4hal \
    --specs=nosys.specs \
    -Wl,--wrap=_sbrk \
    -Wl,--wrap=_open \
    -Wl,--wrap=_close \
    -Wl,--wrap=_isatty \
    -Wl,--wrap=_kill \
    -Wl,--wrap=_lseek \
    -Wl,--wrap=_read \
    -Wl,--wrap=_write \
    -Wl,--wrap=_fstat \
    -Wl,--wrap=_getpid \
    -Wl,--no-warn-rwx-segments \
    -ffreestanding \
    -T obj/ldscript.ld \
    -mcpu=cortex-m4 \
    -mthumb \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -o "${BUILD_DIR}/${FILENAME}.elf"

echo "${BUILD_DIR}/${FILENAME}.elf generated."