program Arreglos;
uses
    crt;
const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


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




{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   max,i,suma:integer;

begin

     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);

     max:=-1;
     i:=1;
     writeln('El numero maximo es ', maximo(v,dimL,max,i));

     suma:=0;
     writeln('La suma de los valores contenidos en el vector es ', sumaVector(v,dimL,suma,i));

     readkey();
end.
