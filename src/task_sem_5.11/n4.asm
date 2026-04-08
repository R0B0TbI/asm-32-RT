%include "st_io.inc"

section .bss
    arr resw 10

section .text
    global _start

_start:
    
input:
    GETUN eax
    mov [arr], word eax


    FINISH
