mkdir -p build
rm -f build/boot.bin
nasm -f bin stage1/boot.asm -o build/boot.bin 
