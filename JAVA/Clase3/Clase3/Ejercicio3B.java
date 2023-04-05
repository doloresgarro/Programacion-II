
/**
 * 
    B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos desde teclado. Pruebe el correcto
 funcionamiento de cada método implementado.
    
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio3B{
    
    public static void main (String[]args)
    { 
        Scanner in = new Scanner (System.in); // declaramos scanner
    
    
        System.out.print("Ingrese nombre: ");
        String nom = in.next();
        
        System.out.print("Ingrese sueldo básico: ");
        double sueldob = in.nextDouble();
    
        System.out.print("Ingrese cantidad de campeonatos ganados: ");
        int ganados = in.nextInt();
    
    
        Entrenador e = new Entrenador (nom,sueldob,ganados);
    
        System.out.println(e.toString());
        System.out.println ("El sueldo total es " + e.getCalcularSueldo());
        in.close ();

    }
}
