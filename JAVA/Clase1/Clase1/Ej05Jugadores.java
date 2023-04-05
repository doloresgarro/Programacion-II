
/**
Escriba un programa que lea las alturas de los 15 jugadores de un equipo de básquet y las almacene en un vector.  Luego informe: 
-	la altura promedio
-	la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej05Jugadores.java

 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class Ej05Jugadores
{
    /**
     * Método main
     */
    public static void main(String[] args)
    {
        //Paso 1: Declarar la variable vector de alturas
        int [] vector;
        
        //Paso 2: Declarar indice y promedio (iniciarlo)
        int i = 15;
        double promedio = 0;
        
        //Paso 3: Declarar y crear el scanner
        Scanner in = new Scanner (System.in); // declaramos scanner
        
        //Paso 4: Crear el vector para 15 valores
        vector = new int [i];
        
        //Paso 5: Ingresar 15 numeros, cargarlos en el vector, ir calculando la suma
        int contador = 0;
        for (i = 0; i<= 14; i++)
        {
            System.out.print("Ingrese número: \n");
            int n = in.nextInt();
            contador = contador + n;
            vector[i]= n; 
        }    
        
        //Paso 6: Calcular el promedio
        promedio = ((double) contador / 15);
        System.out.print("El promedio es: "+ promedio +"\n");
        
        //Paso 7: Recorrer el vector, contar los números que son mayores que el promedio
        int mayores = 0;
        for (i = 0; i<= 14; i++) 
        { 
         if (vector [i] > promedio)   
             mayores ++;
        }
        System.out.print("La cantidad de numeros que son mayores que el promedio son: "+ mayores +"\n");
        
    }
}