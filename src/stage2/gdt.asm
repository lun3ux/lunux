gdt:
gdtNull:
    dq 0

gdtCode:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdtData:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b 
    db 11001111b
    db 0x00

gdtEnd:


gdtDesctriptor:
    dw gdtEnd - gdt - 1
    dd gdt


codeSeg equ gdtCode - gdt
dataSeg equ gdtData - gdt