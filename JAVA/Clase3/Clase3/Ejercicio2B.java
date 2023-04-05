
/**
 -
B - Genere un programa principal que cree una balanza e inicie una compra. Lea información desde teclado correspondiente 
a los ítems comprados (peso en kg y precio por kg)  hasta que se ingresa uno con peso 0.  Registre cada producto en la balanza.
Al finalizar, informe el resumen de la compra. 


 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class Ejercicio2B
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
          
        
        Balanza b = new Balanza();
        
        System.out.println("Inicie compra ");
        b.IniciarCompra();
        
        System.out.println ("Ingrese peso");
        double peso = in.nextDouble ();
        System.out.println ("Ingrese precio x kilo");
        double precio = in.nextDouble ();
        
        while (peso != 0) {
            b.registrarProducto(peso,precio); 
            System.out.println ("Ingrese peso");
            peso = in.nextDouble ();
            System.out.println ("Ingrese precio x kilo");
            precio = in.nextDouble ();
        }
        
        System.out.println("RESUMEN DE COMPRA: " +b.devolverResumenDeCompra());
        
        in.close();
        
    
    }
        
        
    }
