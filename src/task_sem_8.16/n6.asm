%include "../st_io.inc"

section .bss
    A resd 10
    L resd 1
    R resd 1
    K resd 1

section .text
    global _start

_start:
    call input_loop

    pushad
    push A
    push L
    push R
    push K
    call rotate_segment
    popad

    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80


rotate_segment:
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 8]
    xor esi, esi

.move:
    

.skip:
    inc esi
    loop .move

    mov esp, ebp
    pop ebp

    ret 8


input_loop:
    mov ecx, 10
    xor esi, esi

.loop_start:
    sub ecx, 1
    GETSIG [A + esi * 4]

    inc esi
    cmp ecx, 0
    jnz .loop_start

    GETSIG [L]
    GETSIG [R]
    GETSIG [K]

    ret 8 