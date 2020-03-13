org 0x7c00
jmp 0x0000:start

string times 40 db 0; string de tamanho 40 com todos os espaços zerados
endl db ' ', 13, 10, 0 ; '/n'
amarelo db "AMARELO", 13, 10, 0  ;reserva espaço na memória
verde db "VERDE", 13, 10, 0
vermelho db "VERMELHO", 13, 10, 0
azul db "AZUL", 13, 10, 0

getchar:
    mov ah, 0
    int 16h
    ret

putchar:
    mov ah, 0x0e
    int 10h
    ret
ler:
    mov al, 0
    .for:
        call getchar
        stosb
        cmp al, 13; ve se al = '/n'
        je .fim
        inc ecx
        call putchar
        jmp .for
    .fim:
        dec di
        mov al, 0
        stosb ;coloca o ultimo valor da string como 0
        mov si, endl
    ret

comparar:
    cmp ecx, 4
    je .azul
    cmp ecx, 5
    je .verde
    cmp ecx, 7
    je .amarelo
    cmp ecx, 8
    je .vermelho


    .azul:
        
    ret
start:

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ecx, 0

    mov ax, 0013h
    mov bh, 0
    mov bl, 47
    int 10h

    mov di, string ;di para o inicio da string
    call ler
    call comparar
times 510-($-$$) db 0
dw 0xAA55 
