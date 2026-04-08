%include "st_io.inc"

section .bss
    a resw 1
    b resw 1

section .text
    global _start

_start:
    PRINT "r = (a - b) * (a + b)"
    PUTCHAR 0x0A
    PRINT "a: "
    GETSIG eax
    mov word[a], ax

    PRINT "b: "
    GETSIG eax
    mov word[b], ax

    movsx eax, word[a]
    mov ecx, eax
    movsx ebx, word[b]

    sub eax, ebx
    add ecx, ebx
    imul ecx

    PRINT 'r = '
    SIGNINT eax
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80
