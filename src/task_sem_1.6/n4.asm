%include "st_io.inc"

section .bss
    ch_val resb 1
    sig_val resd 1
    un_val resd 1

section .text
    global _start

_start:    
    GETCHAR 
    PUTCHAR al
    PUTCHAR 0x0A

    GETUN [un_val]
    UNSINT [un_val]
    PUTCHAR 0x0A

    GETSIG [sig_val]
    SIGNINT [sig_val]
    PUTCHAR 0x0A

    FINISH
