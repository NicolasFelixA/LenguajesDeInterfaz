; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - INC y DEC

INCLUDE Irvine32.inc

.code
main PROC

    ; INC - Incrementa de 1 en 1 hasta 10
    mov ebx, 1

incrementar:
    mov eax, ebx
    call WriteDec
    call Crlf

    inc ebx             ; Suma 1 a EBX
    cmp ebx, 10         ; Compara con 10
    jle incrementar     ; Salta si es menor o igual

    call Crlf

    ; DEC - Decrementa de 1 en 1 hasta 1
    mov ebx, 10

decrementar:
    mov eax, ebx
    call WriteDec
    call Crlf

    dec ebx             ; Resta 1 a EBX
    cmp ebx, 1          ; Compara con 1
    jge decrementar     ; Salta si es mayor o igual

    exit

main ENDP
END main