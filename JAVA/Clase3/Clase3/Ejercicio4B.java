
import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio4B{
    
    public static void main (String[]args)
    { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    Jugador [] vector;
    vector = new Jugador [3];
    
    for (int i=0; i<3; i++) {
        
        System.out.print("Ingrese solo su nombre: ");
        String miNombre = in.next();
        
        System.out.print("Ingrese edad: ");
        int miEdad = in.nextInt();
    
        System.out.print("Ingrese su DNI: ");
        int miDni = in.nextInt();
    
        System.out.print("Ingrese numero de partidos jugados: ");
        int jugados = in.nextInt ();        
        
        System.out.print ("Ingrese goles anotados");
        int goles = in.nextInt ();
        
        vector [i] = new Jugador (miNombre,miDni,miEdad, jugados, goles);
    
        
    }
    
        int cont = Contador(vector);
    
        System.out.println ("La cantidad de jugadores con más de 100 partidos jugados es: " + cont ); 
    
        in.close ();

    } 
    
      public static int Contador (Jugador [] vector) {
        int contador = 0; 
        int i;
        for (i = 0; i < 3; i++){
            if (vector [i].getPartidos() > 100)
                 contador ++;
                }
        return contador;
    }
}