[bits 16]
[org 0x7c00]

start:

    mov [BOOT_DRIVE], dl

    mov bp,0x9000
    mov sp,bp

    mov bx,InitMSG
    call print

    mov bx,0x8000
    mov ax, 0x0000
    mov es, ax
    xor ax, ax 
    mov dh,1
    call disk_load

    jmp 0x0000:0x8000


%include "stage1/boot_print.asm"
%include "stage1/boot_mem.asm"

InitMSG:
    db "Initialized",0

BOOT_DRIVE:
    db 0


times 510-($-$$) db 0
dw 0xaa55