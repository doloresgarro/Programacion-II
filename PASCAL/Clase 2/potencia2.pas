program CalculoDePotencia;

{

function potencia1(x:integer; n:integer): integer;

begin
	potencia1:= x * potencia1 (x,n-1);
end; 

A ESTA FUNCION LE FALTA EL CASO BASE, ALGUNA CONDICION DE TERMINACION

}
{
function potencia2 (x:integer; n:integer): integer;

begin

	if (n=0) then begin
	potencia2:= 1;
	end
	
	else begin
	potencia2:= x * potencia2 (x ,n);
	end;
	
end; 


A ESTA FUNCION LE FALTA ACHICAR EL ESPACIO DEL PROBLEMA EN CADA LLAMADA, EN OTRAS PALABRAS, QUE SE REDUZCA N

}

function potencia2 (x:integer; n:integer): integer;

begin

	if (n=0) then begin
	potencia2:= 1;
	end
	
	else begin
	potencia2:= x * potencia2 (x ,n-1);
	end;
	
end; 




{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
	writeln (('ACTIVIDAD 3: La base x elevada al exponente n es: '),( potencia2 (x,n)));



     readln;
     
end.         
