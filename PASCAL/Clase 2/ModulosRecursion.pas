program ModulosRecursion;
uses
	crt;

const
    dimF = 8;  {Dimensión física del vector}
type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

    Lista= ^Nodo;
    Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;




 
{------------------------FACTORIAL--------------------------}
function factorial (num: integer) : real;
begin
	if (num<=1) then begin
		factorial:= 1;
	end
	else begin
		factorial:= num * factorial (num-1);	
	end;
end;

{---------------------------POTENCIA------------------------}

function potencia2 (x:integer; n:integer): integer;

begin

	if (n=0) then begin
	potencia2:= 1;
	end
	
	else begin
	potencia2:= x * potencia2 (x ,n-1);
	end;
	
end; 



{------------------------DIGITO MAXIMO-----------------------}
function digitoMaximo (n: integer; max:integer): integer;

var
  dig: integer;
begin

	
  dig:= n mod 10;
  
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  
  if (n <> 0) then 
    max:= digitoMaximo(n,max);
  
  digitoMaximo :=max;
 
  
end;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;



{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;



{-----------------------BUSQUEDA DICOTOMICA------------------------}

procedure BusquedaDicotomica(v:vector; num:integer; dimL:dim; var pri:dim; var ult:dim; var pos:dim);
var
    medio:dim;
begin
     if (dimL = 0) then
        writeln('No se encontró el elemento ')
     else begin
          medio:= (pri + ult) div 2;
          if num = v[medio] then
             pos:=medio
          else begin
               if (num < v[medio]) then begin
                  ult:=medio;
                  BusquedaDicotomica(v,num,dimL,pri,ult,pos);
               end
               else begin
                    pri:=medio;
                    BusquedaDicotomica(v,num,dimL,pri,ult,pos);
               end;
          end;
     end;
end;  


{-----------------------MAXIMO EN VECTOR------------------------}

{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;


function maximo(v:vector; dimL:dim; max:integer; i:dim):integer;
begin
     if (i > dimL) then    //condicion base
        maximo:= max
     else begin
       if (v[i]>max) then
          max:=v[i];
       max:=maximo(v,dimL,max,i+1);
     end;
     maximo:= max;
end;


{-----------------------SUMA EN VECTOR------------------------}

function sumaVector(v:vector; dimL:dim; suma:integer; i:integer):integer;
begin
     if (i > dimL) then
        sumaVector:= suma
     else begin
          suma:= suma + v[i];
          suma:= sumaVector(v,dimL,suma,i+1);
     end;
     sumaVector:=suma;
end;



{-------------------------------------------------------------------------
----------------DE ACA PARA ABAJO TODOS MODULOS DE LISTAS-----------------
--------------------------------------------------------------------------}


Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;

{----------------imprime lista-----------------}

Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;

{----------------------BUSCA MINIMO EN LISTA------------------------}

function minimo(L:Lista; min:integer):integer;
begin
     if (L = nil) then
        minimo:=min    //caso base
     else begin
          if (L^.datos < min) then
             min:= L^.datos;
          min:= minimo(L^.sig,min);
     end;
     minimo:=min;
end;


{----------------------IMPRIME RECURSIVO-----------------------------}

procedure ImprimirRecursivo(L:Lista);
begin
     if (L <> nil) then begin
        write(L^.datos,' ');
        ImprimirRecursivo(L^.sig);
     end;
end;



{PROGRAMA PRINCIPAL}
var 
  num,x,n,max,i,suma: integer;
  v: vector;
  dimL,pri,ult,pos: dim;
  L: Lista;
  min: integer;

begin

  {------------------------FACTORIAL--------------------------}
  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num):2:2);


  
{---------------------------POTENCIA------------------------}
  write ('Ingrese base: ');
  Readln (x);
  write ('Ingrese exponente: ');
  Readln (n);
  writeln ('La base', x,' elevada al exponente', n,' es: ', potencia2 (x,n));


  {------------------------DIGITO MAXIMO-----------------------}
  writeln( 'Ingrese un entero no negativo:');
  max:=-1;
  readln (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo (num,max));
  readln;
  

  {-----------------------BUSQUEDA DICOTOMICA------------------------}

  cargarVectorOrdenado(v,dimL);

  writeln('Nros almacenados: ');
  imprimirVector(v, dimL);

  writeln('Ingrese el dato a buscar ');
  read(num);

  pri:=1;
  ult:=dimL;

  BusquedaDicotomica(v,num,dimL,pri,ult,pos);
  writeln('La posicion del numero es ',pos);

  {-----------------------MAXIMO EN VECTOR------------------------}

   cargarVector(v,dimL);

   writeln('Nros almacenados: ');
   imprimirVector(v, dimL);

   max:=-1;
   i:=1;
   writeln('El numero maximo es ', maximo(v,dimL,max,i));


   {-------------------SUMA DE NUMEROS EN VECTOR------------------}

   suma:=0;
   writeln('La suma de los valores contenidos en el vector es ', sumaVector(v,dimL,suma,i));


   {--------------------------LISTAS--------------------------}

    L:=nil;
    randomize;
    n := random (100);

    {crea lista y la imprime}
    While (n<>0) do Begin
          AgregarAdelante (L, n);
          n := random (100);
    End;
    writeln ('Lista generada: ');
    imprimir (L);

    {---------MINIMO EN LISTAS-------------}
    min:=9999;
    writeln('El minino numero en la lista ', minimo(L,min));

    {---------IMPRIME RECURSIVO EN LISTAS------------}
    writeln('Imprime con modulo recursivo ');
    ImprimirRecursivo(L);




  readkey();;

  
end.
