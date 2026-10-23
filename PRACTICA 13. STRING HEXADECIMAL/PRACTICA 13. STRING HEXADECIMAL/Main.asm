; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Conversion hexadecimal a ASCII

INCLUDE Irvine32.inc

.data
    valorOriginal DWORD 12AB34CDh  ; Valor hexadecimal original
    bufferHex     BYTE 9 DUP(0)    ; Espacio para 8 caracteres y el cero final

.code
main PROC
    mov eax, 12AB34CDh    ; Guarda el numero hexadecimal en EAX
    mov ecx, 8            ; Contador de los 8 digitos hexadecimales
    mov esi, 7            ; Inicia en la ultima posicion del buffer

conv_loop:
    push eax              ; Guarda EAX para recuperar el numero original
    and eax, 0Fh          ; Extrae los ultimos 4 bits de EAX
                          ; Obtiene un digito hexadecimal entre 0 y 15

    cmp al, 9             ; Compara el digito obtenido con 9
    jbe es_num            ; Salta si AL es menor o igual a 9

    add al, 'A' - 10      ; Convierte valores de 10 a 15 en letras A-F
    jmp almacenar         ; Salta para guardar el caracter

es_num:
    add al, '0'           ; Convierte valores de 0 a 9 en caracteres ASCII

almacenar:
    mov bufferHex[esi], al ; Guarda el caracter ASCII en el buffer
    pop eax               ; Recupera el valor de EAX antes del AND
    shr eax, 4            ; Desplaza EAX 4 bits a la derecha
                          ; Elimina el digito hexadecimal ya convertido
    dec esi               ; Retrocede una posicion en el buffer
    loop conv_loop        ; Disminuye ECX y repite hasta llegar a cero

    mov edx, OFFSET bufferHex ; Guarda la direccion del texto en EDX
    call WriteString      ; Muestra los 8 caracteres hexadecimales
    call Crlf             ; Realiza un salto de linea

    exit                  ; Finaliza el programa
main ENDP

END main