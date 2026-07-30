rm -f build/*
echo "Deleting files in build directory"
mkdir -p build
echo "made build directory"
nasm -f elf64 stage1/boot.asm -o build/stage1.o 
nasm -f elf64 stage2/stage2.asm -o build/stage2.o 
echo "compiling" 
ld -n build/stage1.o build/stage2.o -o build/boot.bin -Ttext 0x7c00 --oformat binary 
echo  "linking" 
echo "Build complete"