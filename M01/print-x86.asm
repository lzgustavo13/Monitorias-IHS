; comentarios

ORG 0x7C00
BITS 16

jmp start

hello_world: db "hello world", 0x0D, 0x0A, 0

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov si, hello_world
    call print_string

    mov ax, 542
    call print_number

end:
    jmp $


print_string:
    .loop:
        lodsb; carrega em al byte[hello_world]
        cmp al, 0

        je .end

        mov ah, 0x0E
        int 0x10

        jmp .loop
        
    .end:
        ret

print_number:
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
