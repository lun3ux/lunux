[bits 16]

%include 'stage1/boot_print.asm'


mov bx, msg
call print

msg:
    db "STAGE 2 LOADED", 0

times 512-($-$$) db 0
