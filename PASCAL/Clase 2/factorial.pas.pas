program CalculoDeFactorial;
uses 
	crt;

function factorial (num: integer) : real;
begin
	if (num<=1) then begin
		factorial:= 1;
	end
	else begin
		factorial:= num * factorial (num-1);
		

// como imprimir factorial intermedio??????????
	
	end;
end;



{PROGRAMA PRINCIPAL}
var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num):2:2);
  readln;
End.            



