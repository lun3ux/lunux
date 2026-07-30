set -e

rm -f build/*
echo "Deleting files in build directory"
mkdir -p build
echo "made build directory"
nasm -f bin stage1/boot.asm -o build/stage1.bin
nasm -f bin stage2/stage2.asm -o build/stage2.bin
echo "Creating disk image"
dd if=/dev/zero of=build/boot.img bs=1M count=10 status=none
dd if=build/stage1.bin of=build/boot.img bs=512 seek=0 conv=notrunc status=none
dd if=build/stage2.bin of=build/boot.img bs=512 seek=1 conv=notrunc status=none

