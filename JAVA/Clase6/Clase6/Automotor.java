
/**
 * Automotor, que también tiene asociado una patente, un importe adicional según el año de fabricación y una descripción.
 */
public class Automotor extends Vehiculo{
     
    private String patente;
    private double importeAdicional;
    private String descripcion;
     
     public Automotor (int año, double importe, Propietario propietario, String patente, double importeAdicional, String descripcion) {
         super(año,importe,propietario);
         this.patente = patente;
         this.importeAdicional = importeAdicional;
         this.descripcion = descripcion;
     }
     
     public Automotor() {
         
     }
 
     public String getPatente(){
        return patente;       
    }
  
    public void setPatente(String patente){
        this.patente = patente;
    }
    
    public double getImporteAdicional(){
        return importeAdicional;       
    }
  
    public void setImporteAdicional(double importeAdicional){
        this.importeAdicional = importeAdicional;  
    }
    
    public String getDescricpion(){
        return descripcion;       
    }
  
    public void setDescricpion(String descricpion){
        this.descripcion = descricpion;  
    }
    
    
    //-    De los automotores, el propietario paga mensualmente el importe básico más el adicional calculado según su 
    // año de fabricación.    
    public double calcularImpuesto() {
        double impuestos = super.getImporte() + importeAdicional;
        return impuestos;
    }
    
    public String toString(){
        String aux; 
        aux =  super.toString() + ", la patente del automotor es: " + patente;
        return aux;
    }
  
}