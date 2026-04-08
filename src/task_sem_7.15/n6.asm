%include "../st_io.inc"

section .bss
    a resd 1

section .text
    global _start

_start: 
    GETSIG [a]
    mov eax, [a]
    GETSIG [a]
    mov ecx, [a]
    GETSIG [a]
    mov edx, [a]
    GETSIG [a]
    mov ebx, [a]
    GETSIG [a]
    mov esi, [a]
    GETSIG [a]
    mov edi, [a]

    pushad
    PRINT 'Number enter'
    PUTCHAR 0x20
    GETSIG [a]
    mov ebp, [a]         
    mov [esp + 16], ebp
    popad

    SIGNINT ebx
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80
