;Escriba un programa en lenguaje Assembler que permita realizar una Multiplicación 
;de números sin signo almacenados en la memoria del microprocesador.

;multiplicacion 5*3

ORG 1000h
 numero db 5 
 veces db 3

org 2000h
 mov AL, 0
 mov AH, veces; guardo las veces necesarias para despues comparar
 
 mov BL, 0; inicializo en 0 -- aca guardo resultado
 
SUMAR: ADD BL, numero 
 inc AL
 cmp AL, AH; comparo si ya sume las veces necesarias
 JNZ SUMAR; salta si no son iguales


hlt
end
