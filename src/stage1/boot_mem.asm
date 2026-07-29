read_sect:
    mov ah, 02h
    mov al, 01h
    mov ch, 0h
    mov cl, 0h
    mov dh, 0h
    mov dl, 80h
    int 0x13
    jc .fail        ; Jump if Carry Flag (CF) is set (failure)
    ret

.fail:
    mov si, DK_ERR
    call print
    call dk_lp
dk_lp:
    jmp $

DK_ERR: db "dsk Read err", 0
SCT_ERR db "inccorect # sct rd", 0