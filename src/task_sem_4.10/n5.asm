%include "st_io.inc"

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global _start

_start:
    PRINT "a: "
    GETSIG eax
    mov [a], eax

    PRINT "b: "
    GETSIG ebx
    mov [b], ebx

    lea eax, [eax + eax*4]
    lea ecx, [ebx + eax*2 + 14]
    mov [c], ecx

    PRINT "c = 10*a + b + 14 = "
    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, [a]
    mov ebx, [b]
    lea eax, [eax + eax*2]
    lea ecx, [ebx + eax*8 - 15]
    mov [c], ecx 

    PRINT "c = 24*a - 15 + b = "
    SIGNINT [c]
    PUTCHAR 0x0A
    FINISH

