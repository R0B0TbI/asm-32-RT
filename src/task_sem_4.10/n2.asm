%include "st_io.inc"

section .bss
    a resd 1
    b resd 1
    h resd 1
    x resd 1
    val resd 1

section .text
    global _start

_start:
    PRINT "a: "
    GETSIG eax
    mov dword[a], eax

    PRINT "b: "
    GETSIG eax
    mov dword[b], eax

    PRINT "h: "
    GETSIG eax
    mov dword[h], eax

    mov eax, dword[a]
    mov dword[x], eax

    PUTCHAR 0x0A
    PRINT "X  |  MOD(X, 3)"
    PUTCHAR 0x0A

flag:
    mov eax, dword[x]
    cmp eax, dword[b]
    jg end

    mov eax, dword[x]
    mov ebx, 3
    cdq
    idiv ebx                

    mov dword[val], edx                
    
    SIGNINT dword[x]           
    
    PRINT "  |  "              
    SIGNINT dword[val]
    
    PUTCHAR 0x0A

    mov eax, dword [x]
    add eax, dword [h]
    mov dword [x], eax

    jmp flag     

end:
    mov eax, 1  ;FINISH
    xor ebx, ebx
    int 0x80