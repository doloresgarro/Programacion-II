;1) Escribir un programa que calcule la suma de dos números de 32 bits almacenados 
;en la memoria del microprocesador sin hacer llamados a subrutinas, resolviendo 
;el problema desde el programa principal.

org 1000h
NUM1_L  DW 11111111b ; 16 bits
NUM1_H DW 0000h ;16 bits 
NUM2_L DW 11111111b
NUM2_H DW 0000H

org 2000h
MOV AL, NUM1_L
MOV AH, NUM1_H
MOV BL, NUM2_L
MOV BH, NUM2_H

ADD AH, BH
ADD AL, BL
JNC FIN
JC INCREMENTAR

INCREMENTAR: INC AH 

FIN: HLT
end

