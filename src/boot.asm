[bits 16]
[org 0x7c00]

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
call keyboardinput
xor bx, bx

mov ax, 0x0000
mov es, ax          ; Destination Segment ES=0x0000
mov bx, 0x0500      ; Destination Offset BX=0x0500
mov dl, 0x80        ; Drive 0 (Hard Drive)
mov ch, 0x00        ; Cylinder 0
mov cl, 0x02        ; Sector 2
mov dh, 0x00        ; Head 0
call read_sect

mov si, 0x0500
call print_hex
call print_nl

mov bx, read
call print
call print_nl


jmp $

%include 'boot_print.asm'
%include 'boot_printhex.asm'
%include 'boot_mem.asm'


intro:
    db "LUNUX", 0

message:
    db "INITALIZING LUNUX BOOTLOADER", 0

read:
    db "READING SECTOR COMPLETE", 0;

keyboardinput:
    xor al, al
    mov bl, al
    mov ah, 0x00
    int 0x16
    mov bl, al
    call print_nl
    call print
    jmp keyboardinput

times 510-($-$$) db 0
dw 0xaa55
