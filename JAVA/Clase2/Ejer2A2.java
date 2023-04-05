

import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejer2A2{
    
    public static void main (String[]args)
    { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    //a) Realice un programa que almacene en un vector 15 personas. La información de cada persona debe leerse de teclado.  
    Persona [] vector;
    vector = new Persona [3];
    int i;
    for (i = 0; i < 3; i++)
    {
        System.out.print("Ingrese edad: ");
        int miEdad = in.nextInt();
    
        System.out.print("Ingrese su DNI: ");
        int miDni = in.nextInt();
    
        System.out.print("Ingrese solo su nombre: ");
        String miNombre = in.next();
        
        vector [i] = new Persona (miNombre,miDni,miEdad);
    }
    
    //Persona p= new Persona (miNombre,miDni,miEdad);
    for (i = 0; i < 3; i++)
        System.out.println(vector [i].toString());
    
    // b) Agregue un método que devuelva la cantidad de personas mayores de 65 años. 
        int cont = Contador(vector);
    
        System.out.println ("La cantidad de personas mayores a 65 es: " + cont );       
    
    
    //c) Agregue un método que devuelva la representación de la persona con menor DNI 
    
     System.out.println("Persona con menor numero de documento: " );
     System.out.println(MenorDNI(vector).toString()); 
            
     in.close ();       
            
    }
    
    
    public static Persona MenorDNI (Persona [] vector)
    {
        int min = 99999;
        int i;
        int pos = 0;
        for (i = 0; i < 3; i++) {
            if (vector [i].getDNI() < min){
                min = vector [i].getDNI();
                pos = i;
            } 
            }
        return vector[pos];
    }
    
    public static int Contador (Persona [] vector) {
        int contador = 0; 
        int i;
        for (i = 0; i < 3; i++){
            if (vector [i].getEdad() > 65)
                 contador ++;
                }
        return contador;
    }
    
}

