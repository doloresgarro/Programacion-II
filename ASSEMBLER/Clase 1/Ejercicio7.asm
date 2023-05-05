;Realice un programa en Assembler que permita realizar la suma de todos los 
;valores de una tabla. Almacene el resultado en memoria principal.

ORG 1000h
tabla DB 1,2,3,4,5; 1000,1001,1002,1003,1004
fin_tabla DB ? ;1005h
resultadosuma DB 0; 1006h

org 2000h
mov BX, OFFSET tabla; guardo 1000h
mov CL, OFFSET fin_tabla - OFFSET tabla; guardo DIM LÓGICA

Loop: mov AL, [BX] 
inc BX ; para buscar direc 1001,1002.....
add resultadosuma, AL;
dec CL; disminuyo dim lógica
JNZ Loop; si el resultado no da 0, salto

hlt
end
