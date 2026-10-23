; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE C:\Irvine\Irvine32.inc
.data

.code
main PROC
    mov ecx, 20    ;asignamos valor inicial a ecx, en este código sirve para asignar las veces q se repetirá el ciclo

ciclo:             ;etiqueta de salto, al poner loop ciclo se regresa a esta parte del codigo con ecx decrementado
    mov eax, ecx    ; asignamos el valor de ecx en eax porque el writeDec imprime lo que hay en eax

    call WriteDec   ;imprimimos lo que hay en eax
    call Crlf       ;Salto de línea
    loop ciclo      : loop es el ciclo funciona saltando sin condicion a la etiqueta que le pongamos en este caso ciclo y resta 1 a Ecx asi hasta llegar a 0 y se active la Zero Flag que será su cond de final

    exit
    
main ENDP

END main