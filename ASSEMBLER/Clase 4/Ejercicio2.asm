;Escribir una subrutina CONCAR que cuente el número de caracteres de una cadena de 
;caracteres terminada en “%” almacenada en memoria. La cadena se pasa a la 
;subrutina por referencia vía registro.

ORG 1000H 
; % --> 25H
tabla db "abcde%djdjshs"; 1000...1005
fin_tabla db ? ; 1006
porcentaje db 25H

ORG 3000H

CONCAR: MOV DH, 0
LOOP: MOV AL, [BX] 
INC BX
CMP DL, AL
JZ FIN
INC DH
DEC CL
JZ FIN
JMP LOOP

FIN: ret

ORG 2000H 

MOV DL, porcentaje
MOV BX, OFFSET tabla ; guarda 1000h
MOV CL, OFFSET fin_tabla - OFFSET tabla ; dimL
CALL CONCAR

HLT 
END

