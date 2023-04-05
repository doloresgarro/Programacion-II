
/**
    Cree la clase ProgramaArba, su método main y los métodos que considere necesarios para la lectura y almacenamiento de 
    10000 vehículos. Luego, realice el cálculo del monto a pagar por el impuesto para cada uno de ellos.
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class ProgramaArba
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        
        Vehiculo [] vector = new Vehiculo [3];
        
        for (int i = 0; i < 3; i++) {
            System.out.println("Ingrese vehiculo: ");
            String vehiculo = in.next();
            
            if (vehiculo.equals("automotor"))
                LeerAutomotor (vector,i);
            else 
                if (vehiculo.equals("embarcacion"))
                    LeerEmbarcacion(vector,i);
        }
        
        for (int i = 0; i < 3; i++) {
            System.out.println ("INFO VEHICULO: " + vector[i].toString()); 
        }
        
        for (int i = 0; i < 3; i++) {
            System.out.println("El impuesto a pagar de es de: " + vector[i].calcularImpuesto() );
        }
        
        
        
        in.close();
    }
    
    public static void LeerAutomotor (Vehiculo [] vector, int i) {
        Scanner in = new Scanner (System.in);
        //--------------DATOS VEHICULO---------------
        System.out.println("Ingrese año: ");
        int año = in.nextInt();
        
        System.out.println("Ingrese importe: ");
        double importe = in.nextDouble();
        
        //--------------DATOS PROPIETARIO------------       
        System.out.println("Ingrese CIT del propietario: ");
        int CIT = in.nextInt();
        System.out.println("Ingrese nombre del propietario: ");
        String nombre = in.next();
        System.out.println("Ingrese apellido del propietario: ");
        String apellido = in.next();
        
        Propietario p = new Propietario(nombre, apellido, CIT); 
        
        
        //--------------DATOS AUTOMOTOR-------------
        System.out.println("Ingrese patente: ");
        String patente = in.next();
        
        System.out.println("Ingrese importe adicional: ");
        double importeAdicional = in.nextDouble();
        
        System.out.println("Ingrese descripción: ");
        String descripcion = in.next();
        
        Automotor a = new Automotor(año, importe, p, patente, importeAdicional, descripcion);
        vector [i] = a;
    }
        
    
    public static void LeerEmbarcacion (Vehiculo [] vector, int i ) {
        Scanner in = new Scanner (System.in);
        
        System.out.println("Ingrese año: ");
        int año2 = in.nextInt();
        
        System.out.println("Ingrese importe: ");
        double importe2 = in.nextDouble();
        
        // DATOS PROPIETARIO 2
        
        //--------------DATOS PROPIETARIO------------       
        System.out.println("Ingrese CIT del propietario: ");
        int CIT2 = in.nextInt();
        System.out.println("Ingrese nombre del propietario: ");
        String nombre2 = in.next();
        System.out.println("Ingrese apellido del propietario: ");
        String apellido2 = in.next();
        
        Propietario p2 = new Propietario(nombre2, apellido2, CIT2);  
        
        //--------------DATOS EMBARCACIÓN-----------
        System.out.println("Ingrese REY (integer): ");
        int REY = in.nextInt();
        
        System.out.println("Ingrese nombre de la embarcación: ");
        String nombreEmbarcacion = in.next();
        
        System.out.println("Ingrese tipo de la embarcación: (lancha, crucero, velero, etc.)");
        String tipoEmbarcacion = in.next();
        
        System.out.println("Ingrese eslora (real): ");
        double eslora = in.nextDouble();

        System.out.println("Ingrese tonelaje (real): ");
        double tonelaje = in.nextDouble();
        
        System.out.println("Ingrese valor (integer): ");
        int valor = in.nextInt();
        
        Embarcacion e = new Embarcacion(año2, importe2, p2, REY, nombreEmbarcacion, tipoEmbarcacion, eslora, tonelaje, valor);
        vector [i] = e;
    }
}    