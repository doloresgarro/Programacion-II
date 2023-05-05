ORG 1000h
Dato    DW 2000
ORG 2000h
MOV AX, 500 	            (1)
ADD AX, Dato	            (2)
CMP AX, 1500 
JZ Then 	            (3)
JMP Fin 
Then: 		MOV BX, 500 
Fin:		HLT 
END
