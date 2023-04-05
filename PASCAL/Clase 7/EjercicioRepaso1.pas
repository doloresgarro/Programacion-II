{
Twitter dispone de una lista simple con los tweets realizados durante los últimos 5 segundos.
De cada tweet se conoce: el código y nombre de usuario que lo generó, el contenido del mensaje y si el mismo es o no un retweet.
Esta información no tiene ningún orden y se debe tener en cuenta que podrían existir en la lista varios tweets del mismo usuario.

Se pide:
Realice un módulo que reciba la lista con los tweets y genere una nueva estructura donde para cada usuario se almacene la cantidad
de mensajes publicados.
Esta estructura debe estar ordenada por código de usuario y debe ser eficiente para la búsqueda por dicho criterio. 

Una vez generado el árbol: 
Informar la cantidad de tweets de los usuarios con código entre 
         100 y 700. 
Informar el nombre del usuario con mayor cantidad de tweets. 
¿Qué cambiaría del ejercicio implementado si la lista inicial 
         fuera una lista de listas? (Del usuario y sus tweets)
}


Program twitter;
Uses
    sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

     {TYPE PROPIO}
     // ÁRBOL ORDENADO POR CÓDIGO DE USUARIO - CON CONTADOR
     usuario = record
             cod:integer;
             nom:string;
      end;


     arbol = ^nodoA;
     nodoA = record
           dato:usuario;
           HI:arbol;
           HD:arbol;
           cant:integer;
     end;



{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(20);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(400);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

//------------- MODULOS PROPIOS ------------
procedure CopiarDatos(d:tweet; var u:usuario);
begin
 u.cod:= d.codigoUsuario;
 u.nom:= d.nombreUsuario;
end;



{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos  }
procedure Insertar(var a:arbol; u:usuario);
begin
     if (a = nil) then begin
        new(a);
        a^.dato:= u;
        a^.HI:= nil;
        a^.HD:= nil;
        a^.cant:= 1; //agregamos el primer dato al contador que hay en el nodo

     // a^.lista:=nil;     // CASO LISTA inicializamos lista
     // agregarAdelante (a^.lista,p);  //agregamos primer dato de infectado a la lista

     end
     else begin
         if (a^.dato.cod > u.cod) then
            Insertar(a^.HI,u)
         else begin
            if (a^.dato.cod < u.cod) then
               Insertar(a^.HD,u)
            else  //el dato es igual REPETIDO y lo sumamos o lo inserto en la lista
                  a^.cant:= a^.cant + 1;
              end;
     end;

end;


{-----------------------------------------------------------------------------
BUSCA VALOR EN RANGO}

procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato.cod >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato.cod <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        writeln('La cantidad de tweets del usuario ',a^.dato.nom,' con código entre 100 y 700 es: ',a^.cant, ' ');
        RecorridoAcotado(a^.HI, inf, sup);
        RecorridoAcotado (a^.HD, inf, sup);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup)

    else
      RecorridoAcotado(a^.HD, inf, sup);
end;


function Maximo(a:arbol; max: longint): integer; //busca el puntaje maximo con mayor cantidad de tweets.
begin
     if ( a <> nil ) then begin

        if (a^.cant > max) then begin
           max:= a^.cant; //guardamos el puntaje en el maximo
           max:= Maximo(a^.HI,max);
           max:= Maximo(a^.HD,max);
        end
        else begin //como no es mayor el puntaje seguimos buscandooooooo
             max:= Maximo(a^.HI,max);
             max:= Maximo(a^.HD,max);
        end;

      end;
      Maximo :=  max;
end;

     
{-----------------------------------------------------------------------------
BUSCA VALOR EN EL ARBOL}
function buscar(a: arbol; dato: integer): arbol;
begin
    if (a <> nil) then begin
        if (a^.cant = dato) then buscar:= a
        else if (dato < a^.cant) then buscar:= buscar(a^.HI, dato)
        else if (dato > a^.cant) then buscar:= buscar(a^.HD, dato);
    end else buscar:= nil;
end;





{PROGRAMA PRINCIPAL}
var
   l,aux: listaTweets;
   a:arbol;
   maxCant,max:integer;
   Direccion:arbol;
   u:usuario;
   fin:integer;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     writeln('---------------------------------------------------');

     {Completar el programa}



     //GENERAMOS ESTRUCTURA
     a:= nil;
     aux:= l;
     while (aux <> nil) do begin
       CopiarDatos(aux^.dato,u);
       Insertar(a,u);
       aux:= aux^.sig;
     end;

     // Informar la cantidad de tweets de los usuarios con código entre 100 y 700.

     RecorridoAcotado(a,100,700);

     // Informar el nombre del usuario con mayor cantidad de tweets. 
      max:= -1;
      maxCant:= Maximo(a,max);
      Direccion:= Buscar(a,maxCant);
      writeln('El nombre de usuario con mayor cantidad de tweets es : ',Direccion^.dato.nom);

     writeln('Fin del programa');
     readln(fin);
     readln;
end.
