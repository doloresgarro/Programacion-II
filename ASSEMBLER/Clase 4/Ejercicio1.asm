;Escribir una subrutina 1 ROTARIZQ que haga una rotación hacia la izquierda de los 
;bits de un byte almacenado en la memoria del microprocesador. Dicho byte y el 
;número de posiciones a rotar deben pasarse por valor desde el programa principal 
;a la subrutina a través de registros.

org 1000h
NUM1_L  DB 00001000b ; 16 bits

org 3000h
ROTARIZQ: ADD AL, AL
JNC FIN
INC AL

FIN: RET

org 2000h
MOV AL, NUM1_L

CALL ROTARIZQ

HLT
end
