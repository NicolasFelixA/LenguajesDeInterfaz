
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Manejo de pila y procedimientos

INCLUDE Irvine32.inc

.data

.code
main PROC

    ; PUSH - Guarda un valor en la pila
    mov eax, 65
    push eax

    nop

    ; POP - Recupera el valor de la pila
    mov eax, 0
    pop ebx             ; EBX = 65

    nop

    ; Guardar varios valores en la pila
    mov eax, 15
    push eax

    mov eax, 25
    push eax

    mov eax, 35
    push eax

    nop

    ; POP recupera los valores en orden inverso
    pop eax             ; EAX = 35
    pop ebx             ; EBX = 25
    pop ecx             ; ECX = 15

    nop

    ; Guardar y recuperar registros
    mov eax, 150
    mov ebx, 250

    push eax
    push ebx

    pop ebx             ; EBX = 250
    pop eax             ; EAX = 150

    nop

    ; CALL - Llama a un procedimiento
    mov eax, 70
    mov ebx, 120

    call aumentar ; Ejecuta el procedimiento

    nop

    exit
main ENDP

; Procedimiento que aumenta EAX en 20
aumentar PROC

    add eax, 20         ; EAX = 90

    ret                 ; Regresa al programa principal

aumentar ENDP

END main
