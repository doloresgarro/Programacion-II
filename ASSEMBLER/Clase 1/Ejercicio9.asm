;Escriba un programa que sume los valores de las posiciones de 2 tablas de igual 
;tamaño y almacene los resultados en una tercera tabla en memoria.

ORG 1000h
tabla1 DB 1,2,3,4,5; 1000,1001,1002,1003,1004
fin_tabla1 DB ? ;1005h
tabla2 DB 2, 4, 8, 3, 1 
fintabla2 DB ? ; 1011h
tabla3  DB 0, 0, 0, 0, 0 ;1012.....aca almaceno resultados
fintabla3 DB ? ;1017



org 2000h

mov CX, OFFSET fin_tabla1 - OFFSET tabla1; guardo DIM LÓGICA 1
mov BX, OFFSET tabla1; guardo 1000h
mov DX, 0

Loop: mov AL, [BX] ;guardo cont tabla 1
   mov BX, OFFSET tabla2
   add BX, DX
   
   add AL, [BX]
   mov BX, OFFSET tabla3
   add BX, DX
   
   MOV WORD PTR [BX], AX 
   
   mov BX, OFFSET tabla1
   INC DX
   add BX, DX
   
   cmp CX, DX
   
   
  JNZ Loop; si el resultado no da 0, salto

hlt
end
