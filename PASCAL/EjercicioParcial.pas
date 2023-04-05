{
La empresa “Veterinaria Paws” desea procesar la información de las mascotas que atienden. De cada mascota se
conoce: identificador, tipo de animal (perro, gato, etc.), peso, fecha de ingreso a la veterinaria, cantidad de
intervenciones. Además se conoce información de su dueño: DNI, nombre y apellido y dirección. Esta información se
lee desde teclado sin ningún orden específico hasta que alcance a la mascota que tiene al dueño con DNI 90909090.
a) Realizar un módulo que procese la información descripta anteriormente y genere una estructura donde para
cada cliente se guarde su DNI, nombre y apellido, dirección y las mascotas que tiene a su cargo. De cada
mascota interesa almacenar el identificador de la mascota, el tipo de animal, peso, fecha de ingreso a la
veterinaria y cantidad de intervenciones. Esta estructura debe estar ordenada por DNI del cliente y debe ser
eficiente para la búsqueda por dicho criterio.
Al finalizar el procesamiento de a), se pide:
b) Implementar un módulo que informe el domicilio del cliente que tiene la menor cantidad de intervenciones
entre todas sus mascotas.
c) Implementar un módulo que imprima los DNI, nombre y apellido de los clientes cuyo número de DNI está
entre 15000000 y 30000000. El listado debe estar ordenado por DNI de manera descendente.
d) Implementar un módulo que imprima, para cada cliente, su nombre y apellido junto al identificador y tipo de
mascota que pese más de 10 kg y que haya ingresado a la veterinaria entre los meses de Enero y Marzo
2023.
e) Realizar un programa que simule el llamado a los módulos realizado
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
