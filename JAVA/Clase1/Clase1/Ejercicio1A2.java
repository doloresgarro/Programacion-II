/**
Escriba un programa que lea desde teclado 3 valores double. Determine si a partir de ellos se forma un triángulo válido y 
en ese caso muestre en consola el perímetro del mismo. 
NOTA: Un triángulo es válido si se cumplen las siguientes tres condiciones: 
(a < b + c) ,  (b < a + c), (c < a + b), donde a,b,c son los lados.  

 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio1A2{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    
    System.out.print("Ingrese valor a: ");
    int a = in.nextInt();
        
    System.out.print("Ingrese valor b: ");
    int b = in.nextInt();
    
    System.out.print("Ingrese valor c: ");
    int c = in.nextInt();
    
    if ( (a < b + c) &&  (b < a + c) && (c < a + b) ) 
     {  int perimetro = a + b + c; 
        System.out.print("El perímetro es: " + perimetro);
    }
    else
        System.out.print("El triángulo no es válido");
    

    }
}
