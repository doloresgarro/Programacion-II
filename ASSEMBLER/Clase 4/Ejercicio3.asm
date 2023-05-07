;Usando la subrutina ROTARIZQ del ejercicio 4, escriba una subrutina ROTARDER 
;que haga una rotación hacia la derecha de un byte almacenado en la memoria del 
;microprocesador. Dicho byte y el número de posiciones a rotar deben pasarse 
;por valor desde el programa principal a la subrutina a través de registros.


ORG 1000h
NUM1_L  DB 00000010b ; 8 bits

var DB 8 ; 1 byte 8 bits
cant DB 1 ; cant veces que rota

org 3000h
ROTARIZQ: ADD AL, AL
JNC FIN
INC AL  

FIN: RET

ROTARDER: SUB CL, CH 

LOOP: CALL ROTARIZQ
DEC CL
JNZ LOOP

RET

org 2000h
MOV CL, var
MOV CH, cant

MOV AL, NUM1_L

CALL ROTARDER

ADD AL,0

HLT
end

