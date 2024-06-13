    section .text
    global calc_coneV

calc_coneV:
;; criar novo stack frame
push ebp
mov ebp, esp
;; criar espaço para variaveis locais
;; se necessario, esp - (4 * qnt de local var)

;; inicia a FPU
finit

;; calula area
    fldpi
    fld dword[ebp+8]
    fmul st0,st0 
    fmul st0,st1
    fld dword[ebp+12]
    fmul st0,st1
    fld1
    fld1
    fadd st0,st1
    fld1
    fadd st0,st1
    fdiv st3,st0
    fld st3

;; destroi stack frame
mov esp, ebp
pop ebp

;; retorna. retorno em st0
ret

