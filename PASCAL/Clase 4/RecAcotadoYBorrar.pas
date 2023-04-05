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


procedure enOrden(a:arbol);
begin
     if (a <> nil) then begin
        enOrden(a^.HI);
        write(a^.dato,' ');
        enOrden(a^.HD);
     end;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

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


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

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


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }
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
end;



procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        write(a^.dato, ' ');
        RecorridoAcotado(a^.HI, inf, sup);
        RecorridoAcotado (a^.HD, inf, sup);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup)

    else
      RecorridoAcotado(a^.HD, inf, sup);
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

procedure BorrarElemento(var a:arbol; valor:integer);
var
   aux:arbol;
begin

  if (a = nil) then
    writeln('No se encontro el dato a borrar ')
  else begin
     if (valor < a^.dato) then
        BorrarElemento(a^.HI,valor)
     else begin
        if (valor > a^.dato) then
          BorrarElemento(a^.HD,valor)
        else begin
          //ENCONTR� EL VALOR A BORRAR
          if ((a^.HD = nil) and (a^.HI = nil)) then begin // si es una hoja
             dispose(a);
             a:=nil;
             writeln('Se borro - es una hoja');
          end
          else begin
            if ((a^.HD <> nil) and (a^.HI = nil)) then begin // si tiene hijo derecho
               aux:= a;
               a:= a^.HD;
               dispose(aux);
               writeln('Se borro - hijo derecho ');
            end
            else begin
               if ((a^.HI <> nil) and (a^.HD = nil)) then begin // si tiene hijo izquierdo
                  aux:= a;
                  a:= a^.HI;
                  dispose(aux);
                  writeln('Se borro - hijo izquierdo ');
               end
               else begin // si tiene dos hijos

                 aux:= Buscar(a,valor); //guarda direc de memoria del dato a borrar
                 aux^.dato:= verMin(aux^.HD); //se intercambia el valor del minimo por el q se quiere borrar
                 BorrarElemento(a^.HD,aux^.dato);

               end;
            end;
          end;
        end;
     end;
  end;

end;



Var

 l: lista;
 aux:lista;
 a:arbol;
 inf,sup,valor:integer;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 //generando arbol

 //ES NECESARIO AUXILIAR?????????????????

 a:=nil;
 aux:=l;
 while (aux <> nil) do begin
    Insertar(a,aux^.dato);
    aux:= aux^.sig;
  end;

  writeln();
  writeln();
  writeln('En orden');
  enOrden(a);
  writeln();
  writeln();

  writeln ('Imprime por nivel: ');
  imprimirpornivel(a);


  write('Ingrese limite inferior: ');
  readln(inf);
  write('Ingrese limite superior: ');
  readln(sup);

  RecorridoAcotado(a,inf,sup);

  writeln();
  write('Ingrese valor a eliminar: ');
  readln(valor);
  BorrarElemento(a,valor);
  writeln();
  
  writeln ('Imprime por nivel luego de borrar: ');
  imprimirpornivel(a);


 readkey();
end.             
