
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Desplazamientos y rotaciones

INCLUDE Irvine32.inc

.data

.code

main PROC
    mov eax, 0          
    mov ebx, 0         
    mov ecx, 0          
    mov edx, 0          

    ; 1 - SHL: DESPLAZAMIENTO A LA IZQUIERDA
    mov al, 10000000b   ; AL = 128 en binario
    shl al, 1           ; Mueve los 8 bits una posicion a la izquierda
                        ; AL = 00000000, el bit 1 que sale pasa a CF

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; 2 - SHR: DESPLAZAMIENTO A LA DERECHA
    mov al, 00001101b   ; AL = 13 en decimal
    shr al, 1           ; Mueve los bits una posicion a la derecha
                        ; AL = 00000110 (6), el ultimo bit pasa a CF

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; 3 - SAR: DESPLAZAMIENTO CON SIGNO
    mov al, -9          ; AL = 11110111, representa -9
    sar al, 1           ; Desplaza a la derecha conservando el bit de signo
                        ; AL = 11111011, representa -5

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; 4 - DESPLAZAMIENTO CON CONSTANTE
    mov al, 00001111b   ; AL = 15 en decimal
    shl al, 2           ; Desplaza dos posiciones a la izquierda
                        ; AL = 00111100, equivalente a 60

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; 5 - DESPLAZAMIENTO UTILIZANDO CL
    mov al, 00010100b   ; AL = 20 en decimal
    mov cl, 2           ; CL indica desplazar dos posiciones
    shr al, cl          ; Divide 20 entre 4 mediante desplazamiento
                        ; AL = 00000101, equivalente a 5

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; 6 - OPERACIONES DE ROTACION

    ; ROR - ROTACION A LA DERECHA
    mov al, 10000001b   ; AL = 129 en decimal
    ror al, 1           ; El bit 0 pasa al bit 7 y tambien a CF
                        ; AL = 11000000, equivalente a 192

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; ROL - ROTACION A LA IZQUIERDA
    mov al, 10000001b   ; AL = 129 en decimal
    rol al, 1           ; El bit 7 pasa al bit 0 y tambien a CF
                        ; AL = 00000011, equivalente a 3

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; RCL - ROTACION A LA IZQUIERDA CON ACARREO
    clc                 ; Coloca CF = 0
    mov al, 10000001b   ; AL = 10000001, CF = 0
    rcl al, 1           ; El bit 7 pasa a CF y el CF anterior al bit 0
                        ; AL = 00000010, CF = 1

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    ; RCR - ROTACION A LA DERECHA CON ACARREO
    clc                 ; Coloca CF = 0
    mov al, 10000001b   ; AL = 10000001, CF = 0
    rcr al, 1           ; El bit 0 pasa a CF y el CF anterior al bit 7
                        ; AL = 01000000, CF = 1

    call DumpRegs       ; Muestra registros y banderas
    call WriteBin       ; Muestra EAX en binario

    exit                ; Finaliza el programa
main ENDP

END main
