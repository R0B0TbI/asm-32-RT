%include "../st_io.inc"

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global _start

my_sub:
    pushad

    mov eax, [a]  
    sub eax, [b] 
    mov [c], eax     

    popad

    ret

_start:
    GETSIG [a]
    GETSIG [b]

    call my_add

    SIGNINT [c]
    PUTCHAR 0x0A

    call my_sub

    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80

my_add:
    pushad

    mov eax, [a]  
    add eax, [b] 
    mov [c], eax     

    popad

    mov esp, ebp
    pop ebp

    ret