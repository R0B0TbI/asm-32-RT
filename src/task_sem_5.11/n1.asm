%include "st_io.inc"

section .data
    arr dd 1, 2, 3, 4, 5, -1, 2, -3, 4, -7, 67, 32, -78, 14, 11, 7, 6, -5, 4, 0  ; -sum = -94

section .bss
    k resd 1
    sum resd 1

section .text
    global _start

_start:
    GETUN eax
    mov [k], eax
    mov dword[sum], ebx

    mov ecx, 20
    sub ecx, [k]
l:
    mov  ebx, [arr + eax*4]
    cmp ebx, 0
    jge if
    add [sum], ebx
if:
    add eax, 1
    loop l

    SIGNINT [sum]
    PUTCHAR 0x0A
    FINISH
