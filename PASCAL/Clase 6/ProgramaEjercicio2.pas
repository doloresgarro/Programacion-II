program Ejercicio2;
uses
    crt;
type
    
    // pasaje que leemos
    pasaje = record
           cod:string;
           millas:integer;
           dni:integer;
           nombreApellido:string;
           clase:string;
    end;


    // datos del vuelo que inserta en la lista interna del árbol
    datosVuelo = record
               cod:string;
               puntaje:integer;
    end;


    // lista de codigos de vuelo
    listaVuelos = ^nodoV;
    nodoV = record
          dato:datosVuelo;
          sig:listaVuelos;
    end;

    // Información del árbol
    pasajero = record
             dni:integer;
             nombreApellido:string;
    end;


    // árbol de pasajeros
    arbol = ^nodoA;
    nodoA = record
          dato:pasajero;
          HI:arbol;
          HD:arbol;
          lista:listaVuelos; // contador de puntaje x codigo de vuelo
    end;


// copiamos datos del pasajero
procedure LeerPasaje(var p:pasaje);
begin
     writeln('El codigo de vuelo es: ');
     read(p.cod);
     if (p.cod <> '0') then begin
        writeln('Ingrese millas recorridas por el pasajero: ');
        readln(p.millas);
        writeln('Ingrese dni del pasajero: ');
        readln(p.dni);
        writeln('Ingrese el nombre y apellido del pasajero: ');
        readln(p.nombreApellido);
        writeln('Ingrese clase en la que viaja el pasajero: ');
        readln(p.clase);
     end;
end;


// lo hacemos separado de la lista para mandarle los datos de la persona al puntero al nodo y los datos del vuelo al puntero a la lista
procedure CopiarDatos(p:pasaje; var per:pasajero);
begin
     per.dni:= p.dni;
     per.nombreApellido:=p.nombreApellido;
end;


procedure CalcularPuntaje(p:pasaje; var dVuelo:datosVuelo);
begin
     dVuelo.cod:= p.cod;
     if (p.clase ='ejecutiva') then
        dVuelo.puntaje:= 100 * p.millas // 100 puntos por milla en clase ejecutiva
     else begin
         if (p.clase = 'turista') then
            dVuelo.puntaje:= 25 * p.millas; // 25 puntos por milla en clase ejecutiva
     end;
end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: listaVuelos; dVuelo:datosVuelo);
var
  aux: listaVuelos;
begin
  new(aux);
  aux^.dato.cod := dVuelo.cod;
  aux^.dato.puntaje := dVuelo.puntaje;
  aux^.sig := l;
  l:= aux;
end;




{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos  }

procedure Insertar(var a:arbol; per:pasajero; dVuelo:datosVuelo);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= per;
        a^.HI:= nil;
        a^.HD:= nil;
        a^.lista:=nil;     // CASO LISTA inicializamos lista
        agregarAdelante (a^.lista,dVuelo);  //agregamos primer dato de cod d vuelo a la lista
     end
     else begin
         if (a^.dato.dni > per.dni) then
            Insertar(a^.HI,per,dVuelo)
         else begin
            if (a^.dato.dni < per.dni) then
               Insertar(a^.HD,per,dVuelo)
            else  //el dato es igual REPETIDO y inserto en la lista
               agregarAdelante (a^.lista,dVuelo);
              end;
     end;

end;



{----------------------------------------------------------------------------- }
// punto b)
// recorre lista de pasajeros y guarda su puntaje total
procedure RecorrerListaInterna(l:listaVuelos; var punt:integer);
begin
     while (l <> nil) do begin
       punt:= punt + l^.dato.puntaje;
       l:=l^.sig;
     end;
end;




// busca el puntaje máximo entre todos los pasajeros
function MayorPuntaje(a:arbol; max:integer):integer;
var
   punt:integer;
begin

  punt:=0;
  if ( a <> nil ) then begin 

    RecorrerListaInterna(a^.lista,punt);
    if (punt > max) then begin // guardamos el puntaje en el maximo
       max:= punt;
       max:= MayorPuntaje(a^.HI,max);
       max:= MayorPuntaje(a^.HI,max);
    end
    else begin  // como no es mayor seguimos buscando
       max:= MayorPuntaje(a^.HI,max);
       max:= MayorPuntaje(a^.HI,max);
    end;
  end;
  MayorPuntaje:= max;
end;


procedure RecorrerListaInterna2(l:listaVuelos);
var
   max:integer;
begin

     max:= -1;
     while (l <> nil) do begin

       if(l^.dato.puntaje > max) then
         max:= l^.dato.puntaje;

       l:= l^.sig;
     end;
     writeln('El maximo puntaje entre sus vuelos es: ',max);

end;


{function RecorrerListaInterna2(l:listaVuelos; max:integer):integer;
begin

     if (l <> nil) then begin
       if(l^.dato.puntaje > max) then
         max:= l^.dato.puntaje;
         max:= RecorrerListaInterna2(l,max);
       l:= l^.sig;
     end;
     RecorrerListaInterna2:= max;

end;        }


{-----------------------------------------------------------------------------
BUSCA VALOR EN RANGO}
procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer);
//var
//   max:integer;
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato.dni >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato.dni <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        //max:= -1;
        //writeln('El maximo puntaje entre sus vuelos es: ',RecorrerListaInterna2(a^.lista,max));
        RecorrerListaInterna2(a^.lista);
        writeln();
        RecorridoAcotado(a^.HI, inf, sup);
        RecorridoAcotado (a^.HD, inf, sup);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup)

    else
      RecorridoAcotado(a^.HD, inf, sup);
end;


// IMPRIME LISTA DE ARBOL
procedure ImprimirDatos(l:listaVuelos);
begin
     while (l <> nil) do begin
           writeln();
           writeln('El codigo de vuelo es ');
           writeln(l^.dato.cod,' - ');
           writeln('El puntaje es ');
           writeln(l^.dato.puntaje,' - ');

           writeln();
           l:=l^.sig;
     end;
end;


// imprime en orden arbol con puntero a lista
procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HI);
    writeln();
    writeln('El dni del pasajero es ',a^.dato.dni);
    writeln();
    writeln('El nombre y apellido del pasajero es ',a^.dato.nombreApellido);

    write('Datos de la lista: ');
    ImprimirDatos(a^.lista);
    writeln();
    enOrden (a^.HD);
  end;
end;
var

   a:arbol;
   p:pasaje;
   per:pasajero;
   max:integer;
   dVuelo:datosVuelo;

begin

// a) genero estructuras
   a:=nil;
   LeerPasaje(p);
   while (p.cod <> '0') do begin

         CopiarDatos(p,per);
         CalcularPuntaje(p,dVuelo); // dependiendo la clase callculamos el puntaje de y lo guardamos en la variable dvuelo, con el codig
         Insertar(a,per,dVuelo);
         LeerPasaje(p);

   end;

// b) Escriba un módulo que devuelva el mayor puntaje total (sumando todos sus vuelos) para dar el premio al mejor cliente.
   max:= -1;
   writeln('El mayor puntaje total es: ',MayorPuntaje(a,max));

// c) Escriba un módulo que imprima el mayor puntaje (entre sus vuelos) de los pasajeros cuyo DNI se encuentre entre 40.000.000 y 50.000.000.
   // Busca en RANGO

   RecorridoAcotado(a,40000000,50000000);

// d)??????????????????????????????
  writeln('En orden');
  enOrden(a);
  writeln();
  readkey();

end.
