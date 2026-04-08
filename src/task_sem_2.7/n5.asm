%include "st_io.inc"

section .bss
    x resb 1
    a resb 1

section .text
    global _start

_start:
    PRINT "x: "
    GETSIG eax
    mov byte[x], al

    PRINT "a: "
    GETSIG eax
    mov byte[a], al

    movsx eax, byte[x]
    mov ebx, eax
    imul ebx   ; -x^3
    imul ebx
    neg eax

    mov ecx, eax
    mov eax, ebx
    imul ebx    ; (10 * x^2 + 5)
    mov ebx, 10
    imul ebx
    add eax, 5

    sub ecx, eax
    mov eax, ecx
    movsx ebx, byte[a]
    cdq
    idiv ebx
    mov ebx, edx

    SIGNINT eax
    PRINT ' [%'
    SIGNINT edx
    PRINT ']'
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80
