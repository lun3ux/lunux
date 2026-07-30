[bits 16]

print:
    pusha
.start:
    mov al, [bx] 
    cmp al, 0 
    je .done

    push bx
    mov ah, 0x0e
    mov bh, 0x00
    mov bl, 0x07
    int 0x10 
    pop bx

    inc bx
    jmp .start
.done:
    popa
    ret