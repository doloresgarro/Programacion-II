program MODULOSIMPORTANTES;
uses
  crt;
type

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


  // Árbol con contador y lista
    arbol= ^nodoA;
    nodoA = record
     dato: integer;
     HI: arbol;
     HD: arbol;
     cant:integer; //contador
     lista:listaX; // puntero a nodo
    end;


{----------------------------------------------------}
{---------------TYPE LISTA DE LISTAS-----------------}
{----------------------------------------------------}

    producto = record    //PRODUCTO SIN MARCA
         codigo: integer;
         nombre: string;
         anio: 2000..2022;
    	 precio: real;
       end;

	 //Lista interna ordenada por años
	 
     ListaInterna = ^nodoInterno;
     nodoInterno = record
              dato:producto;
              sig:ListaInterna;
              end;

     datoListaGrande= record
                   lista:ListaInterna;
                   marca:string;
                   end;
                   
      
     // Lista ordenada por marcas, en cada nodo se encuentra el puntero a la lista interna y el nombre de la marca.
      
     ListaGrande = ^nodo;
     nodo = record
          dato:datoListaGrande;
          sig:ListaGrande;
          end;



// PROCEDIMIENTOSSSSSSSSSSSSSSS


{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - tratamiento de repetidos  }

procedure Insertar(var a:arbol; p:paciente);
begin
     if (a = nil) then begin

        new(a);
        a^.dato:= p;
        a^.HI:= nil;
        a^.HD:= nil;
     // a^.cant:= 1; //agregamos el primer dato al contador que hay en el nodo
     // a^.lista:=nil;     // CASO LISTA inicializamos lista
     // agregarAdelante (a^.lista,p);  //agregamos primer dato de infectado a la lista

     end
     else begin
         if (a^.dato > p.cod) then
            Insertar(a^.HI,p)
         else begin
            if (a^.dato < p.cod) then
               Insertar(a^.HD,p)
            else begin //el dato es igual REPETIDO y lo sumamos o lo inserto en la lista
                  a^.cant:= a^.cant + 1;
                  agregarAdelante (a^.lista,p.dni);
            end;
         end;
     end;

end;

{-----------------------------------------------------------------------------
INSERTAR AL ARBOL - SIN de repetidos} }

procedure Insertar(var a:arbol; p:paciente);
begin
     if (a = nil) then begin

        new(a);
        a^.dato:= p;
        a^.HI:= nil;
        a^.HD:= nil;

     end
     else begin
         if (a^.dato > p.cod) then
            Insertar(a^.HI,p)
         else begin
            if (a^.dato < p.cod) then
               Insertar(a^.HD,p)
         end;
     end;

end;



{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con nÃºmeros aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;





{-----------------------------------------------------------------------------
IMRPIME EL ARBOL pre orden - raiz, izq, derecho}

procedure preOrden(a:arbol);
begin
     if (a <> nil) then begin
        write(a^.dato,' ');
        preOrden(a^.HI);
        preOrden(a^.HD);
     end;
end;

{-----------------------------------------------------------------------------
IMRPIME EL ARBOL post orden - izq, derecho, raíz }

procedure postOrden(a:arbol);
begin
     if (a <> nil) then begin
        postOrden(a^.HI);
        postOrden(a^.HD);
        write(a^.dato,' ');
     end;
end;

{-----------------------------------------------------------------------------
IMRPIME EL ARBOL en orden - izq, raíz, derecho }

procedure enOrden(a:arbol);
begin
     if (a <> nil) then begin
        enOrden(a^.HI);
        write(a^.dato,' ');
        enOrden(a^.HD);
     end;
end;


{----------------------------------------------------------------------------- }
// IMPRIME LISTA INTERNA DEL ARBOL
procedure ImprimirDatos(l:lista);
begin
     while (l <> nil) do begin
           writeln();
           writeln('El ----- es: ');
           write(l^.dato,' - ');
           writeln();
           l:=l^.sig;
     end;
end;


// IMPRIME EN ORDEN ARBOL CON PUNTERO A LISTA
procedure enOrden(a: arbol);
begin
  if ( a <> nil ) then begin 
    enOrden (a^.HI);
    writeln();
    writeln('dato del nodo ',a^.dato);

    write('Datos de la lista: ');
    ImprimirDatos(a^.lista);
    writeln();
    enOrden (a^.HD);
  end;
end;



// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{----------------------IMPRIME RECURSIVO-----------------------------}
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure ImprimirRecursivo(L:Lista);
begin
     if (L <> nil) then begin
        write(L^.datos,' ');
        ImprimirRecursivo(L^.sig);
     end;
end;



{-----------------------------------------------------------------------------
IMPRIMIR POR NIVEL - Muestra los datos del rbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

{-----------------------------------------------------------------------------
BUSCA VALOR EN EL ARBOL}
function buscar(a: arbol; dato: integer): arbol;
begin
    if (a <> nil) then begin
        if (a^.dato = dato) then buscar:= a
        else if (dato < a^.dato) then buscar:= buscar(a^.HI, dato)
        else if (dato > a^.dato) then buscar:= buscar(a^.HD, dato);
    end else buscar:= nil;
end;


{-----------------------------------------------------------------------------
BUSCA VALOR MÍNIMO DEL ARBOL}
function verMin(a:arbol):integer;
begin
     if (a <> nil) then
        if (a^.HI = nil) then begin  //caso base
           verMin:=a^.dato
        end
        else begin
           verMin:= verMin(a^.HI);
     end
     else begin
         verMin:= -1
     end;
end;

{-----------------------------------------------------------------------------
BUSCA VALOR MÁXIMO DEL ARBOL}
function verMax(a:arbol):integer;
begin
     if (a <> nil) then
        if (a^.HD = nil) then begin //caso base
           verMax:=a^.dato
        end
        else begin
           verMax:= verMax(a^.HD);
     end
     else begin
         verMax:= -1
     end;
end;


{-----------------------------------------------------------------------------
BUSCA VALOR EN RANGO - imprime }
procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        write(a^.dato, ' ');
        RecorridoAcotado(a^.HI, inf, sup);
        RecorridoAcotado (a^.HD, inf, sup);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup)

    else
      RecorridoAcotado(a^.HD, inf, sup);
end;



{-----------------------------------------------------------------------------
BUSCAR VALOR EN RANGO CON FUNCION con CONTADOR}
function RecorridoAcotado(a: arbolJugadores; inf, sup: longint; total: integer): integer;
begin
     if(a <> nil) then begin

     if(a^.dni >= inf)then begin
          if(a^.dni <= sup)then begin
               total:= total + 1;
               total:= RecorridoAcotado(a^.HI, inf, sup, total);
               total:= RecorridoAcotado(a^.HD, inf, sup, total);
          end
          else
          total:= RecorridoAcotado(a^.HI, inf, sup, total);
     end
     else 
          total:= RecorridoAcotado(a^.HD, inf, sup, total);
     end;
     RecorridoAcotado:= total;
end;


{-----------------------------------------------------------------------------
BUSCA VALOR EN RANGO con contador }
procedure RecorridoAcotado(a: arbol; inf:integer; sup:integer; var contador:integer);
begin
  if (a <> nil) then // mientras no se termine el arbol
    if (a^.dato >= inf) then // si el valor en arbol es mayor o igual al lim inferior

      if (a^.dato <= sup) then begin // si el valor en arbol es menor o igual al lim superior
        contador:= contador + 1;
        RecorridoAcotado(a^.HI, inf, sup,contador);
        RecorridoAcotado (a^.HD, inf, sup,contador);
      end
      else
        RecorridoAcotado(a^.HI, inf, sup, contador)

    else
      RecorridoAcotado(a^.HD, inf, sup, contador);
end;


{-----------------------------------------------------------------------------
 BUSCA EL PUNTAJE MAXIMO ENTRE LOS DATOS EN ARBOL }
function Maximo(a:arbol; max: longint): integer; //busca el puntaje maximo con mayor cantidad de tweets.
begin
     if ( a <> nil ) then begin

        if (a^.cant > max) then begin
           max:= a^.cant; //guardamos el puntaje en el maximo
           max:= Maximo(a^.HI,max);
           max:= Maximo(a^.HD,max);
        end
        else begin //como no es mayor el puntaje seguimos buscando
             max:= Maximo(a^.HI,max);
             max:= Maximo(a^.HD,max);
        end;

      end;
      Maximo :=  max;
end;

{-----------------------------------------------------------------------------
 BUSCA EL PUNTAJE MINIMO ENTRE LOS DATOS EN ARBOL }
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



{-----------------------------------------------------------------------------
 BUSCA EL PUNTAJE MAXIMO ENTRE LOS DATOS EN ARBOL CON LISTA INTERNA}
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



{-----------------------------------------------------------------------------
 FUNCIÓN CONTADOR}

function contador(a:arbol; dato:integer; cantidad:integer): integer;
begin
     if (a <> nil) then begin

        if (a^.dato = dato) then begin
           cantidad:= cantidad + 1;
           cantidad:= contador(a^.HI,dato,cantidad);
           cantidad:= contador(a^.HD, dato, cantidad);
        end
        else begin
            cantidad:= contador(a^.HI,dato,cantidad);
            cantidad:= contador(a^.HD,dato,cantidad);
        end;

     end;
     contador:= cantidad;
end;

  {------------FUNCIÓN BUSCAR TÍTULO-----DEVUELVE BOOLEAN--------------- }

function buscarTitulo(a: Arbol; titulo: string): boolean;
var encontro: boolean;
begin
    if (a = nil) then
       encontro := False
    else begin
        if (a^.dato.titulo = titulo) then
           encontro := True
        else begin
            encontro := buscarTitulo(a^.HI, titulo);
            if (encontro <> true) then
                encontro := buscarTitulo(a^.HD, titulo);
        end;
    end;
    buscarTitulo := encontro;
end;

{-----------------------------------------------------------------------------
BUSCA VALOR EN EL ARBOL --- DEVUELVE BOOLEAN}
function buscar(a: arbol; dato: integer): boolean;
begin
    if (a <> nil) then begin
        if (a^.dato.ISBN = dato) then buscar:= true
        else if (dato < a^.dato.ISBN) then buscar:= buscar(a^.HI, dato)
        else if (dato > a^.dato.ISBN) then buscar:= buscar(a^.HD, dato);
    end else buscar:= false;
end;


{-----------------------------------------------------------------------------
BORRA ELEMENTO DEL ARBOL}

procedure BorrarElemento(var a:arbol; valor:integer);
var
   aux:arbol;
begin

  if (a = nil) then
    writeln('No se encontro el dato a borrar ')
  else begin
     if (valor < a^.dato) then
        BorrarElemento(a^.HI,valor)
     else begin
        if (valor > a^.dato) then
          BorrarElemento(a^.HD,valor)
        else begin
          //ENCONTRÉ EL VALOR A BORRAR
          if ((a^.HD = nil) and (a^.HI = nil)) then begin // si es una hoja
             dispose(a);
             a:=nil;
             writeln('Se borro - es una hoja');
          end
          else begin
            if ((a^.HD <> nil) and (a^.HI = nil)) then begin // si tiene hijo derecho
               aux:= a;
               a:= a^.HD;
               dispose(aux);
               writeln('Se borro - hijo derecho ');
            end
            else begin
               if ((a^.HI <> nil) and (a^.HD = nil)) then begin // si tiene hijo izquierdo
                  aux:= a;
                  a:= a^.HI;
                  dispose(aux);
                  writeln('Se borro - hijo izquierdo ');
               end
               else begin // si tiene dos hijos

                 aux:= Buscar(a,valor); //guarda direc de memoria del dato a borrar
                 aux^.dato:= verMin(aux^.HD); //se intercambia el valor del minimo por el q se quiere borrar (mas a la izquiera del subarbol derecho)
                 BorrarElemento(a^.HD,aux^.dato);

               end;
            end;
          end;
        end;
     end;
  end;

end;



{-------------------------------------------------------}
{---------------MÓDULOS LISTA DE LISTAS-----------------}
{-------------------------------------------------------}


procedure AgregarAlFinalListaGRANDE (var l: ListaG; marca: string; var aux:ListaG);
var act, nue : ListaG;
begin

	new (nue);
	nue^.datos.marca:= marca;
	nue^.datos.lista:=nil;
	aux:= nue; //GUARDO LA DIRECCIÃ“N DE MEMORIA DE NUE PARA DESPUES INSERTAR AHI EN LA LISTA INTERNA. 
	
	if (l <> nil) then begin
        act := l ;
		while (act^.sig <> NIL ) do
          act := act^.sig ;
		act^.sig := nue ;
		
	end
	else begin
		l:= nue;
	end;



procedure AgregarAlFinalListaINTERNA (var l: ListaInterna; p: producto);
var
   act, nue : ListaInterna;
begin

  new (nue);
  CopiarDatos(p,nue^.datos);
  nue^.sig := NIL;
  if (l <> nil) then begin
     act := l ;
     while (act^.sig <> NIL ) do
       act := act^.sig ;
     act^.sig := nue ;
  end
  else
	l:= nue;
end;


procedure RecorrerLista(l:listaOriginal; var ListaG:ListaGrande);
var
  actualMarca:string;
  aux: ListaGrande;
begin

     aux:= ListaG; // guarda puntero al primer nodo de la lista (después se actualiza)
	 while (l <> nil) do begin
		actualMarca:=l^.dato.marca; //guardamos marca.
		AgregarAlFinalListaGRANDE(ListaG,actualMarca,aux); //creo un nodo para la marca, inserto la marca y pongo la lista interna en nil
    
        // Mientras sea la misma marca, agrega a la lista interna
		while (l <> nil) and (actualMarca = l^.dato.marca) do begin
			AgregarAlFinalListaINTERNA(aux^.dato.lista, l^.dato);
			l:=l^.sig;
   		end;
  	 end;
     	
end;



//--------------------IMPRIMIR LISTA DE LISTAS------------------------//

procedure ImprimirNodo(p: producto2);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ' ,'Anio:',anio, ' Precio: ', precio:2:2);
     end;
end;


procedure ImprimirListaInterna (l: ListaInterna);
begin
  writeln ('Imprime lista interna ----------');
  writeln ('                  ');
  while (l<>nil)  do begin
    ImprimirNodo(l^.datos);
    l:= l^.sig;
  end;
end;

procedure ImprimirListaOrdenada(ListaG:ListaGrande);
begin

     while (ListaG <> nil) do begin
           writeln ('   ');
           writeln('La marca es:  ', ListaG^.datos.marca);  // dato de orden
           writeln ('              ');
           ImprimirListaInterna (ListaG^.datos.lista); // imprime datos de esa marca
           ListaG:= ListaG^.sig;
           
     end;

end;





// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{----------------------IMPRIME RECURSIVO-----------------------------}
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure ImprimirRecursivo(L:Lista);
begin
     if (L <> nil) then begin
        write(L^.dato,' ');
        ImprimirRecursivo(L^.sig);
     end;
end;


//--------------INSERTAR ORDENADO(LISTA SIMPLE)----------------------
procedure InsertarOrdenado(var l:listainterna; p:producto2);
var
  nue, ant, act: listainterna;
begin
    new (nue);
    nue^.dato:= p;
    nue^.sig:= nil;

    if (l=nil) then
        l:= nue
    else 
    begin
        act:= l; ant:=l;
        while (act<>nil) and (act^.dato.anio < p.anio) do begin
            ant:=act;
            act:= act^.sig;
        end;
        if (ant=act) then begin
            l:= nue;
        end
        else begin
            ant^.sig:= nue;
        end;
        nue^.sig:= act;

    end;

end;






var

   a:arbol;
   l:lista;
   //ir declarando variables necesarias

begin

   Randomize;

  // crea lista
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);


  // crea arbol (recorre lista insertando los datos en el arbol)
  a:=nil;
  while (l <> nil) do begin
    Insertar(a,l^.dato);  // con repetidos
    l:= l^.sig;
  end;

  {
  // crea arbol (lee pacientes insertandolos en el arbol hasta que se ingrese -1)
  a:=nil;
  LeerPaciente(p);
  while (p.cod <> -1) do begin
    Insertar(a,p);  // con repetidos
    LeerPaciente(p);
  end;
  }


  // Imprime arbol
  writeln();
  writeln('Pre Orden');
  preOrden(a);
  writeln();

  writeln('En orden');
  enOrden(a);
  writeln();

  writeln('Post Orden');
  postOrden(a);
  writeln();

  writeln('Imprime por nivel: ');
  imprimirpornivel(a);

  // Busca un valor en el arbol
  writeln('Ingrese valor ');
  readln(valor);
  Direccion:= Buscar(a,valor);

  // Busca valor MÍNIMO del árbol
  writeln('El valor minimo en el arbol es: ', verMin(a));

  // Busca valor MÁXIMO del árbol
  writeln('El valor maximo en el arbol es: ', verMax(a));

  // Busca en RANGO
  write('Ingrese limite inferior: ');
  readln(inf);
  write('Ingrese limite superior: ');
  readln(sup);
  RecorridoAcotado(a,inf,sup);
  { RECORRE EN RANGO CON UN CONTADOR
    infectados:=0;
    RecorridoAcotado(a,inf,sup,contador); // hay que hacerlo como funcion????????????????
    writeln('La cantidad de infectados de aquellas localidades que tienen código postal entre 1800 y 1900 es: ',infectados);  }

  writeln();

  // BORRA ELEMENTO
  write('Ingrese valor a eliminar: ');
  readln(valor);
  BorrarElemento(a,valor);
  writeln();
  writeln ('Imprime por nivel luego de borrar: '); // Imprime después de borrar
  imprimirpornivel(a);




  //-------------LISTA DE LISTAS------------//
  Listag:=nil;
  writeln ('generando lista nueva');
  RecorrerLista(l,ListaO);

  writeln();
  writeln('Lista nueva: ');
  writeln ('');
  ImprimirListaOrdenada(ListaG);
  readln();


  {EJEMPLO RECORRIDO DE LISTA DE LISTAS INSERTANDO EN ÁRBOL!!!!!}
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





readkey();
end.
