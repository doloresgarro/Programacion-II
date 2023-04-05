Program productos;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;
     prodSinMarca = record
		  codigo: integer;
	      nombre: string;
	      anio: 2000..2022;
		  precio: real;
	end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;
     
     //type propio
     listaAnios = ^nodoAnios;
     nodoAnios = record
		dato: prodSinMarca;
		sig: listaAnios;
	end;
	
     datosMarca = record
		marca: string;
		pri: listaAnios;
	end;
		
     listaMarca = ^nodoMarca;
     nodoMarca = record
		dato : datosMarca ;
		sig : listaMarca;
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

//Modulos Propios
procedure copiarProducto(dato : producto;var p: listaAnios);
begin
	p^.dato.nombre:= dato.nombre;
	p^.dato.precio:= dato.precio;
	p^.dato.anio:= dato.anio;
	p^.dato.codigo:= dato.codigo;
end;

procedure imprimirProd(p: prodSinMarca);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirListaAnios(l: listaAnios);
begin
     while (l <> nil) do begin
          imprimirProd(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimirListaMarca(l: listaMarca);
begin
	while(l <> nil)do begin
		imprimirListaAnios(l^.dato.pri);
		l:= l^.sig;
     end;
end;

var
   l,act: listaProductos; //Lista original
   lMarca,actMarca: listaMarca; //Lista nueva
   actAnio: listaAnios; //Sub-listas
   marcaActual: string;

   
   
begin
     Randomize;
	 
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     // imprimirLista(l);
     
     lMarca:= nil;
     new(lMarca);
     act:= l;
     actMarca:= lMarca;
     actMarca^.sig:= nil;
     
     
     while (act <> nil) do begin
		marcaActual:= act^.dato.marca;
		actMarca^.dato.marca:= marcaActual;
		actAnio:= actMarca^.dato.pri;
		while (act <> nil) and (marcaActual = act^.dato.marca) do begin
			new(actAnio);
			copiarProducto(act^.dato,actAnio);
			actAnio:= actAnio^.sig;
			act:= act^.sig;
		end;
		actAnio^.sig:= nil;
		
     end;
     actMarca^.sig:= nil;
     imprimirListaMarca(lMarca);
     readln;
end.

				
		
