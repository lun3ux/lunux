[bits 16]
  
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000
    mov dh, 2

    call disk_load
    jmp $


%include "stage1/boot_mem.asm"
%include "stage1/boot_print.asm"
%include "stage1/boot_printhex.asm"

times 510 - ($-$$) db 0
dw 0xaa55