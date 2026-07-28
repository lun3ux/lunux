[org 0x7c00]

mov bp, 0x9000

mov bx, intro
call print
call print_nl


jmp $

%include 'boot_print.asm'
%include 'boot_printhex.asm'


intro:
    db "LUNUX", 0


times 510-($-$$) db 0
dw 0xaa55
