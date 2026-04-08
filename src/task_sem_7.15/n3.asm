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

    mov ecx, ebp
    xor al, al
    sub ecx, 4

delete_zeros:
    mov ebx, [ecx]
    cmp ebx, 0
    jne next

    mov esi, ecx
    
dec_loop:
    cmp esi, esp
    je finish_dec

    mov edx, [esi - 4]
    mov [esi], edx
    sub esi, 4
    jmp dec_loop

finish_dec:
    add esp, 4        
    jmp delete_zeros

next:
    cmp ecx, esp
    je print
    sub ecx, 4
    jmp delete_zeros

print:
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