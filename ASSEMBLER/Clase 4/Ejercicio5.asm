;Dado los siguientes datos en la memoria de datos, escriba un programa en 
;Assembler que recorra la tabla y llame a una subrutina que sume el VALOR a cada 
;posición de TABLA (recibe ambos valores por pila). Decida qué pasaje de 
;parámetros es más conveniente para cada dato.
;                      	ORG 1000H
;TABLA         	DB     	1,4,5,3,10,7,14,78,23,18
,VALOR        	DB     	3

ORG 1000H
TABLA DB 1,4,5,3,10,7,14,78,23,18 ; 1000
FIN_TABLA DB ? ;1010
VALOR DB 3 ;1011

ORG 3000H
sumar: MOV BX, SP
       ADD BX, 2
       MOV AX, [BX] ; Guarda 1000 en AX
       ;MOV BX, AX
       ADD BX, 2
       MOV DX, [BX] ;Guardamos el 3
       MOV BX, AX
       ADD [BX],DX
RET
       
       
ORG 2000h

MOV BX, OFFSET TABLA ; 1000H
MOV CL, OFFSET FIN_TABLA - OFFSET TABLA ; 10 dimL

MOV DL, VALOR 
PUSH DX

LOOP: PUSH BX
  CALL sumar
  POP BX
  INC BX
  DEC CL ; decrementa dimL
JNZ LOOP


HLT
END
