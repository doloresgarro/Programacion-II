; 2) Escribir un programa que calcule la suma de dos números de 32 bits 
;almacenados en la memoria del microprocesador llamando a una subrutina SUM32 para 
;efectuar la operación, pasando los parámetros por valor desde el programa 
;principal a través de registros.

; VARIABLES
org 1000h
NUM1_L  DW 11111111b ; 16 bits
NUM1_H DW 0000h ;16 bits 
NUM2_L DW 11111111b
NUM2_H DW 0000H

; SUBRUTINAS
org 3000h

SUM32: MOV AL, NUM1_L
MOV AH, NUM1_H
MOV BL, NUM2_L
MOV BH, NUM2_H

ADD AH, BH
ADD AL, BL

JC INCREMENTAR
INCREMENTAR: INC AH 

RET



; MAIN
org 2000h
CALL SUM32 

FIN: HLT
end
