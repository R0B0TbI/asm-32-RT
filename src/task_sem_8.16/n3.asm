%include "../st_io.inc"

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global _start

my_sub:
    sub eax, ebx
    mov [c], eax     

    ret

_start:
    GETSIG [a]
    GETSIG [b]

    mov eax, [a]
    mov ebx, [b]

    call my_add

    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, [a]
    mov ebx, [b]

    call my_sub

    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80

my_add:
    add eax, ebx
    mov [c], eax    

    ret