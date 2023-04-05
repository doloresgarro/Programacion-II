/**
 * Existen diferentes tipos de vehículos:
-    Automotor, que también tiene asociado una patente, un importe adicional según el año de fabricación y una descripción.
-    Embarcación, que tiene asociado un código del Registro Especial de Yates (REY), nombre, un tipo de embarcación 
(lancha, crucero, velero, etc.), eslora (longitud de proa a popa), un tonelaje (peso) y un valor declarado de la embarcación.

La Agencia necesita calcular los costos de los impuestos de la siguiente manera:
-    De los automotores, el propietario paga mensualmente el importe básico más el adicional calculado según su año de
 fabricación.
-    De las embarcaciones, el propietario paga un monto semestral que varía según el valor declarado de la embarcación:
 valuadas hasta $6.000, pagan el 4% del su valor declarado; entre $6.000 y $180.000, pagan el 2% del valor declarado y, 
 finalmente superiores a $180.000 pagan el 5% de dicho valor declarado.

 * 
 */

public abstract class Vehiculo 
{
   private int año;
   private double importe;
   private Propietario propietario;
   
   public Vehiculo (int año, double importe, Propietario propietario) {
       this.año = año;
       this.importe = importe;
       this.propietario = propietario; 
   }
   
   public Vehiculo() {
       
   }
     
   
    public void setPropietario(Propietario propietario){
        this.propietario = propietario;
    }
    
    public void setAño(int año){
        this.año = año;
    }
    
    public void setImporte(double importe){
        this.importe = importe;
    }
    
    public int getAño(){
        return año;
    }
    
    public double getImporte(){
        return importe;
    }
    
    public Propietario getPropietario(){
        return propietario;
    }   
    
    public String toString(){
        String aux; 
        aux = "El nombre del propietario es " + propietario.getNombre();
        return aux;
    }
    
    
    abstract double calcularImpuesto();
}
