Program arboles;
uses
    crt;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }
{
function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

  }
{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}
 {
Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;               }


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }
{
Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;                   }

{-----------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l       }
{
function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;
    }

{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}
{
Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;
}

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }
 {
Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;        }

procedure Insertar(var a:arbol; num:integer);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= num;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else begin
         if (a^.dato > num) then
            Insertar(a^.HI,num)
         else
            if (a^.dato < num) then
               Insertar(a^.HD,num);
     end;

end;


procedure preOrden(a:arbol);
begin
     if (a <> nil) then begin
        write(a^.dato,' ');
        preOrden(a^.HI);
        preOrden(a^.HD);
     end;
end;


procedure postOrden(a:arbol);
begin
     if (a <> nil) then begin
        write(a^.dato,' ');
        postOrden(a^.HD);
        postOrden(a^.HI);
     end;
end;


procedure enOrden(a:arbol);
begin
     if (a <> nil) then begin
        enOrden(a^.HI);
        write(a^.dato,' ');
        enOrden(a^.HD);
     end;
end;


function Buscar(a:arbol; valor:integer):arbol;
begin
     if (a <> nil) then begin
        if (valor = a^.dato) then begin
           Buscar:= a;
        end
        else begin
             if (valor < a^.dato) then begin
                Buscar(a^.HI,valor)
             end
             else begin
                 if (valor < a^.dato) then begin
                    Buscar(a^.HD,valor)
                 end;
             end;
        end;
     end
     else begin
         Buscar:= nil;
     end;
end;


function verMin(a:arbol):integer;
begin
     if (a <> nil) then
        if (a^.HI = nil) then begin
           verMin:=a^.dato
        end
        else begin
           verMin:= verMin(a^.HI);
     end
     else begin
         verMin:= -1
     end;
end;

function verMax(a:arbol):integer;
begin
     if (a <> nil) then
        if (a^.HD = nil) then begin
           verMax:=a^.dato
        end
        else begin
           verMax:= verMax(a^.HD);
     end
     else begin
         verMax:= -1
     end;
end;




Var

 l: lista;
 aux:lista;
 a,Direccion:arbol;
 valor:integer;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 aux:=l;
 while (aux <> nil) do begin
    Insertar(a,aux^.dato);
    aux:= aux^.sig;
  end;

  writeln();
  writeln('Pre Orden');
  preOrden(a);
  writeln();

  writeln('En orden');
  enOrden(a);
  writeln();

  writeln('Post Orden');
  postOrden(a);
  writeln();

//imprimirpornivel(a);


  writeln('Ingrese valor ');
  readln(valor);

  Direccion:= Buscar(a,valor);

  writeln('El valor minimo en el arbol es: ', verMin(a));

  writeln('El valor maximo en el arbol es: ', verMax(a));

 readkey();
end.                   
