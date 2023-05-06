;Dado el siguiente programa:	
; a) 	¿Qué función cumple el registro CL? 
;El registro CL guarda la dimensión lógica de la tabla y luego va decrementando ;para comparar.

;b)	¿Qué hace el programa?
;Cuenta todos los números de la tabla que son menores que el máximo y los suma 
;en la variable total en la dirección de memoria 100Bh



ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20 ; 10 elementos
  FIN 	DB ?
  TOTAL 	DB 0 ; 100BH (10011)
  MAX 	DB 11

       	ORG 2000H
       	MOV AL, 0
        	MOV CL, OFFSET FIN - OFFSET TABLA ; dimLogica
      	MOV BX, OFFSET TABLA ; direccón de la tabla
  COMP:	MOV AL, [BX]  ; lo que tiene BX se lo copia en AL = 2                  
        	INC BX   ; incrementa BX               
        	DEC CL   ; decrementa CL                     
        	CMP MAX, AL ;            
        	JNS MINyEQ  ; salta si la resta no da negativa (max - AL)          ; (1)  
        	CMP CL, 0 ; compara si llego al final o no
        	JZ FINAL                          
        	JMP COMP
MINyEQ: 	ADD TOTAL, 1
        	JMP COMP
FINAL: 	HLT
		END
; en la 100Bh nos guarda el total

;c)	¿Qué sucedería si se modifica la instrucción (1) por JZ MINyEQ?

ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20 ; 10 elementos
  FIN 	DB ?
  TOTAL 	DB 0 ; 100BH (10011)
  MAX 	DB 11

       	ORG 2000H
       	MOV AL, 0
        	MOV CL, OFFSET FIN - OFFSET TABLA ; dimLogica
      	MOV BX, OFFSET TABLA ; direccón de la tabla
  COMP:	MOV AL, [BX]  ; lo que tiene BX se lo copia en AL = 2                  
        	INC BX   ; incrementa BX               
        	DEC CL   ; decrementa CL (dimL)                   
        	CMP MAX, AL ;            
        	JZ MINyEQ  ; salta los numeros son iguales (MAX = AL)
        	CMP CL, 0
        	JZ FINAL                          
        	JMP COMP
MINyEQ: 	ADD TOTAL, 1
        	JMP COMP
FINAL: 	HLT
		END
; en la 100Bh nos guarda el total

;Lo que hace el programa es fijarse si la tabla contiene un número igual al 
;máximo (11)

;d)	¿Qué sucedería si se modifica la instrucción (1) por JS MINyEQ?

;Cuenta todos los números de la tabla que son mayores que el máximo y los suma 
;en la variable total en la dirección de memoria 100Bh. El problema es que al 
;comparar el máximo con número mayores nunca llega a la condición de corte (CMP 
;CL, 0 – compara dimensión lógica con 0 )

ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20 ; 10 elementos
  FIN 	DB ?
  TOTAL 	DB 0 ; 100BH (10011)
  MAX 	DB 11

       	ORG 2000H
       	MOV AL, 0
        	MOV CL, OFFSET FIN - OFFSET TABLA ; dimLogica
      	MOV BX, OFFSET TABLA ; direccón de la tabla
  COMP:	MOV AL, [BX]  ; lo que tiene BX se lo copia en AL = 2                  
        	INC BX   ; incrementa BX              
        	DEC CL   ; decrementa CL                     
        	CMP MAX, AL ;            
        	JS MINyEQ  ; salta si la resta da negativa (max - AL)          ; (1)  
        	CMP CL, 0 ; compara si llego al final o no → No entra acá, entonces no termina
        	JZ FINAL                          
        	JMP COMP
MINyEQ: 	ADD TOTAL, 1
        	JMP COMP
FINAL: 	HLT
		END
; en la 100Bh nos guarda el total

