;Escriba una subrutina ES_IMPAR, que determina si un número (de tamaño word) es 
;par o impar. La rutina debe recibir el número por valor a través de la pila. La 
;subrutina debe retornar vía registro el valor 00H si el número es par, o 01H en 
;caso contrario.
;Implemente un programa que utilizando la subrutina cuente la cantidad total de 
;números impares en una tabla y almacene el resultado final en memoria principal.

;SIN TABLA!!!!!!!!!!
ORG 1000H
NUM dw 4
DIVISOR DB 2 

ORG 3000H

ES_IMPAR:  MOV BX, SP
ADD BX, 2
MOV AX, [BX]
CMP AX, CX
JS saltar

SIGO: SUB AX, CX ; 1-2= -1
CMP AX, CX ;-1-2 = -3
JNC SIGO

saltar: CMP AX, 0 
JNZ IMPAR
MOV DX, 00H ; si es par
JMP FIN

IMPAR: MOV DX, 01H
 
FIN: RET

ORG 2000H
MOV CL, DIVISOR
MOV AX, NUM 
PUSH AX
CALL ES_IMPAR
POP AX

hlt 
end



;CON TABLA!!!!!!!!!!!!


ORG 1000H
tabla dw 1,2,3,4,5 ; 1000 a 1004
fin_tabla db ? ; 1005
;NUM dw 4
DIVISOR DB 2 ;1006
resultado DB 0 ;1007

ORG 3000H

ES_IMPAR:  MOV BX, SP
ADD BX, 4
MOV AX, [BX] ; guarda el numero en AX

CMP AX, CX
JS saltar

SIGO: SUB AX, CX ; 1-2= -1
CMP AX, CX ;-1-2 = -3
;JZ CONTINUAR
JNC SIGO

saltar: CMP AX, 0 
JNZ IMPAR
MOV DL, 00H ; si es par
JMP FIN

IMPAR: MOV DL, 01H
ADD BX, 2 ; Nos pone el SP en la dirección del resultado
MOV BX, [BX] ; Ponemos la 1007 en BX
ADD [BX], DX 

FIN: RET

ORG 2000H
mov AX, OFFSET resultado
PUSH AX

mov BX, OFFSET tabla; 1000
mov DH, OFFSET fin_tabla - OFFSET tabla; DIM LOGICA
mov CL, DIVISOR

Loop: mov Ax, [BX]; guardando elem de la tabla
PUSH AX
PUSH BX
CALL ES_IMPAR
POP BX
POP AX

add BX,2
sub DH,2
JNZ Loop

POP AX

hlt 
end

