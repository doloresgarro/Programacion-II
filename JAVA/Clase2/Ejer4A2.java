/**
 * Se dispone de la clase Partido (descargar de moodle). Un objeto partido representa un encuentro entre dos equipos
 * (local y visitante). Un objeto partido puede crearse sin valores iniciales y agregando luego el nombre del equipo local,
 * el nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto partido sabe responder 
 * a los siguientes mensajes:
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejer4A2{
    
    public static void main (String[]args)
    { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    
    
    //) Implemente un programa que cargue un vector con los 325 partidos disputados en la superliga 2018/2019.  
    Partido [] vector;
    vector = new Partido [3];
    
    int i;
    for (i = 0; i < 3; i++)
     {
        System.out.print("Ingrese local: ");
        String local = in.next();   
    
        System.out.print("Ingrese visitante: ");
        String visitante = in.next();  
    
        System.out.print("Ingrese goles local: ");
        int golesLocal = in.nextInt();  
    
        System.out.print("Ingrese goles visitante: ");
        int golesVisitante = in.nextInt();  
    
        vector [i] = new Partido (local,visitante,golesLocal,golesVisitante); 
    
    }
    
   for (i = 0; i < 3; i++)
        System.out.println(vector [i].toString());
    
    /*
     * Luego de la carga realizar los métodos que considere necesarios para informar:
    b) La cantidad de partidos que ganó River.
    c) El total de goles que realizó Boca jugando de local.
    d) El porcentaje de partidos finalizados con empate. 


     */
    System.out.println("La cantidad de partidos que ganó River es: " + River(vector) );
    
    System.out.println("La cantidad de goles de local que hizo Boca es: " + Boca(vector) );
    
    System.out.println("El porcentaje de empates es: " + Empate(vector) );
    in.close ();

    }
    
    public static int River (Partido [] vector) {
        int contador = 0; 
        int i;
        for (i = 0; i < 3; i++){
            if (vector [i].getGanador().equals("River"))
                 contador ++;
        }
        return contador;
    }
    
    
     public static int Boca (Partido [] vector) {
        int contador = 0; 
        int i;
        for (i = 0; i < 3; i++){
            if (vector [i].getLocal().equals("Boca"))
                 contador = contador + vector [i].getGolesLocal();
                }
        return contador;
    }
    
     public static double Empate (Partido [] vector) {
        int contador = 0; 
        int i;
        for (i = 0; i < 3; i++){
            if (vector [i].hayEmpate())
                 contador ++;
                }
 
        // double porcentaje = ((double)((contador / 3) * 100));
        return (contador * 100) / 3;
    }
    
}