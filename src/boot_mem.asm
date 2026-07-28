diskload:

    pusha
    push dx
    mov ah, 0x02 ;int 0x13, 0x02 is BIOS disk read function
    mov al, dh ; # of sectors to read
    mov cl, 0x02 ; cl sector number
    mov ch, 0x00 ; cylinder number
    mov dh, 0x00, ; head number
    ; dl = drive number
    mov dl, 0x80

    int 0x13

    pop dx
    cmp al,dh
    popa
    ret

dsk_err:
    mov bx, DK_ERR
    call print
    jmp dk_lp

dk_lp
    jmp $

DK_ERR: db "dsk Read err", 0
SCT_ERR db "inccorect # sct rd", 0