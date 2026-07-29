[bits 16]

xor ax, ax
mov ds, ax
mov es, ax

mov bp, 0x9000

mov bx, intro
call print
call print_nl
mov bx, message
call print
call print_nl
xor bx, bx

mov al, 02h
mov ah, 00h,
int 10h
xor ax, ax
mov si, 0x0500
call read_sect
mov dx, ax
call print_hex
jmp $

%include 'stage1/boot_print.asm'
%include 'stage1/boot_printhex.asm'
%include 'stage1/boot_mem.asm'


intro:
    db "LUNUX", 0

message:
    db "INITALIZING LUNUX BOOTLOADER", 0

times 510-($-$$) db 0
dw 0xaa55
