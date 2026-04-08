%include "../st_io.inc"

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global _start

my_sub:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]  
    sub eax, [ebp + 12] 
    mov [c], eax         

    mov esp, ebp
    pop ebp

    ret

_start:
    GETSIG [a]
    GETSIG [b]

    pushad
    push dword [a]
    push dword [b]
    call my_add
    add esp, 8
    popad

    SIGNINT [c]
    PUTCHAR 0x0A

    pushad
    push dword [b]
    push dword [a]
    call my_sub
    popad

    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80

my_add:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]  
    add eax, [ebp + 12] 
    mov [c], eax         

    mov esp, ebp
    pop ebp

    ret 8