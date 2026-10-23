; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.data
    n1 BYTE "Escribe el primer numero a comparar: ", 0
    n2 BYTE "Escribe el segundo numero a comparar: ", 0

    msgIguales BYTE "Los numeros son iguales", 0
    msgMayor BYTE "El primer numero es mayor", 0
    msgMenor BYTE "El primer numero es menor", 0

    num1 DWORD ?    ;Reserva espacio de 32 bit 
    num2 DWORD ?

.code
main PROC

    mov edx, OFFSET n1 
    call WriteString    
    call ReadInt        ;Función para leer enteros, este almacena el numero leido en EAX
    mov num1, eax       ;Asigna el número leído a la variable num1

    mov edx, OFFSET n2 
    call WriteString 

    call ReadInt 
    mov num2, eax        ;Asigna el número leído a la variable num2

    mov eax, num1 
    mov ebx, num2 

    cmp eax, ebx    ;Compara num1 con num2

    je iguales 
    jg mayor        ;Dependiendo del resultado saltara al mensaje correspondiente
    jl menor 

iguales:
    mov edx, OFFSET msgIguales 
    call WriteString 

    jmp fin 

mayor:
    mov edx, OFFSET msgMayor  
    call WriteString 

    jmp fin 

menor:
    mov edx, OFFSET msgMenor 
    call WriteString 

fin:
    call Crlf 
    exit 

main ENDP

END main