; EXTRA 
;a)   Implemente una subrutina en Assembler que reciba un parámetro A por 
;referencia y un parámetro B por valor y reemplace el valor de A, sólo si el valor 
;de B es menor al de A.

ORG 1000H
A DB 8
B DB 4

ORG 3000H 
 
 
SUBRUTINA: MOV BX, CX
CMP AX, [BX]
JS REEMPLAZAR ;----------- TAMBIÉN PROBE CON EL JNS -----------
JMP FIN  ;
REEMPLAZAR: MOV BX, AX

FIN: 	RET

ORG 2000H
MOV AL, B 
MOV CX, OFFSET A ; no se lo copio diractamente a BX porq no se q poner en la instrucción de la etiqueta
CALL SUBRUTINA
 
HLT 
END 
