BITS 64

global memcpy

memcpy:
    mov rcx, 0
.loop:
    cmp rcx, rdx
    je .return
    mov bl, [rsi + rcx]
    mov [rdi + rcx], bl
    inc rcx
    jmp .loop

.return:
    mov rax, rdi
    ret