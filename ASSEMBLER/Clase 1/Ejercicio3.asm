;Compile y ejecute el siguiente programa en el simulador. En base a la ejecución 
;arme una tabla que contenga todas las instrucciones MOV que aparecen, el modo de 
;direccionamiento que se utiliza y el contenido final del operando destino de cada 
;una de ellas.

ORG 1000H
NUM0 DB 0CAH
NUM1 DB 0
NUM2 DW ?
NUM3 DW 0ABCDH
NUM4 DW ?
 
ORG 2000H
MOV BL, NUM0
MOV BH, 0FFH
MOV CH, BL
MOV AX, BX
MOV NUM1, AL
MOV NUM2, 1234H
MOV BX, OFFSET NUM3
MOV DL, [BX]
MOV AX, [BX]
MOV BX, 1006H
MOV WORD PTR [BX], 1006H
HLT
END

