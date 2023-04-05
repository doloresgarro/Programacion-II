Program productos;
Uses
     crt;
Type
     anios =  2000..2022;
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio:anios;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;

    producto2 = record
         codigo: integer;
         nombre: string;
         anio: 2000..2022;
    	  precio: real;
       end;


     ListaInt = ^nodoInt;
     nodoInt = record
              datos:producto2;
              sig:ListaInt;
              end;

      DatoListaOrd= record
                   list:ListaInt;
                   marca:string;
                   end;


     ListaOrd = ^nodo;
     nodo = record
          datos:DatoListaOrd;
          sig:ListaOrd;
          end;





Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;
   
   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;



procedure AgregarAlFinal (var pri: ListaInt; p: producto2);
var act, nue : ListaInt;
begin
new (nue);
nue^.datos:= p;
nue^.sig := NIL;
if pri <> Nil then begin
 act := pri ;
 while (act^.sig <> NIL ) do act := act^.sig ;
 act^.sig := nue ;
 end
 else
 pri:= nue;
end;

procedure CopiarDatos(dato:producto; var p:ListaInt);
begin
	p^.datos.nombre:= dato.nombre;
	p^.datos.precio:= dato.precio;
	p^.datos.anio:= dato.anio;
	p^.datos.codigo:= dato.codigo;
end;

procedure RecorrerLista(l:listaProductos; var ListaO:ListaOrd);
var
  nue:ListaOrd; nueAnio:ListaInt; actualMarca:string; actualAnio:anios; act:listaProductos;
begin
  new(nue);
  act:=l;
  while (l <> nil) do begin
        actualMarca:=l^.dato.marca;
        while (l <> nil) and (actualMarca = l^.dato.marca) do begin
              actualAnio:=l^.dato.anio;
              while (l <> nil)and (actualMarca = l^.dato.marca) and (actualAnio=l^.dato.anio) do begin
                    new(nueAnio);
                    CopiarDatos(l^.dato,nueAnio);
                    AgregarAlFinal(nueAnio, ListaO^.datos.list^.datos);
                    act:=act^.sig;
              end;
end;

procedure ImprimirNodo(p: producto2);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


procedure ImprimirListaOrdenada(ListaO:ListaOrd);
var
   actualMarca:ListaInt;
begin

     while (ListaO <> nil) do begin
           actualMarca:= ListaO^.datos.marca;
           while (ListaO <> nil) and (actualMarca = ListaO^.datos.marca) do begin
                 ImprimirNodo(ListaO^.datos.list^.datos);
                 ListaO:=ListaO^.sig;
           end;
     end;

end;


var
   l: listaProductos; ListaO:ListaOrd;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     ListaO:=nil;
     RecorrerLista(l,ListaO);

     writeln();
     writeln('Lista nueva');
     ImprimirListaOrdenada(ListaO);


readkey();

end.
