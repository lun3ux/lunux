; boot.asm
MODULEALIGN equ  1 << 0
MEMINFO     equ  1 << 1
FLAGS       equ  MODULEALIGN | MEMINFO
MAGIC       equ  0x1BADB002
CHECKSUM    equ  -(MAGIC + FLAGS)

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

; Reserve a 16 KB stack space for C execution
section .bss
align 16
stack_bottom:
    resb 16384 ; 16 KiB
stack_top:

section .text
global _start
extern kernel_main  ; Tells assembler that kernel_main is in another file

_start:
    ; Set up the stack pointer
    mov esp, stack_top

    ; Call the global constructor init array (optional, but good practice)
    ; Call our C kernel entry function
    call kernel_main

    ; If kernel_main returns, disable interrupts and halt the CPU
    cli
.hang:
    hlt
    jmp .hang
