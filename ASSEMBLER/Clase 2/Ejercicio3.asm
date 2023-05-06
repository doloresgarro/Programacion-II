; 3) Dados los siguientes fragmentos de código en Pascal, escríbalos en lenguaje 
;Assembly.

;a)

ORG 2000h

CMP AL, 4 ; resta AL - 4 para ver si son iguales (resultado 0)
JZ Then ; si son iguales salta (AL - 4 = 0)
JMP Else ; si no son iguales salta al else
Then: MOV BL, 1 ; a BL le asigna 1
      INC CL ; incrementa en 1 CL
      JMP FIN ; salta al final 
Else: MOV BL, 2 ; le asigna 2 a BL
      DEC CL ; decrementa CL en 1 
FIN: hlt
end


;b)

ORG 2000H

MOV AL, 10 ; número que vamos a sumar
MOV CL, 10 ; índice de posición
Lazo: add AL, 10 ; a AL le sumamos 10
      DEC CL ; decrementa CL en 1
      JNZ Lazo ; deja de saltar cuando CL es 0 
      JMP FIN
FIN: HLT
END
