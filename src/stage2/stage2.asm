[bits 16]
[org 0x8000]

stage2_start:
mov ax, 0x2401
    int 0x15                  ; enable A20 bit

    mov ax, 0x3               ; set text-mode to 3
    int 0x10                  ; set VGA text-mode
    mov ebx, Stage2MSG
    call printString
    call println
    call switchToPM
    jmp $
%include "stage2/gdt.asm"
%include "stage2/print.asm"
%include "stage2/switch.asm"
 [bits 32]

BEGIN_PM:
    mov ax, dataSeg
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov esp, 0x80000

mov ebx, InitMSG
call printString
   
   
Stage2MSG:
db "Stage 2 Initialized", 0
RealModeMSG:
db "Initalized 32 Bit mode",0 
InitMSG:
 db "Initalized", 0

 times 512 - (($-$$) % 512) db 0