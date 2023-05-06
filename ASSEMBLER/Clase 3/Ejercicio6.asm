;6) Usando la subrutina anterior escribir la subrutina VOCALES, que recibe una 
;cadena por referencia, y devuelve, en un registro, la cantidad de vocales que 
;tiene esa cadena


ORG 1000h
;65H, 69H, 73H, 79H, 85H, 97H, 101H, 105, 111H, 117H 
tabla DB "aeiouAEIOU" ; 1000,..., 1009
fin_tabla DB ?; 100A
palabra DB "oso"; 100B 
fin_palabra DB ? ; 100E
letra DB ? ; 100F

org 3000h
ES_VOCAL: MOV BX, OFFSET tabla ; guarda 1000h
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
;--------------------------------------------------
CANTIDAD_VOCALES: MOV DH, 0
Loop: MOV DL, [BX]
PUSH BX
CALL ES_VOCAL
CMP AX, 0FFh
JZ CONTADOR
JMP continuar
CONTADOR: INC DH
continuar: POP BX ; trae la dirección de la segunda letra de la palabra
INC BX ; Avanza en la tabla
DEC CH 
JNZ Loop
RET
;--------------------------------------------------
org 2000h
MOV BX, OFFSET palabra ; guarda 100B
MOV CH, OFFSET fin_palabra - OFFSET palabra ; guarda dimLogica
CALL CANTIDAD_VOCALES
hlt
end
