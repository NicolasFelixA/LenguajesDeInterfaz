; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.data
    msgIguales BYTE "Los numeros son iguales", 0        ;Msj a desplegar si son numeros iguales
    msgDiferentes BYTE "Los numeros son diferentes", 0  ;Msj a desplegar si son diferentes

.code
main PROC

    mov eax, 30 
    mov ebx, 30 ;se asigna valor en EAX y EBX

    cmp eax, ebx             ;CMP trabaja con una resta, si de esa resta da 0 se activa la zero flag

    je iguales                      ;JE ve si la Zero flag esta activa y si si esta salta a la parte del codigo con la etiqueda de iguales
    mov edx, OFFSET msgDiferentes   ;Esta parte del codigo solo llega si los numeros son diferentes pq la ZF era 0 y no hizo el salto de je iguales
    call WriteString                ;Escribe el msj de diferentes. WriteString escribe desde donde este ubicado edx hasta llegar al fin de la cadena o sea el 0 

    jmp fin                     ;Salta sin condicion a la etiqueta de fin

iguales:                        ;parte del codigo q se ejecuta si los numeros fueron iguales
    mov edx, OFFSET msgIguales  
    call WriteString            ;despliega msj de iguales

fin: 
    exit    ;FIn de programa

main ENDP

END main