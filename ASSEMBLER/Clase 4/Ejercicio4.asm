; Analice el funcionamiento de la siguiente subrutina que calcula el resto de una 
;división y su programa principal. 	   

ORG 1000H     	; Datos
DIVIDENDO DW 11 ; 1000h
DIVISOR DW 2 ; 1002h
RESUL	DW  ? ; 1004
          	
ORG 3000H  ; Subrutina

REST:	PUSH BX ; guarda en la pila 1002
MOV BX, SP  ; en BX guarda dirección de la primer linea de la pila
ADD BX, 4  	; SP+4 --> va para la 3FFE (donde esta la direc del resultado)
MOV DX, [BX] ; copia la dirección del resultado (1004)
SIGO: SUB AX, CX ; resta dividendo (AX = 11) con divisor (CX = 2)
CMP AX, CX ; 11-2
JNC SIGO ; si AX es mayor sigue 
MOV BX, DX ; pone en BX 1004
MOV [BX],AX ; en la dirección de memoria 1004 pone el resto (1)
POP BX ; saca el 1002 de la pila y lo pone en BX
RET

ORG 2000H   ; Programa Ppal.
MOV DX, OFFSET RESUL ; copia en DX 1004
PUSH DX ; 1004h lo pone en la pila (en 3FFF)
MOV AX, DIVIDENDO ; guarda 0B (11)
MOV BX, OFFSET DIVISOR ; guarda 1002h
MOV CX, [BX] ; guarda 2
CALL REST 
POP CX
HLT
END


