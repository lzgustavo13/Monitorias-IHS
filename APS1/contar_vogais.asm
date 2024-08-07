ORG 0x7C00
BITS 16

jmp start

mensagem: db "Andson Bala", 0x0D, 0x0A, 0

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov si, mensagem
    call print_string
    call print_number

end:
    jmp $


print_string:
    .loop:
        lodsb; carrega em al byte[mensagem]
        cmp al, 0
        je .end

        ;mov ah, 0x0E
        ;int 0x10 -caso necessário printar a mensagem retirar comentário

        ;cmp para saber se é vogal
        cmp al, 'a'
        je .inc
        cmp al, 'e'
        je .inc
        cmp al, 'i'
        je .inc
         cmp al, 'o'
        je .inc
         cmp al, 'u'
        je .inc
        cmp al, 'A'
        je .inc
        cmp al, 'E'
        je .inc
        cmp al, 'I'
        je .inc
         cmp al, 'O'
        je .inc
         cmp al, 'U'
        je .inc
        jmp .loop

        ;label para incrementar
        .inc:
            inc cx
            jmp .loop
        
    .end:
        ret

print_number: ;printar ax
    mov ax, cx
    mov bx, 10
    mov cx, 0

    .loop:
        mov dx, 0
        div bx

        add dx, '0'
        push dx
        inc cx

        cmp ax, 0
        jne .loop

    .loop2:

        pop ax
        mov ah, 0x0E
        int 0x10

        cmp ax, 0
        loop .loop2
    ret

; assinatura de boot

    times 510-($-$$) db 0
    dw 0xAA55
