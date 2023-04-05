
/**
    SUPERCLASE
 */
public abstract class Superclase {
    
    //--------------------------DECLARACION DE VARIABLES-----------------------------------------
    private String nombre;
    private int DNI;
    private double sueldoBasico;

    //-------------------------------CONSTRUCTORES-----------------------------------------------
    public Superclase(){
    }
    
    public Superclase (String nombre, int DNI, int edad, double SueldoBasico){
        this.setNombre(nombre);
        // o tambien....
        this.DNI= DNI;
        //etc, etc.
    }
    
    //--------------------------------GET Y SET----------------------------------------------------------
    public String getNombre(){
        return nombre;       
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;       
    }
    
    //-------------------------------TO STRING------------------------------------------------------------
    public String toString(){
        String aux; 
        aux = "El nombre del empleado es " + nombre;
        return aux;
    }
    
    //-------------------------------ABSTRACT (no se implementa)--------------------------------------------
    abstract double calcularSueldo();

}