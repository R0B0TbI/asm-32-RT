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
    sub ecx, 8

find_same:
    mov ebx, [ecx]
    mov esi, [ecx + 4]
    cmp ebx, esi
    je found

    cmp ecx, esp
    je end
    sub ecx, 4
    jmp find_same
    

found:
    inc al

end:
    movzx eax, al
    PRINT 'Same numbers found'
    PUTCHAR 0x20
    SIGNINT eax
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80