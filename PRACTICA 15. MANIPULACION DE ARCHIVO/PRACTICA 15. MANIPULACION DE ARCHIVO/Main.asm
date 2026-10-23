
; Lenguajes de Interfaz 10-11
; Felix Aguilasocho Nicolas
; Docente: Ing. Medina Jimenez Jose Luis
; Unidad 2 - Manejo de archivos

INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "Inventario.txt", 0
    texto BYTE "125", 0
    archivoHandle DWORD ?   ; Guarda el identificador del archivo abierto

    mensajeExito BYTE "Archivo guardado correctamente.", 0
    mensajeError BYTE "No se pudo guardar el archivo.", 0

.code
main PROC

    ; Crea el archivo y devuelve su identificador en EAX
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    cmp eax, INVALID_HANDLE_VALUE ; Compara EAX con -1, valor que indica error al abrir el archivo
    je error                      ; Si son iguales, salta al mensaje de error

    mov archivoHandle, eax        ; Guarda el identificador de EAX para usar el archivo despues

    ; Escribe los 3 caracteres del texto en el archivo
    mov eax, archivoHandle        ; Carga el identificador del archivo en EAX
    mov edx, OFFSET texto
    mov ecx, 3
    call WriteToFile              ; Escribe ECX bytes desde EDX en el archivo de EAX

    cmp eax, 3                    ; Comprueba que se escribieron los 3 bytes
    jne errorEscritura

    ; Cierra el archivo
    mov eax, archivoHandle        ; Recupera el identificador para cerrar el archivo
    call CloseFile

    jc error                      ; Salta si CF = 1, indicando un error

    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin

errorEscritura:
    mov eax, archivoHandle
    call CloseFile

error:
    mov edx, OFFSET mensajeError
    call WriteString

fin:
    exit

main ENDP

END main
