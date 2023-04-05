
/**
E) Escriba un programa principal que instancie un jugador y un entrenador con datos leídos desde teclado.
 Pruebe el correcto funcionamiento de cada método implementado. 
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class MainEmpleados
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        // Sueldo básico común
        System.out.println("Ingrese sueldo básico de empleados: ");
        double sueldoBasico = in.nextDouble();
        
        // Datos jugador 
        System.out.println("Ingrese nombre del jugador:");
        String nombreJ = in.next();
        System.out.println("Ingrese DNI del jugador: ");
        int DNIJ = in.nextInt();
        System.out.println("Ingrese edad del jugador: ");
        int edadJ = in.nextInt();
        System.out.println("Ingrese cantidad de partidos jugados: ");
        int partidos = in.nextInt();
        System.out.println("Ingrese goles anotados del jugador");
        int goles = in.nextInt();
    
        Jugador j = new Jugador (nombreJ, DNIJ, edadJ, sueldoBasico, partidos, goles);
        System.out.println("Información del jugador: "+ j.toString());
        
        
        // Datos entrenador      
        System.out.println("Ingrese nombre del entrenador:");
        String nombreE = in.next();
        System.out.println("Ingrese DNI del entrenador: ");
        int DNIE = in.nextInt();
        System.out.println("Ingrese edad del entrenador: ");
        int edadE = in.nextInt();
        System.out.println("Ingrese cantidad de campeonatos ganados: ");
        int campeonatos = in.nextInt();
    
        Entrenador e = new Entrenador (nombreE, DNIE, edadE, sueldoBasico, campeonatos);       
        System.out.println("Información del entrenador: " + e.toString());
        
        // NO ES NECESARIO EL TO.STRING()!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //System.out.println("El nombre " + j.getNombre + "cobra " + j.calcularSueldo());
        
        in.close();
        
    }
}    
    
