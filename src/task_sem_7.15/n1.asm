%include "../st_io.inc"

section .bss
    a resd 1

section .text
    global _start

_start: 
    mov ecx, 10
    push ebp
    mov ebp, esp

loop_start:
    sub ecx, 1
    GETSIG [a]
    mov eax, [a]
    push eax
    cmp ecx, 0
    jnz loop_start

    push dword [esp]           
    push dword [esp + 8]       
    pop dword [esp + 4]
    pop dword [esp + 4]   

    mov ecx, ebp
    sub ecx, 4

print_loop:
    mov eax, [ecx]
    SIGNINT eax
    PUTCHAR 0x20

    cmp ecx, esp
    je end
    sub ecx, 4
    jmp print_loop
    
end:
    PUTCHAR 0x0A
    mov eax, 1
    xor ebx, ebx
    int 0x80