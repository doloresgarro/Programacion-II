; 4) Escriba un programa en lenguaje Assembly que permita sumar dos operandos de 
;tipo DW. Si la suma da como resultado el valor 100, se termina el programa. En 
;cambio, si la suma da como resultado un valor mayor a 100 se debe ir 
;decrementando en 1 el resultado hasta poder terminar. (Se termina cuando el 
;número llega a 100).

ORG 1000h
num1 dw 50 
num2 dw 52
suma dw 0



ORG 2000h

MOV AX, num1
ADD AX, num2

Comparacion: CMP AX, 100 ; resta AL - 4 para ver si son iguales (resultado 0)

JZ FIN ; si son iguales termina el programa
JMP Else ; si no son iguales salta al else

Else:  JNS Mayor 
       JMP FIN
Mayor: DEC AX
       JMP Comparacion
      
FIN: hlt
end
