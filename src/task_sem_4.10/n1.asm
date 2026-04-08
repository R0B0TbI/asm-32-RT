%include "st_io.inc"

section .text
    global _start

_start:
    mov ebx, 0
flag:
    GETCHAR
    cmp al, 0x0A
    je finish

    cmp al, '0'     
    jb flag
    cmp al, '9'         
    ja flag

    sub al, '0'
    
    movzx eax, al 
    lea ebx, [eax + ebx]
    jmp flag

finish:
    SIGNINT ebx
    PUTCHAR 0x0A
    FINISH

