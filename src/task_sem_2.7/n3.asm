%include "st_io.inc"

section .data
    a_unsigned db 199
    b_unsigned dd 10

    a_signed   db -23
    b_signed   dw 4

section .text
    global _start

_start:
    movzx eax, byte [a_unsigned]
    mov [b_unsigned], eax
    SIGNINT [b_unsigned] ; 199
    PUTCHAR 0x0A

    movsx ax, byte [a_signed]
    mov [b_signed], ax
    movsx eax, word [b_signed]
    SIGNINT eax ; -23
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80