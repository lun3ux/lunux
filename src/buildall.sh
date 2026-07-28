mkdir -p build
rm -f build/boot.bin
nasm -f bin boot.asm -o build/boot.bin 
