org 1000H
datos DB 55H, 33H, 44H, 22H
org   2000H
mov BX, 3000H
mov AX, [BX]
push AX
mov BX, 3002H
mov CX, [BX]
push CX
pop AX
pop CX
hlt
end
