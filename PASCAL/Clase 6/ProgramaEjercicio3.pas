{Una empresa de telecomunicaciones procesa los datos de varios pedidos de conexión
que llegan telefónicamente. Se dispone de una lista con los datos cargados y listos
para ser procesados. Cada pedido posee un código único de seguimiento, fecha y hora
 del turno de conexión, DNI del cliente, código de área, domicilio del cliente y su
  número telefónico. 
Posteriormente al ingreso y almacenamiento de la información, se pide: 


a) Crear una nueva estructura que almacene para cada código de área, el total de
 pedidos de dicha área y los DNI de los clientes que solicitaron el servicio. Esta
 estructura debe estar ordenada por código de área y debe ser eficiente para la búsqueda
 por dicho criterio. 


Al finalizar el procesamiento de a), elija las estructuras adecuadas para: 
b) Implementar un módulo que retorne el código de área con menor cantidad de pedidos de servicio. 
c) Implementar un módulo que imprima los DNI de clientes cuyo código de área se encuentre entre
 1000 y 2000, ordenados por código de área.
d) Implementar un módulo que, dado un código de área, imprima los DNI de los clientes que
solicitan conexión. 
e) Implementar un programa principal que utilice los módulos implementados.
}
Program ejercicio3;
Uses
     sysutils;
Type

     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: integer;
	      codArea: integer;
          domicilio: string;
          tel: string;
     end;

     listaPedidos = ^nodoLista;
     nodoLista = record
               dato: pedido;
               sig: listaPedidos;
     end;


     {TYPE PROPIO}

     // LISTA DE LOS DNI DE QUIENES CONTRATARON
     listaClientes = ^nodoC;
     nodoC = record
           dato:integer;
           sig:listaClientes;
     end;

     // lo uso para copiar los datos
     cliente = record
          dni:integer;
          codA:integer;
     end;

     // ÁRBOL con codArea, contador y lista
     arbol = ^nodoA;
     nodoA = record
           dato:integer;  //codigo de área y dni  ???????????? o solo cod area?????? ((creo q asi esta bien igual))
           HI:arbol;
           HD:arbol;
           cant:integer;  // cantidad de veces que se contrato el servicio para ese codArea
           lista:listaClientes;   // lista de los DNI de quienes lo contrataron
     end;

{-----------------------PROCEDIMIENTOS------------------------}

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
              anterior := actual;
              actual:= actual^.sig;
         end;
         if (anterior = actual) then
              pri := nuevo
         else
              anterior^.sig := nuevo;
         nuevo^.sig := actual;
    end;
end;


function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10);{genera hasta 100 elementos}

     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(6000);  {dni}
          //p.codArea := (random(4000)); {codigo de Ã¡rea}
          p.codArea := (random(4));
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;


{PROCEDICIMIENTOS Y FUNCIONES PROPIOS}


procedure CopiarDatos(d:pedido; var c:cliente);
begin
  c.dni:= d.dni;
  c.codA:= d.codArea;
end;


// AGREGAR ADELANTE - Agrega nro adelante de l}
procedure agregarAdelante(var l: listaClientes; nro: integer);
var
  aux: listaClientes;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;


//INSERTAR AL ARBOL - tratamiento de repetidos
procedure Insertar(var a:arbol; c:cliente);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:=c.codA; //????????????????????????????
        a^.HI:= nil;
        a^.HD:= nil;
        a^.cant:= 1; //agregamos el primer dato al contador que hay en el nodo
        a^.lista:=nil;     // CASO LISTA inicializamos lista
        agregarAdelante (a^.lista,c.dni);  //agregamos primer DNI a la lista

     end
     else begin
         if (a^.dato > c.codA) then
            Insertar(a^.HI,c)
         else begin
            if (a^.dato < c.codA) then
               Insertar(a^.HD,c)
            else  //el dato es igual REPETIDO y lo sumamos o lo inserto en la lista
                  a^.cant:= a^.cant + 1;
                  agregarAdelante (a^.lista,c.dni);
              end;
     end;
end;


// BUSCA EL CODIGO DE ÁREA CON MENOR CANTIDAD DE PEDIDOS DE SERVICIO
function MenorCantidad(a:arbol; min:integer):integer;
begin

   if (a <> nil) then begin
      if (a^.cant < min) then begin
         min:= a^.cant;
         min:= MenorCantidad(a^.HI,min);
         min:= MenorCantidad(a^.HD,min);
       end
       else begin
         min:= MenorCantidad(a^.HI,min);
         min:= MenorCantidad(a^.HD,min);
       end;
   end;
   MenorCantidad:= min;

end;



// BUSCA VALOR EN RANGO
procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        writeln('El codigo de area de ',a^.lista^.dato,' se encuentra entre los valores 1000 y 2000 ');
        RecorridoAcotado(a^.HI, inf, sup);
        RecorridoAcotado (a^.HD, inf, sup);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup)

    else
      RecorridoAcotado(a^.HD, inf, sup);
end;



// IMPRIME DOCUMENTOS DEL CODIGO QUE SE INGRESA
procedure ImprimirDocs(a:arbol; var codBuscado:integer);
begin

     if (a <> nil) then begin
        if (a^.dato = codBuscado) then begin
           writeln(a^.lista^.dato,' ');
           ImprimirDocs(a^.HI,codBuscado);
           ImprimirDocs(a^.HD,codBuscado);
        end
        else begin
           ImprimirDocs(a^.HI,codBuscado);
           ImprimirDocs(a^.HD,codBuscado);
        end;

     end;

end;

// IMPRIME LISTA DE ARBOL
procedure ImprimirDatos(l:listaClientes);
begin
     while (l <> nil) do begin
           writeln();
           writeln('El DNI del cliente es: ');
           write(l^.dato,' ');
           writeln();
           l:=l^.sig;
     end;
end;

// IMPRIME EN ORDEN EL ÁRBOL CON PUNTERO A LISTA
procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HI);
    writeln();
    writeln('El codigo de area es: ',a^.dato);
    writeln('La cantidad de personas que solicitaron este servicio: ',a^.cant);
    writeln();
    write('------LISTA DE LOS DNI------: ');
    ImprimirDatos(a^.lista);
    writeln();
    enOrden (a^.HD);
  end;
end;


{-------------------PROGRAMA PRINCIPAL-------------------}

var

   l_inicial,aux: listaPedidos;
   a:arbol;
   min,inf,sup,codBuscado:integer;
   c:cliente;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     crearLista(l_inicial);
     writeln ('Lista: ');
     imprimirLista(l_inicial);

     {Completar el programa}

      // a) crear estructura con cod de área, contador y lista
      a:=nil;
      aux:=l_inicial;
      while (aux <> nil) do begin
            CopiarDatos(aux^.dato,c); // copio el codigo de área para luego insertarlo
            Insertar(a,c); // inserto en el arbol el codigo de área
            aux:=aux^.sig;
      end;

      //  b) Implementar un módulo que retorne el código de área con menor cantidad de pedidos de servicio. 
      min:= 9999;
      writeln('El código de area con menor cantidad de pedidos de servicio es: ',MenorCantidad(a,min));
      

      // c) Implementar un módulo que imprima los DNI de clientes cuyo código de área se encuentre entre
      //    1000 y 2000, ordenados por código de área.
      write('Ingrese limite inferior: ');
      readln(inf);
      write('Ingrese limite superior: ');
      readln(sup);
      RecorridoAcotado(a,inf,sup);

      //d) Implementar un módulo que, dado un código de área, imprima los DNI de los clientes que
      //   solicitan conexión.
      writeln('Ingrese un código de area: ');
      readln(codBuscado);
      writeln('DNI de los clientes que contrataron el servicio con cod de area ',codBuscado);
      ImprimirDocs(a,codBuscado);




      writeln();
      writeln('En orden');
      enOrden(a);
      writeln();




     writeln('Fin del programa');
     readln();
end.
