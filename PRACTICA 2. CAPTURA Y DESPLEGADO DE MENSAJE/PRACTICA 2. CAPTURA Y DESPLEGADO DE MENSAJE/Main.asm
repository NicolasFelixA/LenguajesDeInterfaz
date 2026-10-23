; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.data
    mensaje BYTE "Escribe tu nombre: ", 0   ;declara una cadena de texto que sera nuestro mensaje a desplegar en consola
    nombre BYTE 30 DUP(0)                   ,declara la variable de 30 Bytes disponibles y les asigna un 0 a cada uno. aqui guardaremos el texto q lee la consola

.code
main PROC

    mov edx, OFFSET mensaje 
    call WriteString        ;Despliegue del msnsaje a desplegar

    mov edx, OFFSET nombre  ;mueve a donde estará la dirección de memoria donde se almacenará el texto.
    mov ecx, SIZEOF nombre  ;Indica la cantidad máxima de caracteres que puede escribir el usuario.
                            
    call ReadString         ;llama a la funcion de leer en consola, esta debe de tener en edx parado en la direccion donde almacena el texto, ecx la cantidad maxima a leer y en eax guarda lo leido

    mov edx, OFFSET nombre      
    call WriteString    ;funcion de escribir texto, se escribe lo que tenga en EAX
    call Crlf

    exit

main ENDP

END main