;5) Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no. La 
;rutina debe recibir el carácter por valor, y debe retornar, vía registro, el 
;valor 0FFH si el carácter es una vocal, o 00H en caso contrario.

ORG 1000h
tabla DB "aeiouAEIOU" ; 1000,..., 1009
fin_tabla DB ?; 100A
letra DB "A"; 100b, A MAYUSCULA

org 3000h

ES_VOCAL: 
MOV BX, OFFSET tabla ; guarda 1000h
MOV CL, OFFSET fin_tabla - OFFSET tabla ; guarda dimLogica

LOOP: MOV AL, [BX]
INC BX ; Avanza en la tabla
CMP DL, AL ; compara el valor de la tabla con la letra
JZ vocal ; si son iguales
MOV AX, 00H ; si no son iguales

dec CL; disminuye dimL
JNZ LOOP ; si el resultado no es cero que siga 
JMP fin
vocal: MOV AX, 0FFH


fin: ret

org 2000h
MOV DL, letra
CALL ES_VOCAL 

hlt
end
