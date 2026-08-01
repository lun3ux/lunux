CC = gcc
AS = nasm
LD = ld

CFLAGS = -m32 -c -std=gnu99 -ffreestanding -O2 -Wall -Wextra
ASFLAGS = -f elf32
LDFLAGS = -m elf_i386 -T linker.ld

KERNEL = mykernel.bin
ISO_IMAGE = lunux.iso
ISO_DIR = iso

OBJS = boot.o kernel.o

.PHONY: all clean iso run

all: iso

boot.o: boot.asm
	$(AS) $(ASFLAGS) boot.asm -o boot.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) kernel.c -o kernel.o

$(KERNEL): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(KERNEL)

iso: $(KERNEL)
	grub-file --is-x86-multiboot $(KERNEL)
	mkdir -p $(ISO_DIR)/boot/grub
	cp $(KERNEL) $(ISO_DIR)/boot/
	@echo 'insmod all_video' > $(ISO_DIR)/boot/grub/grub.cfg
	@echo 'insmod gfxterm' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo 'set timeout=0' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo 'set default=0' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo 'menuentry "lunux" {' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo '    multiboot /boot/$(KERNEL)' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo '    boot' >> $(ISO_DIR)/boot/grub/grub.cfg
	@echo '}' >> $(ISO_DIR)/boot/grub/grub.cfg
	grub-mkrescue -o $(ISO_IMAGE) $(ISO_DIR)

run: iso
	/usr/bin/qemu-system-x86_64 -cdrom $(ISO_IMAGE) -display sdl

clean:
	rm -rf $(OBJS) $(KERNEL) $(ISO_IMAGE) $(ISO_DIR)
