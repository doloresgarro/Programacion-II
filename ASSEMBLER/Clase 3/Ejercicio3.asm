;3) Escribir un programa que calcule la suma de dos números de 32 bits almacenados 
;en la memoria del microprocesador llamando a una subrutina SUM32, pasando los 
;parámetros por referencia desde el programa principal a través de registros.
; VARIABLES
org 1000h
NUM1_L  DW 11111111b ; 16 bits
NUM1_H DW 0000h ;16 bits 
NUM2_L DW 11111111b
NUM2_H DW 0000H

; SUBRUTINAS
org 3000h

SUM32H: MOV BX, AX
MOV DH, [BX]
MOV BX, CX
ADD DH, [BX]

RET

SUM32L: MOV BX, AX
MOV DL, [BX]
MOV BX, CX
ADD DL, [BX]

JC INCREMENTAR
INCREMENTAR: INC DH 

RET

; MAIN
org 2000h

MOV DX, 0

MOV AX, OFFSET NUM1_H
MOV CX, OFFSET NUM2_H
CALL SUM32H

MOV AX, OFFSET NUM1_L
MOV CX, OFFSET NUM2_L
CALL SUM32L

FIN: HLT
end
