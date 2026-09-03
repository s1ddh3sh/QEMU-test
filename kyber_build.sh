#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

# Check if a directory argument was provided
if [ -z "$1" ]; then
    echo "Error: Missing directory argument."
    echo "Usage: $0 <directory>"
    echo "Example: $0 path/to/ll_files"
    exit 1
fi

TARGET_DIR="$1"

# Verify directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' not found."
    exit 1
fi

# Find all .ll files recursively in TARGET_DIR
find "$TARGET_DIR" -type f -name "*.ll" | while read -r INPUT; do
    echo "=========================================="
    echo "Processing: $INPUT"
    echo "=========================================="

    FILENAME=$(basename "$INPUT" .ll)
    INPUT_DIR=$(dirname "$INPUT")

    # Mirror the source folder structure inside the build directory
    if [ "$INPUT_DIR" = "." ]; then
        BUILD_DIR="build"
    else
        BUILD_DIR="build/$INPUT_DIR"
    fi

    mkdir -p "$BUILD_DIR"

    # Compile LLVM IR to object file
    llc \
      -march=arm \
      -mcpu=cortex-m4 \
      -mattr=+thumb2,+vfp4d16 \
      -float-abi=hard \
      -filetype=obj \
      "$INPUT" \
      -o "${BUILD_DIR}/${FILENAME}.o"

    # Link object file into ELF
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
    echo "Run QEMU with:"
    echo "qemu-system-arm \\"
    echo "    -M mps2-an386 \\"
    echo "    -kernel \"${BUILD_DIR}/${FILENAME}.elf\" \\"
    echo "    -nographic \\"
    echo "    -semihosting \\"
    echo "    -S \\"
    echo "    -gdb tcp::1234"
    echo ""
done

# Extract target folder name and construct the target .ll path
FOLDER_NAME=$(basename "$(realpath "$TARGET_DIR")")
LL_FILE="${TARGET_DIR}/${FOLDER_NAME}.ll"

echo "Extracting qemu inputs for: $LL_FILE"
python3 dist_tests/kyber/setup/extract_qemu_witness.py "$LL_FILE"

