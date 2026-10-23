; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.data
alarmaEncencida BYTE "Alarma encendida",0
alarmaApagada BYTE "Alarma apagada",0

; Bit 0 - Estado de la computadora
; Bit 1 - Estado de la alarma
; Bit 2 - Conexion a internet
; 0 = Apagado, 1 = Encendido
; Estado inicial: 00000101 (computadora e internet encendidos)

.code
main PROC

    ; AND - Comprueba si el bit de la alarma esta activado
    mov eax, 0          ; Inicializa EAX en cero
    mov al, 00000101b   ; AL = 5, computadora e internet encendidos
    and al, 00000010b  ; Compara los bits con la mascara 00000010
                       ; AL = 0, porque el bit de la alarma esta apagado

    call WriteBin       ; Muestra el resultado de AL en binario

    nop

    ; OR - Activa el bit de la alarma
    mov eax, 0          ; Reinicia EAX en cero
    mov al, 00000101b   ; Carga nuevamente el estado inicial
    or al, 00000010b   ; Activa el bit 1 sin modificar los demas
                       ; AL = 00000111, ahora la alarma esta encendida

    call WriteBin       ; Muestra el nuevo estado en binario

    nop

    ; XOR - Invierte el bit de la computadora
    mov eax, 0          ; Reinicia EAX en cero
    mov al, 00000101b   ; Carga computadora e internet encendidos
    xor al, 00000001b  ; Invierte solamente el bit 0
                       ; AL = 00000100, computadora apagada

    call WriteBin       ; Muestra el resultado despues de XOR
    call Crlf           ; Realiza un salto de linea

    nop

    ; TEST - Comprueba el bit de la alarma sin modificar AL
    mov eax, 0          ; Reinicia EAX en cero
    mov al, 00000111b   ; Carga los tres estados encendidos

    test al, 00000010b ; Realiza AND para actualizar las banderas
                       ; Como el resultado es distinto de 0, ZF = 0
    jz apagarAlarma     ; Salta si ZF = 1 (alarma apagada)

    mov edx, OFFSET alarmaEncencida ; Guarda la direccion del mensaje
    call WriteString    ; Muestra "Alarma encendida"
    call Crlf           ; Salto de linea
    jmp fin             ; Evita ejecutar el mensaje de alarma apagada

apagarAlarma:
    mov edx, OFFSET alarmaApagada ; Direccion del mensaje de alarma apagada
    call WriteString    ; Muestra "Alarma apagada"
    call Crlf           ; Salto de linea

fin:
    exit                ; Finaliza el programa
main ENDP

END main
