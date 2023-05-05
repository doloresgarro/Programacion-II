;Compile y ejecute el siguiente programa en el simulador. En base a la ejecución 
;responda las siguientes preguntas.

ORG 1000H
	INI DB 0
	FIN DB 15

	ORG 2000H
	MOV AL, INI
	ADD AH, FIN
SUMA:  INC AL
	CMP AL, AH
	JNZ SUMA
	HLT
	END
