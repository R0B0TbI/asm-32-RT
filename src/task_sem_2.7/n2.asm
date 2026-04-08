%include "st_io.inc"

section .data
    A dw 254
    B dw 250

section .text
    global _start

_start:
    mov al, byte [A]
    mov bl, byte [B]
    add al, bl
    mov byte [A], al
    mov al, byte [A+1]   
    mov bl, byte [B+1]
    adc al, bl           
    mov byte [A+1], al

    movzx eax, word[A]
    SIGNINT eax
    PUTCHAR 0x0A
    
    mov eax, 1
    xor ebx, ebx
    int 0x80  
