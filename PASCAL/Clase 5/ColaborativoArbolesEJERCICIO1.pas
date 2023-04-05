{Ejercicio 1: Con la información anterior, se quiere armar un mapa en el que
aparezca por cada ciudad, la cantidad total de habitantes infectados.
Este mapa debe estar ordenado por código postal para que la búsqueda por dicho
 criterio sea eficiente.

a)	Implementen el mapa de información.
b)	Implementen un módulo que informe la cantidad de infectados de aquellas
 localidades que tienen código postal entre 1800 y 1900.
}
program ColaborativoEjercicio1;
uses
  crt;
type
    
    paciente = record
             dni:integer;
             cod:integer;
             ciudad:string;
    end;

    arbol= ^nodoA;
    nodoA = record
     dato: integer;
     HI: arbol;
     HD: arbol;
     cant:integer; //contador de infectados dentro del nodo
    end;

procedure leerPaciente(var p:paciente);
begin
     writeln('Ingrese dni: ');
     readln(p.dni);
     if (p.dni <> -1) then begin
      writeln('Ingrese codigo postal: ');
      readln(p.cod);
      writeln('Ingrese ciudad: ');
      readln(p.ciudad);
     end;
end;

{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos CON CONTADOR}

procedure Insertar(var a:arbol; p:paciente);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= p.cod;
        a^.HI:= nil;
        a^.HD:= nil;
        a^.cant:= 1; //agregamos el primer infectado al contador que hay en el nodo

     end
     else begin
         if (a^.dato > p.cod) then
            Insertar(a^.HI,p)
         else begin
            if (a^.dato < p.cod) then
               Insertar(a^.HD,p)
            else  //el dato es igual REPETIDO y lo sumamos
                  a^.cant:= a^.cant + 1;
              end;
     end;

end;



procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HI);
    writeln();

    writeln('El codigo postal de la ciudad es: ',a^.dato);
    write('Cantidad de infectados que tiene la ciudad: ',a^.cant);

    writeln();
    enOrden (a^.HD);
  end;
end;



procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer; var infectados:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        infectados:= infectados + 1;
        RecorridoAcotado(a^.HI, inf, sup,infectados);
        RecorridoAcotado (a^.HD, inf, sup,infectados);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup, infectados)

    else
      RecorridoAcotado(a^.HD, inf, sup, infectados);
end;




var

   a:arbol;
   p:paciente;
   inf,sup,infectados:integer;

begin

     writeln();
     a:=nil;
     LeerPaciente(p);
     while (p.dni <> -1) do begin
           Insertar(a,p);
           LeerPaciente(p);
     end;

     
     writeln();
     writeln('Imprime arbol: ');
     writeln();
     enOrden(a);

     infectados:=0;
     write('Ingrese limite inferior: ');  // hay que leer lim superior e inferior????????????????
     readln(inf);
     write('Ingrese limite superior: ');
     readln(sup);
     RecorridoAcotado(a,inf,sup,infectados); // hay que hacerlo como funcion????????????????
     writeln('La cantidad de infectados de aquellas localidades que tienen código postal entre 1800 y 1900 es: ',infectados);
     readkey();

end.
