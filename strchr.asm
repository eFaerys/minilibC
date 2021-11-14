BITS 64

global strchr
strchr:
    cmp [rdi], sil
    je .return
    cmp byte [rdi], 0
    je .return_null

    inc rdi
    jmp strchr

.return_null:
    mov rax, 0
    ret
.return:
    mov rax, rdi
    ret