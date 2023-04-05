{
La empresa �Veterinaria Paws� desea procesar la informaci�n de las mascotas que atienden. De cada mascota se
conoce: identificador, tipo de animal (perro, gato, etc.), peso, fecha de ingreso a la veterinaria, cantidad de
intervenciones. Adem�s se conoce informaci�n de su due�o: DNI, nombre y apellido y direcci�n. Esta informaci�n se
lee desde teclado sin ning�n orden espec�fico hasta que alcance a la mascota que tiene al due�o con DNI 90909090.
a) Realizar un m�dulo que procese la informaci�n descripta anteriormente y genere una estructura donde para
cada cliente se guarde su DNI, nombre y apellido, direcci�n y las mascotas que tiene a su cargo. De cada
mascota interesa almacenar el identificador de la mascota, el tipo de animal, peso, fecha de ingreso a la
veterinaria y cantidad de intervenciones. Esta estructura debe estar ordenada por DNI del cliente y debe ser
eficiente para la b�squeda por dicho criterio.
Al finalizar el procesamiento de a), se pide:
b) Implementar un m�dulo que informe el domicilio del cliente que tiene la menor cantidad de intervenciones
entre todas sus mascotas.
c) Implementar un m�dulo que imprima los DNI, nombre y apellido de los clientes cuyo n�mero de DNI est�
entre 15000000 y 30000000. El listado debe estar ordenado por DNI de manera descendente.
d) Implementar un m�dulo que imprima, para cada cliente, su nombre y apellido junto al identificador y tipo de
mascota que pese m�s de 10 kg y que haya ingresado a la veterinaria entre los meses de Enero y Marzo
2023.
e) Realizar un programa que simule el llamado a los m�dulos realizado
}


program VeterinariaPaws;

uses SysUtils;

type
  TFecha = record
    dia: 1..31;
    mes: 1..12;
    anio: word;
  end;

  TMascota = record
    identificador: integer;
    tipoAnimal: string[20];
    peso: real;
    fechaIngreso: TFecha;
    cantIntervenciones: integer;
  end;

  ListaMascotas = ^TMascotasList;
  TMascotasList = record
                  datos:TMascota;
                  sig: ListaMascotas;
                 end;

  TCliente = record
    DNI: integer;
    nombre: string[30];
    apellido: string[30];
    direccion: string[50];
    mascotas: ListaMascotas;
  end;


  ArbolCliente = ^NodoCliente;
  NodoCliente = record
    cliente: TCliente;
    izquierda, derecha: ArbolCliente;
  end;
