;static int  x, y=25, t=19;
;static int *xp;
;xp =&t;
;           x = *xp;
;*xp = y;
;printf(“%d   %d\n”, x, *xp);
%include "st_io.inc"

section .data
    y dd 25
    t dd 19

section .bss
    x resd 1
    xp resd 1

section .text
    global _start

_start:
    mov dword [xp], t

    mov eax, [xp]
    mov ebx, [eax]
    mov [x], ebx

    ;mov ecx, [y]
    ;mov eax, [xp]
    ;mov [eax], ecx

    ;PRINT "RES: x = "
    ;mov eax, [x]
    SIGNINT [x]
    
    ;PRINT " | *xp = "
    ;mov eax, [xp]
    ;SIGNINT [eax]

    FINISH
