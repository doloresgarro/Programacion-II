/**
 * Realice un programa ppal. que cree un micro con patente “ABC123”, destino “Mar del Plata” y hora de salida “5:00 am”.  
Cargue pasajeros en el micro de la siguiente manera: Leer nros. de asientos desde teclado que corresponden a pedidos de personas. 
La lectura finaliza cuando se ingresa el nro. de asiento -1 o cuando se llenó el micro.
 Para cada nro. de asiento leído debe: validar el nro; en caso que esté libre, 
 ocuparlo e informar a la persona el éxito de la operación; en caso que esté ocupado informar a la persona la situación 
 y mostrar el nro. del primer asiento libre.  
Al finalizar, informe la cantidad de asientos ocupados del micro.  
 */
import java.util.Scanner; // Importamos funcionalidad para la entrada 
public class MainMicros
{
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        
        String patente = "ABC123";
        String destino = "Mar del Plata";
        int hora = 5;
        Micro m = new Micro (patente,destino,hora);
        m.InicializarMicro();
        
        System.out.println("Ingrese numero de asiento: ");
        int num = in.nextInt();
        /*La lectura finaliza cuando se ingresa el nro. de asiento -1 o cuando se llenó el micro.
        Para cada nro. de asiento leído debe: validar el nro; en caso que esté libre, 
         ocuparlo e informar a la persona el éxito de la operación; en caso que esté ocupado informar a la persona la situación 
         y mostrar el nro. del primer asiento libre. 
          */
        while ( (num != -1) && (! m.getLleno() )) {
            
            if (m.validar(num)) {
                if (! m.ocupado(num)) {
                    m.Ocupar(num);
                    System.out.println("Se ocupó el asiento");
                }  
                else {
                    System.out.println("Asiento ocupado, elija otro asiento");             
                    System.out.println("El primer asiento libre es: "+ m.PrimerAsientoLibre());
                }             
            }  
            else 
                System.out.println("El asiento no es válido");
                
            System.out.println("Ingrese numero de asiento: ");
            num = in.nextInt();
        }
        
        System.out.println("La cantidad de asientos ocupados es: "+ m.getAsientosOcupados());
        
        in.close();
        
    }
}    
    