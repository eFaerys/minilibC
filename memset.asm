BITS 64

global memset

memset:
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .return
    mov [rdi + rcx], sil
    inc rcx
    jmp .loop

.return:
    mov rax, rdi
    ret
