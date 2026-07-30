switchToPM:
    mov ebx, GDTMsg
    call printString
    call println
    ; Load the GDT
    cli
    lgdt [gdtDesctriptor]

    mov ebx, GDTLd
    call printString
    call println



    ; Enable protected mode
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax
    ; Far jump:
    ; reloads CS using the protected-mode code selector
    jmp dword codeSeg:init_pm

[bits 32]

init_pm:
    call BEGIN_PM

GDTMsg:
    db "GDT Loading..",0

GDTLd:
    db "GDT Loaded.",0
ProtectedModeLoaded:
    db "Protected mode loaded.", 0
stackloaded:
    db "32 Bit Stack Created.", 0