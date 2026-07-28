[org 0x7c00]

mov bp, 0x9000



;
;       Beginning Bootloader of Lunux.
;       I dont know how to disable the stupid AI agents suggesting
;       code to me.
;


; BIOS:
;   Basic
;   Input
;   Output 
;   System

;CPU interrupts are specific commands that are used to 
;commmunicate with the BIOS, so this allows us to do things
;like print onto the screen accsess data from USB, and 
;basically everything else that is preripheral to the computer.

jmp $



times 510-($-$$) db 0
dw 0xaa55
