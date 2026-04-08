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

count_neg:
    mov ebx, [ecx]
    cmp ebx, 0
    jge count_next

    inc al

count_next:
    cmp ecx, esp
    je end
    sub ecx, 4
    jmp count_neg
    
end:
    movzx eax, al
    PRINT 'Negative numbers count'
    PUTCHAR 0x20
    SIGNINT eax
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80
