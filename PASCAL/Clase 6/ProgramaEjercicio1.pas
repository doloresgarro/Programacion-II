{Un sitio de estadísticas deportivas mantiene la información de jugadores del fútbol argentino.
 Para ello, se dispone de los datos de los partidos jugados en el año 2022. De cada partido se
 conoce el estadio donde se jugó, los nombres de los 2 equipos que se enfrentaron, la fecha (ej. ‘2022/03/28’)
  y la información de los jugadores que participaron del encuentro. De cada jugador se conoce su nombre y apellido, su DNI, posición (arquero, defensa, mediocampo o delantero) y un puntaje otorgado por un crítico deportivo (1..10). Esta información no tiene ningún orden específico. 
Se pide: 
a) Crear una nueva estructura que almacene para cada jugador, su DNI, su nombre y apellido, posición, y la fecha junto al puntaje obtenido para cada
 partido del que participó. Esta estructura debe estar ordenada por DNI, y debe ser eficiente para la búsqueda por dicho criterio. 
Al finalizar el procesamiento de a), elija las estructuras adecuadas para: 
b) Implementar un módulo que informe por pantalla los datos de cada jugador y su puntaje total acumulado entre todos los partidos. El listado debe estar ordenado por DNI de manera descendente.
c) Implementar un módulo que retorne la cantidad de jugadores cuyo DNI se encuentre entre 30.000.000 y 40.000.000.
d) Implementar un módulo que, dado una posición recibida por parámetro, retorne la cantidad de jugadores que hay en el sistema con dicha característica.  
e) Implementar un programa principal que utilice los módulos implementados e informe lo que corresponda.
}
Program ejercicio1;
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;

      //-------------------------------NUESTROOO--------------------------------
     // datos de la lista de partidos
     part = record
         fecha:str10;
         puntaje:integer;
    end;

    // Lista de fecha y partidos para cada jugador
    listaP = ^nodoP;
    nodoP = record
          dato:part;
          sig:listaP;
    end;


    // jugador con lista de partidos
    jugador2 = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              //puntaje:integer;
     end;

     // ?rbol de jugadores con puntero a una lista
     arbol=^nodoA;
     nodoA = record
           dato:jugador2;
           HI:arbol;
           HD:arbol;
           partidos: listaP;
           PuntajeTotal: integer;
     end;


procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(360)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;
 {
procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
        }
{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante (var l:listaP;  fecha:str10; puntaje:integer);
var
  aux: listaP;
begin
  new(aux);
  aux^.dato.fecha := fecha  ;
  aux^.dato.puntaje := puntaje ;
  aux^.sig := l;
  l:= aux;
end;





//-------------------------------------------------------------------------
procedure CopiarDatos(d:jugador;  var j:jugador2);
begin
     j.dni:= d.dni;
     j.nombreApellido:= d.nombreApellido;
     j.posicion:= d.posicion;
     //j.puntaje:= d.puntaje;
end;



{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos  }

procedure Insertar(var a:arbol; j:jugador2; fecha:str10; puntaje:integer);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:=j ;

        a^.HI:= nil;
        a^.HD:= nil;
        a^.partidos:=nil;     // CASO LISTA inicializamos lista
        agregarAdelante (a^.partidos,fecha,puntaje);  //agregamos primer dato de infectado a la lista
        a^.PuntajeTotal:= puntaje;
     end
     else begin
         if (a^.dato.dni > j.dni) then
            Insertar(a^.HI,j,fecha,puntaje)
         else begin
            if (a^.dato.dni < j.dni) then
               Insertar(a^.HD,j,fecha,puntaje)
            else begin//el dato es igual REPETIDO y lo sumamos o lo inserto en la lista
                  writeln('ENTRA AL IGUALLLLLLLLLLLLLLLLLLLLLL');
                  agregarAdelante (a^.partidos,fecha,puntaje);
                  a^.PuntajeTotal:= a^.PuntajeTotal + puntaje;
            end;
              end;
     end;

end;

{-----------------------------------------------------------------------------
BUSCA VALOR EN RANGO con contador   }

function verValoresEnRango(a: arbol; inf, sup:integer; total: integer): integer;
begin
     if(a <> nil) then begin

          if(a^.dato.dni >= inf)then begin
                    if(a^.dato.dni <= sup)then begin
                       total:= total + 1;
                       total:= verValoresEnRango(a^.HI, inf, sup, total);
                       total:= verValoresEnRango(a^.HD, inf, sup, total);
          end
          else
              total:= verValoresEnRango(a^.HI, inf, sup, total);
     end
     else 
          total:= verValoresEnRango(a^.HD, inf, sup, total);
     end;

     verValoresEnRango:= total;
end;



{----------------------------------------------------------------------------- }
// imprime lista del arbol
procedure ImprimirDatos(l:listaP);
begin
     while (l <> nil) do begin
           writeln();
           writeln('El puntaje del jugador es: ');
           write(l^.dato.puntaje,' - ');
           writeln();
           writeln('La fecha del partido es: ');
           write(l^.dato.fecha,' - ');
           l:=l^.sig;
     end;
end;


// Ejercicio 2, imprime contador
procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HD);
    writeln();
    writeln('DNI del jugador ',a^.dato.dni);
    writeln('nombre del jugador ',a^.dato.nombreApellido);
    writeln('posicion del jugador ',a^.dato.posicion);
    writeln('El puntaje total es: ', a^.puntajeTotal);

    write('Datos de la lista de partidos jugados: ');
    ImprimirDatos(a^.partidos);
    writeln();
    enOrden (a^.HI);
  end;
end;

{-----------------------------------------------------------------------------
RECORRE Y BUSCA en orden - izq, raíz, derecho }

function cantJugadores(a:arbol; posicion: str10; cantidad:integer): integer;
begin
     if (a <> nil) then begin

        if (a^.dato.posicion = posicion) then begin
           writeln ('ENTRA AL CONTADOOOOOOOOOOOOOOOOOOOOOOOOOR');
                cantidad:= cantidad + 1;
                cantidad:= cantJugadores (a^.HI,posicion,cantidad);
                cantidad:= cantJugadores (a^.HD, posicion, cantidad);
        end
        else begin
            cantidad:= cantJugadores (a^.HI,posicion,cantidad);
            cantidad:= cantJugadores (a^.HD,posicion,cantidad);
        end;
     end;
     cantJugadores:= cantidad;
end;




var
   l: listaPartidos;
   a:arbol;
   j:jugador2;
   fecha:str10;
   total: integer;
   inf,sup: integer;
   posicion: str10;
   cantidad: integer;

begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
  //   writeln ('Lista generada: ');
    // imprimirLista(l);


     {Completar el programa}
     readln;
     a:= nil;
     while(l<>nil)do begin
       fecha:= l^.dato.fecha;
       while (l^.dato.jugadores <> nil) do begin

         CopiarDatos(l^.dato.jugadores^.dato,j);
         Insertar(a,j,fecha,l^.dato.jugadores^.dato.puntaje);

         l^.dato.jugadores:= l^.dato.jugadores^.sig;

       end;

       l:=l^.sig;
     end;


     writeln ('----------------------');

     writeln('En orden');
     enOrden(a);
      writeln();

      //RECORRE EN RANGO CON UN CONTADOR
     // Busca en RANGO

      write('Ingrese limite inferior: ');
       readln(inf);
       write('Ingrese limite superior: ');
       readln(sup);



    //PUNTO C: Implementar un módulo que retorne la cantidad de jugadores cuyo DNI se encuentre entre 30.000.000 y 40.000.000.
    total:=0;
    writeln('La cantidad de jugadores cuyo DNI se encuentre entre 30.000.000 y 40.000.000 es:  ',verValoresEnRango(a, inf, sup, total));

    //PUNTO D: Implementar un módulo que, dado una posición recibida por parámetro,
    //retorne la cantidad de jugadores que hay en el sistema con dicha característica.

    cantidad:=0;
    writeln ('Ingrese posicion del jugador');
    readln (posicion);
    writeln ('La cantidad de jugadores con esa posición es: ',cantJugadores (a,posicion,cantidad) );


    writeln('Fin del programa');






     readln;
end.
