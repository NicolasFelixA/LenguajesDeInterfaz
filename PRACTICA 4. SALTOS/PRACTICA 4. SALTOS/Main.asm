; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.code
main PROC

    mov eax, 10
    cmp eax, 10
    je iguales  ; JE Salta si son iguales(si se activa la ZF despues de un CMP significa q son iguales y ejecuta el salto)
    jmp prueba2

iguales:
    call WriteDec
    call Crlf

prueba2:
    mov eax, 5
    sub eax, 5
    jz esCero   Salta si es cero (si la bandera ZF está activada, significa que el resultado fue cero y ejecuta el salto)
    jmp prueba3

esCero:
    call WriteDec
    call Crlf

prueba3:
    mov eax, 20
    cmp eax, 10
    jg mayor    JG: Salta si es mayor (después de un CMP, si el primer valor es mayor que el segundo ejecuta el salto. Se cumple cuando ZF = 0 y SF = OF).
    jmp prueba4

mayor:
    call WriteDec
    call Crlf

prueba4:
    mov eax, 5
    cmp eax, 10
    jl menor    JG: Salta si es mayor (después de un CMP, si el primer valor es mayor que el segundo ejecuta el salto. Se cumple cuando ZF = 0 y SF != OF).
    jmp finalizar

menor:
    call WriteDec
    call Crlf

finalizar:
    ; JMP - Salta sin condición
    jmp salir

salir:
    exit

main ENDP
END main