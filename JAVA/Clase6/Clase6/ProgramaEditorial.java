/**
c)    Implementar la clase ProgramaEditorial, su método main y los métodos que considere necesarios para la lectura y 
almacenamiento de a lo sumo 1000 ejemplares. Luego, haga la impresión de un listado de todos los ejemplares existentes.
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class ProgramaEditorial
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        Ejemplar [] vector = new Ejemplar [1];
        
        for (int i = 0; i < 1; i++) {
            System.out.println("Ingrese ejemplar: ");
            String ejemplar = in.next();
            
            if (ejemplar.equals("libro"))
                LeerLibro (vector,i);
            else 
                if (ejemplar.equals("revista"))
                    LeerRevista(vector,i);
        }
        
        /**
         /** WHILE PARA INGRESAR EJEMPLARES-----------------------------------------
         * System.out.println(Desea ingresar un ejemplar? SI/NO)
         * String fin = in.next;
         * while (fin.equals("SI") && dimL<dimF) {
                 vector [dimL] = leerEjemplar ();
                 dimL++;
                 System.out.println(Desea ingresar un ejemplar? SI/NO)
                 fin = in.next();
            }
         * --------------------------------------------------------------------------------
         */
         
        
        for (int i = 0; i < 1; i++) {
            System.out.println ("INFO EJEMPLAR: " + vector[i].toString()); 
        }
        
        for (int i = 0; i < 1; i++) {
            System.out.println("Nombre modificado: " + vector[i].modificar() );
        }
        
        in.close();
    }
    
    public static Responsable LeerDatosResponsable () {
        Scanner in = new Scanner (System.in);       
        //--------------DATOS RESPONSABLE------------ 
        
        System.out.println("Ingrese DNI del responsable: ");
        int DNI = in.nextInt();
        
        System.out.println("Ingrese nombre y apellido del propietario: ");
        String nombreApellido = in.next();
        in.nextLine();
        
        Responsable r = new Responsable(nombreApellido, DNI); 
               
        return r;
    }
    
    public static void LeerLibro (Ejemplar [] vector, int i) {
        Scanner in = new Scanner (System.in);
        //--------------DATOS EJEMPLAR---------------
        System.out.println("Ingrese código: ");
        int codigo = in.nextInt();
        
        System.out.println("Ingrese cantidad de paginas: ");
        int cantPaginas = in.nextInt();
        
        System.out.println("Ingrese resumen: ");
        String resumen = in.next();
        in.nextLine();
        
        System.out.println("Ingrese año de publicación: ");
        int añoPublicacion = in.nextInt();
        
        //-------------- DATOS LIBRO -------------------
        System.out.println("Ingrese titulo: ");
        String titulo = in.next();
        
        System.out.println("Ingrese cantidad de capitulos: ");
        int cantCapitulos = in.nextInt();
        
        System.out.println("Ingrese si es o no edicion de bolsillo: ");
        boolean edicionDeBolsillo = in.nextBoolean();
        
        Responsable r ;
        r = LeerDatosResponsable(); 
                               
        vector [i] = new Libro(codigo, cantPaginas, resumen, añoPublicacion, r, titulo, cantCapitulos, edicionDeBolsillo);
    }
    
    public static void LeerRevista (Ejemplar [] vector, int i) {
        Scanner in = new Scanner (System.in);
        //--------------DATOS EJEMPLAR---------------
        System.out.println("Ingrese código: ");
        int codigo = in.nextInt();
        
        System.out.println("Ingrese cantidad de paginas: ");
        int cantPaginas = in.nextInt();
        
        System.out.println("Ingrese resumen: ");
        String resumen = in.next();
        in.nextLine();
        
        System.out.println("Ingrese año de publicación: ");
        int añoPublicacion = in.nextInt();
        
        System.out.println("Ingrese nombre de la revista: ");
        String nombreRevista = in.next();
        
        
        System.out.println("Ingrese cantidad de articulos: ");
        int cantArticulos = in.nextInt();
        
        //System.out.println("Busca num volumen ");
        //Generador g = new Generador();
        //int numVolumen = g.getNroVolumen();
        
        Responsable r = LeerDatosResponsable(); 
        
        vector [i] = new Revista(codigo, cantPaginas, resumen, añoPublicacion, r, nombreRevista, /*numVolumen*/ cantArticulos);
    }
}    






