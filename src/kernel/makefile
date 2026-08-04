DEFAULT_HOST!=../default-host.sh
HOST?=DEFAULT_HOST
HOSTARCH!=../target-triplet-to-arch.sh $(HOST)

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=$(PREFIX)
BOOTDIR?=$(EXEC_PREFIX)/boot
INCLUDEDIR?=$(PREFIX)/include

CFLAGS:=$(CFLAGS) -m32 -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) -D__is_kernel -Iinclude
LDFLAGS:=$(LDFLAGS) -no-pie
LIBS:=$(LIBS) -nostdlib

DESTDIR?=
PREFIX?=/usr/local/src/
EXEC_PREFIX?=$(PREFIX)
BOOTDIR?=$(EXEC_PREFIX)/boot
INCLUDEDIR?=$(PREFIX)/include
ARCHDIR=arch/$(HOSTARCH)

include arch/$(HOSTARCH)/make.config

CFLAGS:=$(CFLAGS) $(KERNEL_ARCH_CFLAGS)
CPPFLAGS:=$(CPPFLAGS) $(KERNEL_ARCH_CPPFLAGS)
LDFLAGS:=$(LDFLAGS) $(KERNEL_ARCH_LDFLAGS)
LIBS:=$(LIBS) $(KERNEL_ARCH_LIBS)

KERNEL_OBJS= \
$(KERNEL_ARCH_OBJS) \
kernel.o

OBJS=\
$(ARCHDIR)/crti.o \
$(ARCHDIR)/crtbegin.o \
$(KERNEL_OBJS) \
../libc/string.o \
../libc/x86.o \
../libc/stdio.o \
../libc/gdt.o \
$(ARCHDIR)/crtend.o \
$(ARCHDIR)/crtn.o

LINK_LIST=\
$(LDFLAGS) \
$(ARCHDIR)/crti.o \
$(ARCHDIR)/crtbegin.o \
$(KERNEL_OBJS) \
../libc/string.o \
../libc/x86.o \
../libc/stdio.o \
../libc/gdt.o \
-nostdlib \
-lgcc \
$(ARCHDIR)/crtend.o \
$(ARCHDIR)/crtn.o

.PHONY: all clean install install-headers install-kernel

.SUFFIXES: .o .c .asm .bin .kernel

all: lunux.kernel

%.o: %.c
	$(CC) -MD -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

%.o: %.asm
	nasm -f elf32 $< -o $@


lunux.kernel: $(OBJS) $(ARCHDIR)/linker.ld
	$(CC) -T $(ARCHDIR)/linker.ld -o $@ $(CFLAGS) $(LINK_LIST)
	grub-file --is-x86-multiboot lunux.kernel

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