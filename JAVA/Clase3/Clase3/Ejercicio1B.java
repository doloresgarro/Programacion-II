/**
 - Realizar un programa principal que instancie un triángulo, le cargue información leída desde teclado
   e informe en consola el perímetro y el área. 


 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class Ejercicio1B
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
          
        System.out.print("Ingrese primer lado: ");
        double lado1 = in.nextDouble();
        
        System.out.print("Ingrese segundo lado: ");
        double lado2 = in.nextDouble();
        
        System.out.print("Ingrese tercer lado: ");
        double lado3 = in.nextDouble();
        
        System.out.print("Ingrese color de relleno: ");
        String relleno = in.next();
        
        System.out.print("Ingrese color de linea: ");
        String linea = in.next();
        
        in.close();
        
        Triangulo t = new Triangulo (lado1,lado2,lado3,relleno,linea);
        
        System.out.println("El área es: "+ t.getCalcularArea());
        System.out.println("El perímetro es: "+ t.getCalcularPerimetro());
        
    }
}
