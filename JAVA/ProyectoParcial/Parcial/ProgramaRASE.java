
/**
 * Implemente la clase ProgramaRASE, su método main y los métodos que considere necesarios para leer y
cargar un vector con 5 solicitudes de subsidios (incluya solicitudes de gas, de energía y solicitudes que no
cumplan con los requisitos para acceder al subsidio) para, finalmente, mostrar el listado mencionado en c)
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class ProgramaRASE
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        Solicitud [] vector = new Solicitud [5];
        
        for (int i = 0; i < 4; i++) {
            System.out.println("Ingrese solicitud (gasNatural/energiaElectrica) : ");
            String solicitud = in.next();
            
            if (solicitud.equals("gasNatural"))
                LeerGasNatural(vector,i);
            else 
                if (solicitud.equals("energiaElectrica"))
                    LeerEnergiaElectrica(vector,i);
        }
         
        
        for (int i = 0; i < 4; i++) {
            System.out.println ("INFO SUBSIDIO: " + vector[i].toString()); 
        }
        
        in.close();
    }
    
    public static Persona LeerPersona() {
        Scanner in = new Scanner (System.in);       
        //--------------DATOS PERSONA ------------ 
        // String nombre, String apellido, int CUIT
        System.out.println("Ingrese nombre de la persona: ");
        String nombre= in.next();
        
        System.out.println("Ingrese apellido de la persona: ");
        String apellido = in.next();
        
        System.out.println("Ingrese CUIT del responsable: ");
        int CUIT = in.nextInt();
        
        
        Persona p = new Persona(nombre, apellido, CUIT); 
               
        return p;
    }
    
    public static void LeerGasNatural (Solicitud [] vector, int i) {
        Scanner in = new Scanner (System.in);
        //--------------DATOS GAS NATURAL---------------
        // String numGestion, int fecha, double ingresos, int integrantes, String region, Persona persona, 
        //int numMedidor, int metrosCuadrados, int cantEstufas)
        
        System.out.println("Ingrese num de gestion ");
        String num = in.next();
        
        System.out.println("Ingrese fecha: ");
        int fecha = in.nextInt();
        
        System.out.println("Ingrese ingresos: ");
        int ingresos = in.nextInt();
        
        System.out.println("Ingrese integrantes: ");
        int integrantes = in.nextInt();
        
        System.out.println("Ingrese region: ");
        String region = in.next();
        
        Persona p = LeerPersona();
        
        //-------------------------------------------------
        // int numMedidor, int metrosCuadrados, int cantEstufas)
        
        System.out.println("Ingrese numero medidor ");
        int numMedidor = in.nextInt();
        
        System.out.println("Ingrese metros cuadrados: ");
        int metrosCuadrados = in.nextInt();

        System.out.println("Ingrese cantidad de estufas ");
        int cantEstufas = in.nextInt();
        
                               
        vector [i] = new GasNatural(num, fecha, ingresos, integrantes, region, p, numMedidor, metrosCuadrados, cantEstufas);
    }
    
        public static void LeerEnergiaElectrica (Solicitud [] vector, int i) {
        Scanner in = new Scanner (System.in);
        //--------------DATOS ENERGIA ELECTRICA---------------
        // String numGestion, int fecha, double ingresos, int integrantes, String region, Persona persona, 
        //int numMedidor, int metrosCuadrados, int cantEstufas)
        
        System.out.println("Ingrese num de gestion ");
        String num = in.next();
        
        System.out.println("Ingrese fecha: ");
        int fecha = in.nextInt();
        
        System.out.println("Ingrese ingresos: ");
        int ingresos = in.nextInt();
        
        System.out.println("Ingrese integrantes: ");
        int integrantes = in.nextInt();
        
        System.out.println("Ingrese region: ");
        String region = in.next();
        
        Persona p = LeerPersona();
        
        //-------------------------------------------------
        // private int NIS;
        //private int cantElectrodomesticos;

        
        System.out.println("Ingrese NIS");
        int NIS = in.nextInt();
        
        System.out.println("Ingrese cant electrodomesticos ");
        int cantElectrodomesticos = in.nextInt();
     
        vector [i] = new EnergiaElectrica(num, fecha, ingresos, integrantes, region, p, NIS, cantElectrodomesticos);
    }
}

