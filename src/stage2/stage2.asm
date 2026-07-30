times 256 dw 0x0000
mov bx, msg
call print

%include 'stage1/boot_print.asm'

msg:
    db "STAGE 2 LOADED", 0