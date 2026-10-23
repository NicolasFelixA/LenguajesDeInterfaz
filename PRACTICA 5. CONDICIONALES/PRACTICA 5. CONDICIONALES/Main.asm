; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2
INCLUDE Irvine32.inc

.code
main PROC

    mov ebx, 1 

while:                  ;En esta seccion simularemos un ciclo while, primero la condicion despues se ejecuta y salta de nuevo a la condicion dar un falso
    cmp ebx, 100        

    jg fin              ;condicion de final

    mov eax, ebx 
    call WriteDec 
    call Crlf           ;codigo ejecutable mientras la condicion no se cumpla

    inc ebx             ;Incrementa EBX
    jmp while              ;salto a la condicion

reinicio:
    call Crlf 
    mov ebx, 1 

doWhile:            ;En esta seccion simularemos un ciclo Do while, se ejecuta al menos una vez, despues la condicion y salta de nuevo a codigo ejecutable hasta dar un falso

    mov eax, ebx 
    call WriteDec       ;Codigo ejecutable 
    call Crlf 

    inc ebx             ;incrementa ebx
    cmp ebx, 100        

    jle doWhile     ;Condición de final

    exit 
main ENDP

END main