{
a)Crear una estructura eficiente para la búsqueda, que almacene para cada peso, los códigos de encomienda registrados para el mismo.
b)Imprimir a partir de la estructura generada, cada peso de encomienda con los códigos de encomienda registrados para dicho peso.
}
Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;


  // Lista ordenada por pesos
  listaCod = ^nodoCod;
  nodoCod = record
          dato:integer; //codigos
          sig:listaCod;
  end;


  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer; //pesos
    HI: arbol;
    HD: arbol;
    cod: listaCod; // puntero a la lista ordenada por pesos
  End;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega codigos adelante en la lista de pesos}
procedure agregarAdelante(var l: listaCod; cod: integer);
var
  aux: listaCod;
begin
  new(aux);
  aux^.dato := cod;
  aux^.sig := l;
  l:= aux;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos}

procedure Insertar(var a:arbol; enc:encomienda);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= enc.peso;
        a^.HI:= nil;
        a^.HD:= nil;
        a^.cod:=nil;     //inicializamos lista de códigos
        agregarAdelante (a^.cod, enc.codigo);  //agregamos primer codigo a la lista

     end
     else begin
         if (a^.dato > enc.peso) then
            Insertar(a^.HI,enc)
         else begin
            if (a^.dato < enc.peso) then
               Insertar(a^.HD,enc)
            else  //el dato es igual REPETIDO y lo inserto en la lista de ese peso
               agregarAdelante (a^.cod,enc.codigo);

               end;
     end;

end;


procedure ImprimirCodigos(l:listaCod);
begin
     while (l <> nil) do begin
           write(l^.dato,' - ');
           l:=l^.sig;
     end;
end;



Procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HI);
    writeln();
    writeln('El peso es: ',a^.dato);

    write('CODIGOS: ');
    ImprimirCodigos(a^.cod);
    writeln();
    enOrden (a^.HD);
  end;
end;




// IMPRIMIR RECURSIVO
procedure ImprimirCodigos1(l:listaCod);
begin
     if (l <> nil) then begin
           write(l^.dato,' - ');
           ImprimirCodigos1(l^.sig);
     end;
end;



Procedure enOrden1(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden1 (a^.HI);
    writeln();
    writeln('El peso es: ',a^.dato);

    write('CODIGOS: ');
    ImprimirCodigos1(a^.cod);
    writeln();
    enOrden1 (a^.HD);
  end;
end;






Var

 l: lista;
 a:arbol;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 a:= nil;

 while (l <> nil) do begin
       insertar (a, l^.dato);
       l:=l^.sig;
 end;

 writeln();
 writeln('Imprime arbol: ');
 writeln();
 enOrden(a);

 writeln('IMPRIME RECURSIVO ---------------------------');
 writeln();
 writeln('Imprime arbol: ');
 writeln();
 enOrden1(a);


 readln;
end.
