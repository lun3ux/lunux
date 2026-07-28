mkdir -p build
rm -f build/*
nasm -f bin boot.asm -o build/boot.bin 
