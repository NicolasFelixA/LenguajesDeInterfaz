; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.data
    numero BYTE "Escribe un numero: ", 0
    mensajeFin BYTE "Programa terminado, se ingreso el 0", 0

.code

main PROC
    
ciclo:
    mov edx, OFFSET numero 
    call WriteString        ;Mensaje de escriba numero

    call ReadInt            ;Lee el numero

    cmp eax, 0              ;Es cero?

    je fin                  ;si es cero salta a la etiqueta fin donde acaba el programa                
    
    jmp ciclo 

fin:
    mov edx, OFFSET mensajeFin
    call Crlf 
    call WriteString 

    exit 
main ENDP

END main