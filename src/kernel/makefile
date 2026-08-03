DEFAULT_HOST!=../default-host.sh
HOST?=i686-elf
HOSTARCH ?= i386

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=
LD = ld

DESTDIR?=
PREFIX?=/usr/local/src/
EXEC_PREFIX?=$(PREFIX)
BOOTDIR?=$(EXEC_PREFIX)/boot
INCLUDEDIR?=$(PREFIX)/include

CFLAGS:=$(CFLAGS) -m32 -no-pie -nostdlib -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) -D__is_kernel -I./include
LDFLAGS:=$(LDFLAGS)
LIBS:=$(LIBS) -nostdlib -lgcc

ARCHDIR=arch/$(HOSTARCH)
include $(ARCHDIR)/make.config

CFLAGS:=$(CFLAGS) $(KERNEL_ARCH_CFLAGS)
CPPFLAGS:=$(CPPFLAGS) $(KERNEL_ARCH_CPPFLAGS)
LDFLAGS:=$(LDFLAGS) $(KERNEL_ARCH_LDFLAGS)
LIBS:=$(LIBS) $(KERNEL_ARCH_LIBS)

KERNEL_OBJS= \
$(KERNEL_ARCH_OBJS) \
kernel.o

KERNEL_OBJS= \
$(KERNEL_ARCH_OBJS) \
kernel.o

OBJS=\
$(ARCHDIR)/crti.o \
$(ARCHDIR)/crtbegin.o \
$(KERNEL_OBJS) \
$(ARCHDIR)/crtend.o \
$(ARCHDIR)/crtn.o \

LINK_LIST = \
	arch/i386/crti.o \
	arch/i386/crtbegin.o \
	../boot/boot.o \
	arch/i386/tty.o \
	kernel.o \
	arch/i386/crtend.o \
	arch/i386/crtn.o

.PHONY: all clean install install-headers install-kernel

.SUFFIXES:
	.o .c .asm .bin .kernel

all: lunux.kernel


libc/string.o: libc/string.c
	$(CC) $(CFLAGS) -c libc/string.c -o libc/string.o

%.o: %.c
	$(CC) -MD -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

%.o: %.asm
	nasm -f elf32 $< -o $@

../boot/boot.o: ../boot/boot.asm
	nasm -f elf32 ../boot/boot.asm -o ../boot/boot.o

lunux.kernel: $(OBJS) $(ARCHDIR)/linker.ld
	$(LD) \
		-m elf_i386 \
		-T $(ARCHDIR)/linker.ld \
		-o $@ \
		$(LINK_LIST)

$(ARCHDIR)/crtbegin.o $(ARCHDIR)/crtend.o:
	OBJ=`$(CC) $(CFLAGS) $(LDFLAGS) -print-file-name=$(@F)` && cp "$$OBJ" $@

clean:
	rm -f lunux.kernel
	rm -f $(OBJS) *.o */*.o */*/*.o
	rm -f $(OBJS:.o=.d) *.d */*.d */*/*.d

install: install-headers install-kernel

install-headers:
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(DESTDIR)$(INCLUDEDIR)/.

install-kernel: lunux.kernel
	mkdir -p $(DESTDIR)$(BOOTDIR)
	cp lunux.kernel $(DESTDIR)$(BOOTDIR)
	grub-file --is-x86-multiboot $@
-include $(OBJS:.o=.d)