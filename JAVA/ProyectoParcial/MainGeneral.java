
/**
 Main GENERAL
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class MainGeneral
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        //---------------------------------INGRESO DESDE TECLADO-------------------------------
        System.out.println("Ingrese INTEGER ");
        int NOMBREVARIABLE = in.nextInt();
        
        System.out.println("Ingrese DOUBLE");
        double NOMBREVARIABLE2 = in.nextDouble();
        
        System.out.println("Ingrese STRING (una palabra) ");
        String NOMBREVARIABLE3 = in.next();
        
        //ingresamos los datos que tengamos en comun en las dos subclases
        //ingresamos datos de las subclases
        
        //----------------------------------CREACION DE LAS SUBCLASES------------------------------
        /*** 
        Jugador j = new Jugador (nombreJ, DNIJ, edadJ ,sueldoBasico, partidos ,goles);
        Entrenador e = new Entrenador (nombreE, DNIE, edadE ,sueldoBasico,ganados);           */
        
        //----------------------------------Imprimimos datos de la subclase----------------------
        /**
        System.out.println ("INFO JUGADOR: " + j.toStringJugador());
        System.out.println ("INFO ENTRENADOR: " + e.toStringEntrenador());                    */
        
        //--------------------------------DECLARACIONES-----------------------------------------
        
        int [] vector = new int [15];
    
        
        //----------------------------------FUNCIONES EXTRAS--------------------------------------

        /*for*/
        for (int i=0; i<15; i++){ 
            //vector [i] = null;
        }
        /*while*/
        int i= 0;
        //con equals comparamos strings y con && == !=, el resto.
        while ( !(vector[i].getPatente().equals(patente)) && (i<cantMicros) )
        {
            i++;
        } 
        /*if*/
        if (vector [i].getPatente ().equals(patente))
            vector [i] = null;
        
        //---------------------------------------------------------------------------------------
        in.close(); /*cerrar teclado*/
        

        }
               
    }