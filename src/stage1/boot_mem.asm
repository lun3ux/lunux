[bits 16]

disk_load:
    pusha

    mov ah, 0x00
    mov dl, [BOOT_DRIVE]
    int 0x13
    jc DK_ERR

    mov al, 0x01        ; number of sectors
    mov ah, 0x02

    mov ch, 0x00      ; cylinder
    mov cl, 0x02      ; sector
    mov dh, 0x00      ; head
    mov dl, [BOOT_DRIVE]
    int 0x13
    jc DK_ERR
    cmp al,1
    jne SCT_ERR
    popa
    ret

%include "stage1/boot_printhex.asm"


DK_ERR:
    mov bx, DISK_ERROR
    call print

    mov dl, ah      ; put BIOS error code in DX
    xor dh, dh
    call print_hex

    jmp disk_loop
SCT_ERR:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0