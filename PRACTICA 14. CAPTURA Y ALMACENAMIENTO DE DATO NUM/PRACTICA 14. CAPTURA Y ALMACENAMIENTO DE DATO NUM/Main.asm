
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Validacion y conversion decimal

INCLUDE Irvine32.inc

.data
cantidadInicial DWORD 25
cantidadRecibida DWORD ?
existenciaActual DWORD ?
recepcion BYTE "Ingrese una cantidad (1-99): ",0
msgError BYTE "Cantidad recibida invalida",0
msg1 BYTE "Existencia inicial ",0
msg2 BYTE " + recepcion de ",0
msg3 BYTE " existencia actual ",0
msg4 BYTE " unidades",0
cadena BYTE 10 DUP(0)
buffer BYTE 3 DUP(0)

.code
main PROC

capturar:
    mov edx, OFFSET recepcion
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString

    ; Valida que se ingresen entre 1 y 2 caracteres
    cmp eax, 0
    je error
    cmp eax, 2
    ja error

    ; Comprueba que el primer caracter sea un numero del 0 al 9
    mov bl, buffer[0]
    cmp bl, '0'
    jb error
    cmp bl, '9'
    ja error

    cmp eax, 1
    je unDigito

    ; Comprueba que el segundo caracter tambien sea numerico
    mov bl, buffer[1]
    cmp bl, '0'
    jb error
    cmp bl, '9'
    ja error

    ; Convierte el primer digito ASCII a numero y lo multiplica por 10
    movzx eax, buffer[0]
    sub eax, '0'
    mov ebx, 10
    mul ebx              ; Multiplica EAX por EBX, resultado en EDX:EAX

    ; Convierte el segundo digito y lo suma a las decenas
    movzx ebx, buffer[1]
    sub ebx, '0'
    add eax, ebx
    jmp validarRango

unDigito:
    movzx eax, buffer[0]
    sub eax, '0'         ; Convierte el caracter ASCII a numero

validarRango:
    ; Comprueba que la cantidad este entre 1 y 99
    cmp eax, 1
    jb error
    cmp eax, 99
    ja error

    ; Suma la cantidad recibida a la existencia inicial
    mov cantidadRecibida, eax
    mov eax, cantidadInicial
    add eax, cantidadRecibida
    mov existenciaActual, eax

    ; MUESTRA LA EXISTENCIA INICIAL
    mov edx, OFFSET msg1
    call WriteString

    mov eax, cantidadInicial
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    ; MUESTRA LA CANTIDAD RECIBIDA
    mov edx, OFFSET msg2
    call WriteString

    mov eax, cantidadRecibida
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    ; MUESTRA LA EXISTENCIA ACTUAL
    mov edx, OFFSET msg3
    call WriteString

    mov eax, existenciaActual
    mov esi, OFFSET cadena
    call convertirDecimal

    mov edx, OFFSET cadena
    call WriteString

    mov edx, OFFSET msg4
    call WriteString

    call Crlf
    exit

error:
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp capturar         ; Vuelve a solicitar la cantidad

main ENDP

; CONVIERTE EL NUMERO DE EAX A ASCII
convertirDecimal PROC

    mov ecx, 0
    mov ebx, 10

convertirLoop:
    mov edx, 0
    div ebx              ; Divide EDX:EAX entre 10
                         ; Cociente en EAX y residuo en EDX

    push edx             ; Guarda cada residuo en la pila
    inc ecx

    cmp eax, 0
    jne convertirLoop    ; Repite hasta que el cociente sea cero

cadenaLoop:
    pop edx              ; Recupera los digitos en orden inverso
    add dl, '0'          ; Convierte el digito a ASCII

    mov [esi], dl
    inc esi

    loop cadenaLoop      ; Repite hasta que ECX llegue a cero

    mov BYTE PTR [esi], 0
    ret

convertirDecimal ENDP

END main
