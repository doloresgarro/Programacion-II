; 7) Analizar el funcionamiento de la siguiente subrutina y su programa 
;principal:
       
ORG 3000H 
MUL:	CMP AX, 0 
	JZ FIN 
	ADD CX, AX 
	DEC AX 
	CALL MUL 
FIN: 	RET

           ORG 2000H 
           MOV CX, 0 
           MOV AX, 3 
           CALL MUL 
           HLT 
         END 

;a)	¿Qué hace la subrutina?
;Va disminuyendo el contenido de AX hasta que llega a 0, llamándose a si misma, de 
;forma que suma el contenido de AX a CX

;b)	¿Cuál será el valor final de CX?
;6 (3+2+1=6)
