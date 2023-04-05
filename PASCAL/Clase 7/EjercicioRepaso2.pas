{Una biblioteca quiere tener un mejor acceso a sus libros. Para ello, nos piden
generar un árbol binario de búsqueda con los datos de todos sus libros. De cada
libro se conoce: título, ISBN y clasificador bibliográfico (código alfanumérico
que permite clasificar el tema del ejemplar), que se leen desde teclado. La
lectura finaliza con el ISBN 0 (cero). Interesa poder buscar los libros
eficientemente por ISBN.

Se pide:
Generar árbol binario de búsqueda según el enunciado.

Una vez generado el árbol: 

a) Realice un módulo que reciba el árbol y un ISBN de libro, y retorne verdadero si
existe dicho libro en el árbol o falso en caso contrario.

b) Realizar un módulo que reciba el árbol y un código clasificador, y devuelva la
cantidad de veces que aparece en el árbol (el módulo debe tener en cuenta que
puede no existir).

c) Realice un módulo que reciba el árbol y un título de libro, y retorne verdadero
si existe dicho libro en el árbol o falso en caso contrario.
Realizar un programa que invoque a los módulos realizados e informe desde el
programa principal los datos correspondientes.
}

program punto2REPASO;
uses
    crt;
type

     libro = record
             titulo:string;
             ISBN:integer;
             cod:integer;
     end;

     arbol = ^nodoA;
     nodoA = record
           dato:libro;
           HI:arbol;
           HD:arbol;
     end;


{---------------------MÓDULOS----------------------}
procedure LeerLibro(var l:libro);
begin
     writeln('Ingrese ISBN: ');
     readln(l.ISBN);
     if (l.ISBN <> 0) then begin
       writeln('Ingrese titulo del libro: ');
       readln(l.titulo);
       writeln('Ingrese clasificador bibliográfico: ');
       readln(l.cod);
     end;
end;


{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos  }

procedure Insertar(var a:arbol; l:libro);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= l;
        a^.HI:= nil;
        a^.HD:= nil;
     // a^.cant:= 1; //agregamos el primer dato al contador que hay en el nodo
     // a^.lista:=nil;     // CASO LISTA inicializamos lista
     // agregarAdelante (a^.lista,p);  //agregamos primer dato de infectado a la lista

     end
     else begin
         if (a^.dato.ISBN > l.ISBN) then
            Insertar(a^.HI,l)
         else begin
            if (a^.dato.ISBN < l.ISBN) then
               Insertar(a^.HD,l)
         end;
     end;

end;


{-----------------------------------------------------------------------------
BUSCA VALOR del ISBN EN EL ARBOL}
function buscarISBN(a: arbol; dato: integer): boolean;
begin
    if (a <> nil) then begin
        if (a^.dato.ISBN = dato) then buscarISBN:= true
        else if (dato < a^.dato.ISBN) then buscarISBN:= buscarISBN(a^.HI, dato)
        else if (dato > a^.dato.ISBN) then buscarISBN:= buscarISBN(a^.HD, dato);
    end
    else buscarISBN:= false;
end;

{-----------------------------------------------------------------------------
BUSCA VALOR DEL CODIGO EN EL ARBOL}

function contador(a:arbol; cod:integer; cantidad:integer): integer;
begin
     if (a <> nil) then begin

        if (a^.dato.cod = cod) then begin
           cantidad:= cantidad + 1;
           cantidad:= contador (a^.HI,cod,cantidad);
           cantidad:= contador (a^.HD, cod, cantidad);
        end
        else begin
            cantidad:= contador (a^.HI,cod,cantidad);
            cantidad:= contador (a^.HD,cod,cantidad);
        end;
     end;
     contador:= cantidad;
end;

{-----------------------------------------------------------------------------
BUSCA VALOR DEL CODIGO EN EL ARBOL}
function buscarLibro(a: arbol; titulo: string): boolean;
var
   encontro:boolean;
begin
    if (a^.dato.titulo = titulo) then
           encontro := True
    else begin
      encontro := buscarLibro(a^.HI, titulo);
      encontro := buscarLibro(a^.HD, titulo);
    end;
    buscarLibro := encontro;
end;



{-----------------------------------------------------------------------------
IMRPIME EL ARBOL en orden - izq, raíz, derecho }

procedure enOrden(a:arbol);
begin
     if (a <> nil) then begin
        enOrden(a^.HI);
        write(a^.dato.titulo,' ');
        write(a^.dato.ISBN,' ');
        write(a^.dato.cod,' ');
        enOrden(a^.HD);
     end;
end;



{PROGRAMA PRINCIPAL}
var

   l:libro;
   a:arbol;
   ISBN,cod,cantidad:integer;
   tit:string;
   //encontro:boolean;

begin

  // GENERAMOS ESTRUCTURA
   a:=nil;
   LeerLibro(l);
   while (l.ISBN <> 0) do begin
     Insertar(a,l);
     LeerLibro(l);
   end;

   writeln('----------------------');

   // a) Realice un módulo que reciba el árbol y un ISBN de libro, y retorne verdadero si
   //    existe dicho libro en el árbol o falso en caso contrario.
   writeln('Ingrese un ISBN para buscar libro: ');
   readln(ISBN);
   writeln('¿El libro esta en el arbol?: ', BuscarISBN(a,ISBN));


   writeln('----------------------');
   //b) Realizar un módulo que reciba el árbol y un código clasificador, y devuelva la cantidad de veces que aparece en el árbol (el módulo debe tener en cuenta que puede no existir).
   writeln('Ingrese un clasificador bibliográfico para buscar libro: ');
   readln(cod);
   cantidad:=0;
   writeln('La cantidad de veces que el libro con el codigo ',cod,' aparece en el árbol es: ',contador(a,cod,cantidad));


   writeln('----------------------');
   //c) Realice un módulo que reciba el árbol y un título de libro, y retorne verdadero si existe dicho libro en el árbol o falso en caso contrario.
   //   Realizar un programa que invoque a los módulos realizados e informe desde el programa principal los datos correspondientes.
   writeln('Ingrese titulo para buscar libro: ');
   read(tit);
   //encontro:= false;
   writeln('¿El libro esta en el arbol?: ', buscarLibro(a,tit));






   readkey();
end.
