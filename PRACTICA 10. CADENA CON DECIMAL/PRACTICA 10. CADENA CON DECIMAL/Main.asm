
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Operaciones y conversion decimal

INCLUDE Irvine32.inc

.data
    totalBytes DWORD 200000
    descargados DWORD ?
    restantes DWORD ?
    bloques DWORD ?
    porcentaje DWORD ?
    sobrantes DWORD ?
    bufferNum BYTE 11 DUP(0)

    msg1 BYTE "Bytes descargados: ", 0
    msg2 BYTE "Bytes restantes: ", 0
    msg3 BYTE "Porcentaje descargado: ", 0
    msg4 BYTE "Bloques completos: ", 0
    msg5 BYTE "Bytes sobrantes: ", 0

.code
main PROC

    ; Calcula los bytes descargados
    mov eax, 150
    mov ebx, 512
    mul ebx           ; Multiplica EAX por EBX, resultado en EDX:EAX
    mov descargados, eax   ; Guarda 76800 bytes

    mov edx, OFFSET msg1
    call WriteString
    mov eax, descargados
    call mostrarNumero

    ; Calcula los bytes que faltan
    mov eax, totalBytes
    sub eax, descargados   ; Resta 200000 - 76800 en EAX
    mov restantes, eax   ; Guarda 123200 bytes

    mov edx, OFFSET msg2
    call WriteString
    mov eax, restantes
    call mostrarNumero

    ; Calcula el porcentaje descargado
    mov eax, descargados
    mov ebx, 100
    mul ebx                 ; Multiplica 76800 * 100 en EDX:EAX
    mov ebx, totalBytes
    div ebx                ; Divide EDX:EAX entre 200000
                         ; Cociente en EAX, residuo en EDX
    mov porcentaje, eax    ; Guarda 38 (parte entera)

    mov edx, OFFSET msg3
    call WriteString
    mov eax, porcentaje
    call mostrarNumero

    ; Calcula bloques completos de 1024 bytes
    mov eax, descargados
    mov edx, 0             ; Limpia la parte alta del dividendo
    mov ebx, 1024
    div ebx                ; Divide 76800 entre 1024
                        ; EAX = 75, EDX = 0
    mov bloques, eax       ; Guarda el numero de bloques
    mov sobrantes, edx     ; Guarda los bytes que sobran

    mov edx, OFFSET msg4
    call WriteString
    mov eax, bloques
    call mostrarNumero

    mov edx, OFFSET msg5
    call WriteString
    mov eax, sobrantes
    call mostrarNumero

    exit
main ENDP

; Procedimiento para mostrar un numero
mostrarNumero PROC
    mov esi, OFFSET bufferNum ; Direccion donde se guardara el texto
    call convertirDecimal     ; Convierte EAX a caracteres ASCII
    mov edx, OFFSET bufferNum
    call WriteString          ; Muestra el numero convertido
    call Crlf
    ret
mostrarNumero ENDP

; Procedimiento para convertir decimal a ASCII
convertirDecimal PROC
    mov ecx, 0             ; Contador de digitos
    mov ebx, 10            ; Divisor para obtener cada digito

convertirLoop:
    mov edx             ; Limpia EDX antes de dividir
    div ebx                ; Divide EDX:EAX entre EBX (10)
                        ; Cociente en EAX, residuo en EDX
    push edx               ; Guarda el residuo en la pila
    inc ecx          ; Cuenta un digito

    cmp eax, 0             ; Verifica si el cociente llego a cero
    jne convertirLoop      ; Repite si todavia quedan digitos

cadenaLoop:
    pop edx                ; Recupera los digitos en orden inverso
    add dl, '0'          ; Convierte el residuo a caracter ASCII
    mov [esi], dl          ; Guarda el caracter en el buffer
    inc esi               ; Avanza a la siguiente posicion
    loop cadenaLoop        ; Repite ECX veces

    mov BYTE PTR [esi], 0  ; Agrega el terminador de cadena
    ret                    ; Regresa al procedimiento anterior

convertirDecimal ENDP

END main
