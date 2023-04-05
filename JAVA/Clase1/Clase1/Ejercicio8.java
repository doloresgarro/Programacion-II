/**

8- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen (con puntaje de 1 a 10) los siguientes
 aspectos: (0) Atención al cliente (1) Calidad de la comida (2) Precio  (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes para cada uno de los aspectos y almacene 
la información en una estructura. Luego imprima la calificación  promedio obtenida por cada aspecto. 

 */


import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio8{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    //declaramos matriz
    int [][] matriz;
    matriz = new int [5][4]; //5 filas y 4 columnas 
    int i = 0;
    int j = 0;
    int Calificacion;
    for (i=0; i<5; i++)
    { // info del cliente
        System.out.print ("\n");
        System.out.print ("CALIFICACION DEL CLIENTE " + i + "\n");
        System.out.print ("\n");
        for (j=0; j<4; j++)
        {
            System.out.print ("Califique aspecto " + j + "\n");
            Calificacion = in.nextInt ();
            matriz [i][j] = Calificacion;
        
        }
    }
     
    //recorremos la matriz para sacar promedios 
    int contador;
    double promedio;
    System.out.print ("\n");
    
    for (j=0; j<4; j++){
        contador= 0;
        promedio = 0;
        for (i=0; i<5; i++) {
            contador = contador + matriz [i][j];
        }
        promedio = ((double)contador / 5);
        System.out.print ("El promedio del aspecto" + j + " es: " + promedio + "\n" );
    }
    in.close();   
   

    }
}