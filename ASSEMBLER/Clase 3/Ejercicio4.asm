; 4) Escriba la subrutina RESTO que calcule el resto de la división entre 2 
;números positivos. Dichos números deben pasarse por valor desde el programa 
;principal a la subrutina a través de registros.

ORG 1000h
numero DB 16
veces DB 3
divisor db 5

org 3000h

RESTO: mov BL, numero;
mov AL, 0 ; contador 
mov AH, veces; guardo las veces necesarias para despues comparar

RESTAR: SUB BL, divisor 
inc AL
cmp AL, AH; comparo si ya sume las veces necesarias
JNZ RESTAR; salta si no son iguales
RET

org 2000h
CALL RESTO ;el resto se guarda en BL

hlt
end

