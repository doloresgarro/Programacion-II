/**
Escriba un programa que defina una matriz de enteros de tamaño 10x10. Inicialice la matriz con los primeros 100 números pares 
(ej: la pos. 0,0 contendrá 0; la pos. 0,1 contendrá 2; la pos. 0,2 contendrá 4; así siguiendo). 
Luego realice las siguientes operaciones: 
-    Mostrar el contenido de la matriz en consola. 
-    Calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
-    Generar un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i de la matriz.
-    Lea un valor entero e indique si se encuentra o no en la matriz. 
En caso de encontrarse indique su ubicación (fila y columna) en caso contrario imprima “No se encontró el elemento”.
 */

import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio6{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    // Declaramos matriz
    int [][] matriz;
    // Declaramos índices 
    int i = 10, j= 10; 
    // Creamos matriz
    matriz = new int [i][j];
    // Cargamos matriz
    int n =0;
    for (i = 0; i < 10; i++)
        for (j = 0; j < 10; j++) 
        {
            matriz[i][j] = n;
            n += 2;
        }
    
    for (i = 0; i < 10; i++) { 
        for (j = 0; j < 10; j++) 
        {
           System.out.print(matriz[i][j] + " ");
        } 
    System.out.print ("\n");
    
    }
        
        
        
    
    // Calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
    int contador1 = 0;
    for (i= 2; i < 10; i++)
        for (j = 0; j<10; j++)
        {
            contador1 = contador1 + matriz [i][j];
            
        }
    System.out.print ("La suma de todos los elementos entre las filas 2 y 9 es: " + contador1 + ("\n"));
    
    int contador2 = 0;
    for (i= 0; i < 10; i++)
        for (j = 0; j<4; j++)
        {
            contador2 = contador2 + matriz [i][j];
            
        }
    System.out.print ("La suma de todos los elementos entre las columnas 0 y 3 es: " + contador2 + ("\n"));
    
    //declaramos vector
    
    int [] vector;
    vector = new int [10];
    
    //declaramos indices
    
    // Generar un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i de la matriz.
    
    for (j = 0; j<9; j++){
        int contador3 = 0;
        for (i = 0; i<9; i++)
        {
            contador3 = contador3 + matriz [i][j];
    
            }
        vector [j] = contador3;
        System.out.print (vector [j] + (" - "));
        }
    
    System.out.print ("\n");
    
    //Lea un valor entero e indique si se encuentra o no en la matriz   
    System.out.print ("Ingrese un valor entero\n");
    int num = in.nextInt ();
    i = 0;
    j = 0;
    while ( (num != matriz [i][j]) && (i<9) )
        {
        j = 0;
        while ((num != matriz [i][j]) && (j<9)) {
            j++;
        }
        if (num != matriz [i][j])
            i++;
    }
    if (num == matriz[i][j]) {
        System.out.print ("Se encontro el elemento\n" );
        System.out.print ("La posicion es: columna: " + j + " y fila: " + i + "\n");
    }
    else 
        System.out.print ("No se encontro el elemento");
    
    in.close();   
    }
    }