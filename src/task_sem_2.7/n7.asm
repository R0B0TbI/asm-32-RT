%include "st_io.inc"

section .data
    a db 1
    b db 2
    c db 3
    d dw 4

section .bss
    z resw 1

section .text
    global _start

_start:
    movsx ax, byte[a]
    movsx bx, byte[b]

    add bx, ax
    idiv bx
    mov bx, word[10]
    imul bx
    mov cx, ax

    movsx ax, byte[b]
    movsx bx, byte[c]
    mov dx, word[d]
    
    add bx, dx
    idiv bx
    mov bx, word[10]
    imul bx

    add ax, cx
    movsx eax, ax
    SIGNINT eax
    PUTCHAR 0x0A

    FINISH

    


