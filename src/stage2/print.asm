VIDEOMEMORY equ 0xb8000
WHITEONBLACK equ 0x0f
SCREEN_WIDTH equ 80

cursor:
    dd VIDEOMEMORY


printString:
    pusha

    mov edx, [cursor]

.printLoop:
    mov al, [ebx]

    cmp al, 0
    je .done

    mov ah, WHITEONBLACK
    mov [edx], ax

    inc ebx
    add edx, 2

    jmp .printLoop

.done:
    mov [cursor], edx

    popa
    ret


println:
    pusha

    mov edx, [cursor]
    sub edx, VIDEOMEMORY
    mov eax, edx
    mov ecx, 160          ; 80 columns * 2 bytes
    xor edx, edx
    div ecx               ; eax = row, edx = remainder

    ; Move to next row
    mov eax, [cursor]
    sub eax, VIDEOMEMORY

    add eax, SCREEN_WIDTH*2
    sub eax, edx
    add eax, VIDEOMEMORY

    mov [cursor], eax

    popa
    ret