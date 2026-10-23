
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Operaciones aritmeticas

INCLUDE Irvine32.inc

.data

.code
main PROC

    ; ADD y SUB - Suma y resta
    mov eax, 75
    mov ebx, 35

    add eax, ebx       ; EAX = 110
    sub eax, 20        ; EAX = 90
    nop                ; No realiza ninguna operacion

    ; Suma sin signo con desbordamiento
    mov eax, 15
    mov al, 250

    add al, 10         ; AL = 4, se activa CF
    nop

    ; Suma con signo y desbordamiento
    mov eax, 0
    mov al, 125

    add al, 5          ; AL = 130, se activa OF porq se sale del rango de -128 a 127
    nop

    ; MUL - Multiplicacion sin signo
    mov eax, 30
    mov ebx, 6

    mul ebx            ; EDX:EAX = 30 * 6 = 180
    nop

    ; IMUL - Multiplicacion con signo
    mov eax, -9

    imul eax, eax, 4   ; EAX = -36
    nop

    ; Multiplicacion con resultado de 64 bits
    mov eax, 85000
    mov ebx, 75000

    mul ebx            ; EDX:EAX = 6375000000
    nop

    ; DIV - Division sin signo
    mov eax, 144
    mov edx, 0         ; Limpia la parte alta del dividendo

    mov ebx, 12
    div ebx            ; EAX = 12, EDX = 0
    nop

    ; IDIV - Division con signo
    mov eax, -150
    cdq                ; Extiende el signo de EAX hacia EDX

    mov ebx, 15
    idiv ebx           ; EAX = -10, EDX = 0

    exit
main ENDP

END main
