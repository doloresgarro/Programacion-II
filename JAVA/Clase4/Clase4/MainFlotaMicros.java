
/**
B- Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota con información 
leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta completar la flota). Luego lea una patente,
 busque si existe un micro con dicha patente y en ese caso elimínelo de la flota. Lea un destino e informe la patente 
 del micro que va a dicho destino y su hora de salida.
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class MainFlotaMicros
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        FlotaMicros f = new FlotaMicros ();
        
        f.Inicializar();
        
        String patente;
        String destino;
        int hora;
    
        System.out.println("Ingrese patente: ");
        patente = in.next();
        while ( !((patente.equals("ZZZ000"))) && (! (f.getLleno()) )) {
            System.out.println("Ingrese destino");
            destino = in.next();
            
            System.out.println("Ingrese hora");
            hora = in.nextInt();
            
            Micro m = new Micro (patente,destino,hora);
            
            f.agregarMicro(m);
            
            System.out.println("Ingrese patente");
            patente = in.next();
        }
        
        // Lea una patente, busque si existe un micro con dicha patente y en ese caso elimínelo de la flota.
        System.out.print("Ingrese patente a eliminar: ");
        String patenteBuscada = in.next();
        f.EliminarMicro(patenteBuscada);
        
        // Lea un destino e informe la patente del micro que va a dicho destino y su hora de salida.
        System.out.print("Ingrese destino a buscar: ");
        String destinoBuscado = in.next();
        if (f.BuscarDestino(destinoBuscado) != null)
            System.out.println("Patente del micro buscado: " + f.BuscarDestino(destinoBuscado).getPatente());
        else    
            System.out.println("No se encontró el destino");
        
        
        // Pruebo el buscar patente 
        System.out.print("Ingrese patente a buscar: ");
        String patenteBuscad = in.next();
        if ( f.BuscarPatente(patenteBuscad) != null )
            System.out.println("Patente del micro buscado: " + f.BuscarPatente(patenteBuscad).getPatente());
        else    
            System.out.println("No se encontró la patente");
        
        in.close();
    }
}    