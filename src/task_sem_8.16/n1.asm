%include "../st_io.inc"

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global _start

_start:
    GETSIG [a]
    GETSIG [b]
    push dword [b]
    push dword [a]

    push dword .return_here 
    jmp my_add

.return:
    add esp, 8

    SIGNINT [c]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80

my_add:
    push ebp
    mov ebp, esp

    pushad

    mov eax, [ebp + 8]  
    add eax, [ebp + 12] 
    mov [c], eax     

    popad

    mov esp, ebp
    pop ebp

    pop ecx
    jmp ecx