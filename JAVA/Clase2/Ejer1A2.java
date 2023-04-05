import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejer1A2{
    
    public static void main (String[]args)
    { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    
    System.out.print("Ingrese edad: ");
    int miEdad = in.nextInt();
        
    System.out.print("Ingrese su DNI: ");
    int miDni = in.nextInt();
    
    System.out.print("Ingrese solo su nombre: ");
    String miNombre = in.next();
    
    Persona p= new Persona (miNombre,miDni,miEdad);
    
    System.out.println(p.toString());
    
    in.close ();

    }
}

