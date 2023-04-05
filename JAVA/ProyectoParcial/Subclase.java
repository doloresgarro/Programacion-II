
/**
 SUPERCLASE
 */

public class Subclase extends Superclase{
    
    //-------------------------VARIABLES DE LA SUBCLASE-----------------------------------
    private int ganados;
 
    // ----------------------------CONSTRUCTORES-----------------------------------------
    public Subclase(){
    } 
    
    public Subclase (String nombre, int DNI, int edad , double sueldoBasico, int ganados ){
        super(nombre,DNI,edad,sueldoBasico); //aca le mandamos los datos a la superclase
        this.ganados = ganados; //inicializamos las variables que son solo de esta subclase
    } 
    
    //-----------------------------GET Y SET------------------------------------------------
    public int getGanados(){
        return ganados;       
    }
  
    public void setGanados(int partidos){
        this.ganados= ganados;
    }
    
    //----------------------TO STRING (usamos el de la superclase y le agregamos datos)----------------------------------------
        public String toStringEntrenador(){
        String aux; 
        aux =  super.toString() + ", su sueldo " + calcularSueldo ();
        return aux;
    }
    
    //----------------------------CALCULAR SUELDO (implemento, es un abstract de la superclase)----------------------------------
    public double calcularSueldo(){
        double sueldo = 0; //declaramos variables internas al metodo
        double plus;
        /** 
        if ((ganados > 0) && (ganados < 5)) //alguna condicion
          sueldo = super.getSueldoBasico() + 5000; 
          */
       return (sueldo); //retornaar!!!
    }
    
}