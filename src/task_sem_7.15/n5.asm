%include "../st_io.inc"

section .data
    a db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .text
    global _start

_start: 
    mov ecx, 10
    push ebp
    mov ebp, esp

loop_start:
    dec ecx
    lea eax, [a + ecx]
    push dword eax
    cmp ecx, 0
    jnz loop_start

    mov ecx, ebp
    sub ecx, 4

zero_bytes:
    mov eax, [ecx]
    mov byte [eax], 0
    
    cmp ecx, esp
    je next
    sub ecx, 4
    jmp zero_bytes
    

next:
    mov ecx, 10
    xor esi, esi

print_loop:
    mov eax, [a + esi]
    SIGNINT eax
    PUTCHAR 0x20
    inc esi
    cmp ecx, 0 
    je end
    dec ecx
    jmp print_loop

end:
    PRINT 'All bytes are zero!'
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80