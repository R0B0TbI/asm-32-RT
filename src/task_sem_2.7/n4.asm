%include "st_io.inc"

section .bss
    x resd 1
    ; y resd 1

section .text
    global _start

_start:
    GETSIG eax          
    mov dword [x], eax 

    mov al, byte [x]
    add al, 1
    mov byte [x], al

    mov al, byte [x+1]
    adc al, 0
    mov byte [x+1], al

    mov al, byte [x+2]
    adc al, 0 
    mov byte [x+2], al

    mov al, byte [x+3]
    adc al, 0
    mov byte [x+3], al

    mov eax, dword [x]
    SIGNINT eax
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80