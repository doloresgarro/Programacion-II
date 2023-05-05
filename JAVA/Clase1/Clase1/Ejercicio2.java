/**
Escriba un programa para restringir la entrada de autos al centro de la ciudad: sólo pasarán aquellos con patente par. 
Para ello se leen números de patentes, por cada una debe informar en consola si el auto tiene o no permitido el paso. 
La lectura finaliza cuando se ingresa la patente 0. 
Al finalizar, informar el porcentaje de autos que ingresaron respecto al total de autos.  
 */


import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio2{
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    int contador = 0;
    int total = 0;
    
    System.out.print("Ingrese patente ");
    int patente = in.nextInt();
    while ( patente != 0) 
    {   
        total ++;
        if ((patente %  2) == 0)  
        {
            System.out.print ("El auto tiene permitido el paso\n");
            contador ++;
        }
        else 
            System.out.print ("El auto no tiene permitido el paso\n");
        
        System.out.println("Ingrese patente ");
        patente = in.nextInt();
        
    }
   
    double porcentaje = ( ((double) contador / total) * 100);
    
    System.out.print ("El porcentaje de autos que ingresaron respecto al total de autos es: " + porcentaje);
     
    in.close();   
   

    }
}
