%include "../st_io.inc"

section .bss
    a resd 5
      resd 5
    sum_pos resd 1
    sum_neg resd 1

section .text
    global _start

_start:
    call input_loop

    mov edx, [a]

    pushad
    push a
    push 10
    call neg_sum
    popad

    pushad
    push a
    push 10
    call pos_sum
    popad

    SIGNINT [sum_pos]
    PUTCHAR 0x0A
    SIGNINT [sum_neg]
    PUTCHAR 0x0A

    mov eax, 1
    xor ebx, ebx
    int 0x80


neg_sum:
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 8]
    xor esi, esi

.search:
    mov ebx, [ebp + 12]
    mov eax, [ebx + esi * 4]
    cmp eax, 0

    jge .skip      

    add [sum_neg], eax

.skip:
    inc esi
    loop .search

    mov esp, ebp
    pop ebp

    ret 8



pos_sum:
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 8]
    xor esi, esi

.search:
    mov ebx, [ebp + 12]
    mov eax, [ebx + esi * 4]
    cmp eax, 0

    jle .skip      

    add [sum_pos], eax

.skip:
    inc esi
    loop .search

    mov esp, ebp
    pop ebp

    ret 8


input_loop:
    mov ecx, 10
    xor esi, esi

.loop_start:
    sub ecx, 1
    GETSIG [a + esi * 4]

    inc esi
    cmp ecx, 0
    jnz .loop_start

    ret 