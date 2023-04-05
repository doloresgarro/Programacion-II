/**
Escriba un programa que imprima en consola el factorial de todos los números entre 1 y 9. 
¿Qué modificación debe hacer para imprimir el factorial de los números impares solamente? 
 */

import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio4{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    int i;
    for (i=1; i<=9; i++)
    {   if (i % 2 != 0)
        {
            int factorial = 1;
            int n = i;
            while (n != 0)  
            {
                factorial = factorial * n; 
                n--;
            }
            System.out.print("El factorial es: " + factorial +"\n");
    
        }
    }
    in.close();   
    }
    }