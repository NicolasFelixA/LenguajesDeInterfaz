; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - 
INCLUDE Irvine32.inc

.data
    cadena BYTE "Escribe una cadena (ejemplo TEC-123): ", 0
    msgValido BYTE "Cadena valida", 0
    msgInvalido BYTE "Cadena invalida", 0
    MAX = 20
    stringIn BYTE MAX+1 DUP(?) ; Reserva 21 bytes para la cadena

.code
main PROC
    mov edx, OFFSET cadena
    call WriteString

    mov edx, OFFSET stringIn  ; Direccion donde se guardara la cadena
    mov ecx, MAX             ; Maximo de caracteres permitidos
    call ReadString           ; Lee la cadena y guarda su longitud en EAX

    cmp eax, 7              ; Comprueba que tenga exactamente 7 caracteres
    jne cadenaInvalida          ; Si no tiene 7, es invalida

    mov esi, 0              ; Indice para recorrer la cadena
    mov ecx, 3                  ; Se revisaran las primeras 3 letras

validarLetras:
    mov al, stringIn[esi]   ; Obtiene el caracter en la posicion ESI

    cmp al, 'A'                 ; Compara si es menor que A
    jl cadenaInvalida       ; Si es menor, no es una letra valida

    cmp al, 'Z'             ; Compara si es mayor que Z
    jg cadenaInvalida       ; Si es mayor, no es una letra valida

    inc esi                     ; Avanza a la siguiente posicion
    loop validarLetras      ; Repite 3 veces usando ECX

    mov al, stringIn[3]     ; Obtiene el cuarto caracter
    cmp al, '-'                 ; Verifica que sea un guion
    jne cadenaInvalida      ; Si no es guion, es invalida

    mov esi, 4               ; Comienza desde el quinto caracter
    mov ecx, 3              ; Se revisaran los ultimos 3 numeros

validarNumeros:
    mov al, stringIn[esi]   ; Obtiene el caracter actual

    cmp al, '0'             ; Compara con el numero 0 en ASCII
    jb cadenaInvalida        ; Si es menor que 0, es invalido

    cmp al, '9'              ; Compara con el numero 9 en ASCII
    ja cadenaInvalida       ; Si es mayor que 9, es invalido

    inc esi                  ; Avanza al siguiente caracter
    loop validarNumeros     ; Repite hasta revisar los 3 numeros

    jmp cadenaValida        ; Si paso las pruebas, es valida

cadenaValida:
    mov edx, OFFSET msgValido
    call WriteString
    jmp fin                 ; Evita ejecutar cadenaInvalida

cadenaInvalida:
    mov edx, OFFSET msgInvalido
    call WriteString

fin:
    call Crlf               ; Salto de linea
    exit                    ; Termina el programa

main ENDP
END main
