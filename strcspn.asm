BITS 64

global strcspn

strcspn:
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
    xor rdx, rdx

    jmp .loop

.add_one:
    inc rdi
    inc rdx
    xor rcx, rcx
.loop:
    mov r8b, [rdi]
    mov r9b, [rsi + rcx]

    cmp byte [rsi + rcx], 0
    je .add_one
    cmp byte [rdi], 0
    je .return
    cmp r8b, r9b
    je .return

    inc rcx
    jmp .loop

.return:
    mov rax, rdx
    ret
