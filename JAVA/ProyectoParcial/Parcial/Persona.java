/**
 * la persona que realizó la solicitud, se conoce: nombre, apellido
y CUIT. Las solicitudes de subsidios pueden ser para gas natural o para energía eléctrica.
 */

public class Persona
{
    private String nombre;
    private String apellido; 
    private int CUIT;
    
    //  CONSTRUCTOR
    public Persona(String nombre, String apellido, int CUIT) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.CUIT = CUIT;
    }
    
    public Persona() {
        
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setNombre (String nombre) {
        this.nombre = nombre;
    }
    
    public String getApellido(){
        return apellido;
    }
    
    public void setApellido (String apellido) {
        this.apellido = apellido;
    }
    
    
    public int getCUIT(){
        return CUIT;
    }
    
    public void setCUIT (int CUIT) {
        this.CUIT = CUIT;
    }
}
