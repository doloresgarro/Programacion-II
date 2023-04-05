
/**
     Para el responsable se registra su DNI, nombre y apellido. 
 */
public class Responsable
{
    private int DNI;
    private String nombreApellido; 
    
    //  CONSTRUCTOR
    public Responsable(String nombreApellido, int DNI) {
        this.nombreApellido = nombreApellido;
        this.DNI = DNI;
    }
    
    public Responsable() {
        
    }
    
    public String getNombreApellido(){
        return nombreApellido;
    }
    
    public void setNombreApellido (String nombreApellido) {
        this.nombreApellido = nombreApellido;
    }
    
    public int getDNI(){
        return DNI;
    }
    
    public void setDNI (int DNI) {
        this.DNI = DNI;
    }
}
