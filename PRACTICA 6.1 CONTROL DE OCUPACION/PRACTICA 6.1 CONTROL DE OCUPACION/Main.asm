; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 

INCLUDE Irvine32.inc

.data
    textoCapacidad BYTE "Cantidad de espacios del estacionamiento: ", 0
    textoEntrada BYTE "Ingrese 1 para estacionar un auto: ", 0
    textoDisponibles BYTE "Espacios disponibles: ", 0
    textoLleno BYTE "Estacionamiento lleno, no se pueden estacionar mas autos", 0
    textoError BYTE "Ingrese una cantidad valida de espacios", 0

    lugaresLibres DWORD ?
    opcionAuto DWORD ?

.code
main PROC

    mov edx, OFFSET textoCapacidad
    call WriteString
    call ReadInt
    mov lugaresLibres, eax

    cmp lugaresLibres, 0    ; Verifica que la cantidad sea positiva

    jle errorCantidad

ciclo:
  
    cmp lugaresLibres, 0  ; Comprueba si el estacionamiento esta lleno
    je lleno

    mov edx, OFFSET textoEntrada
    call WriteString
    call ReadInt
    mov opcionAuto, eax

    cmp opcionAuto, 1
                            ; Solo permite estacionar si ingresa 1
    jne ciclo

    dec lugaresLibres

    mov edx, OFFSET textoDisponibles
    call WriteString
    mov eax, lugaresLibres
    call WriteDec
    call Crlf

    jmp ciclo

lleno:
    mov edx, OFFSET textoLleno
    call WriteString
    call Crlf
    jmp finalizar

errorCantidad:
    mov edx, OFFSET textoError
    call WriteString
    call Crlf

finalizar:
    exit

main ENDP
END main