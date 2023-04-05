{Enunciado 2
Una casa de venta de pastas frescas lee la información de las ventas que se realizaron
durante un determinado mes. De cada venta se conoce: el código de pasta, cantidad (en kilos),
fecha y número de cliente.

a.	Se nos pide generar de forma eficiente, una estructura donde se almacene por
cada código de pasta, la cantidad total vendida durante dicho mes.
Esta estructura debe ser la más eficiente en cuanto a la búsqueda de un código de pasta en particular.

b.	Creen un programa que muestre un menú de opciones para:
-	Inicializar las estructuras de datos a utilizar en su funcionamiento.
-	Leer una venta e incorporar la información a la estructura generada.
-	Imprimir la información contenida en la estructura de datos utilizada.
-	Buscar e informar el código de pasta menos vendido.
-	Informar los códigos de pasta que tuvieron más de 10 kilos en ventas.}

program EjercicioColaborativo;
uses
  crt;
type

    Fechas = record
           dia:1..31;
           mes:1..12;
           anio:integer;
    end;

    venta = record
          cod:integer;
          cant:integer;
          fecha:Fechas;
          num:integer;
    end;

    datosAGuardar = record
            cod:integer;
            cant:integer;
            cantVendidas:integer;
    end;

    arbol = ^nodo;
    nodo= record
          datos:datosAGuardar;
          HD:arbol;
          HI:arbol;
    end;

// PROCEDIMIENTOS

function Buscar(a: arbol; d:datosAGuardar): arbol;
begin
    if (a <> nil) then begin
        if (a^.datos.cod = d.cod) then buscar:= a
        else if (d.cod < a^.datos.cod) then buscar:= buscar(a^.HI, d)
        else if (d.cod > a^.datos.cod) then buscar:= buscar(a^.HD, d);
    end else Buscar:= nil;
end;

procedure Insertar(var a:arbol; d:datosAGuardar);
begin
     if (a = nil) then begin
        new(a);
        a^.datos:= d;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else begin
         if (a^.datos.cant > d.cant) then
            Insertar(a^.HI,d)
         else
            if (a^.datos.cant < d.cant) then
               Insertar(a^.HD,d);
     end;
end;

procedure CopiarDatos(v:venta; var d:datosAGuardar);
begin
  d.cod:= v.cod;
  d.cant:= v.cant;
  d.cantVendidas:= 1;
end;

procedure LeerVenta(var v:venta);
begin
     if (v.cod <> -1) then begin
        writeln('Ingrese codigo de pasta: ');
        read(v.cod);
        writeln('Ingrese cantidad de kilos: ');
        read(v.cant);
        writeln('Ingrese dia de la venta: ');
        read(v.fecha.dia);
        writeln('Ingrese mes de la venta: ');
        read(v.fecha.mes);
        writeln('Ingrese anio de la venta: ');
        read(v.fecha.anio);
        writeln('Ingrese numero de cliente: ');
        read(v.num);
     end;
end;


procedure enOrden(a:arbol);
begin
     if (a <> nil) then begin
        enOrden(a^.HI);
        write('El codigo de pasta es: ');
        write(a^.datos.cod,' ');
        writeln();
        write('La cantidad vendida de esta pasta es: ');
        write(a^.datos.cant,' ');
        enOrden(a^.HD);
     end;
end;

procedure RecorreEnOrden(a:arbol; var min:integer; var codMin:integer);
begin
     if (a <> nil) then begin
        RecorreEnOrden(a^.HI,min,codMin);
        // Busca minimo la pasta menos vendida
        if (a^.datos.cantVendidas < min) then begin
           min:= a^.datos.cantVendidas;
           codMin:= a^.datos.cod;
        end;
        // imprime los codigos con mas de 10 kg en ventas
        if (a^.datos.cant > 10) then
           writeln('La pasta ',a^.datos.cod,' tuvo mas de 10 kg en ventas');

        RecorreEnOrden(a^.HD,min,codMin);

     end;
end;


var
   a,direc:arbol;
   v:venta;
   d:datosAGuardar;
   min,codMin:integer;
begin
     a:=nil; //Inicializar arbol
     LeerVenta(v);  //leo UNA venta
     while (v.cod <> -1) do begin

       CopiarDatos(v,d);  // COPIO EL CODIGO DE PASTA Y LA CANTIDAD DE KG PARA INSERTARLO EN EL ARBOL
       direc:= Buscar(a,d);
       if (direc = nil) then
       Insertar(a,d) // si aun no se vendio esa pasta INSERTO EN EL ARBOL
       else begin
         direc^.datos.cant:= direc^.datos.cant + d.cant; //si se vendio esa pasta, le sumo a lo ya vendido
         direc^.datos.cantVendidas:= direc^.datos.cantVendidas + d.cantVendidas;
       end;
       LeerVenta(v);

     end;

       writeln('Imprime arbol en orden');
       enOrden(a);
       writeln();

       min:= 9999;
       codMin:= -1;
       RecorreEnOrden(a,min,codMin);
       writeln('El código de la pasta menos vendida es: ',codMin);
       writeln();

readkey();
end.
