/**
Escriba un programa que imprima en consola el factorial de un número N (ingresado por teclado, N > 0).  
Ejemplo: para N=5 debería imprimir 5! = 120 
 */


import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio3{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    System.out.print("Ingrese un número: \n");
    int n = in.nextInt(); 
    int factorial = 1;

    while (n != 0)  
    {
        factorial = factorial * n; 
        n--;

    }
    System.out.print("El factorial es: " + factorial +"\n");
    in.close();   
    }
    
    
   

    }
