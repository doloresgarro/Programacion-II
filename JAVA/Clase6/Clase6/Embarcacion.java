
/**
-    Embarcación, que tiene asociado un código del Registro Especial de Yates (REY), nombre, un tipo de embarcación 
(lancha, crucero, velero, etc.), eslora (longitud de proa a popa), un tonelaje (peso) y un valor declarado de la embarcación.

 */
public class Embarcacion extends Vehiculo
{
    private int REY;
    private String nombre;
    private String tipoE;
    private double eslora;
    private double tonelaje; 
    private int valor;
    
    public Embarcacion (int año, double importe, Propietario propietario, int REY, String nombre, String tipoE, double eslora, double tonelaje, int valor) {
        super(año, importe, propietario);
        this.REY = REY;
        this.nombre = nombre;
        this.tipoE = tipoE;
        this.eslora = eslora;
        this.tonelaje = tonelaje;
        this.valor = valor;   
    }
    
    public Embarcacion() {
        
    }
    
    public int getREY(){
        return REY;       
    }
  
    public void setREY(int REY){
        this.REY = REY;  
    }
    
    public String getNombre(){
        return nombre;       
    }
  
    public void setNombre(String nombre){
        this.nombre = nombre;  
    }
    
    public void setTipoE(String tipoE){
        this.tipoE = tipoE;  
    }
    
    public String getTipoE(){
        return tipoE;       
    }
  
    public double getEslora(){
        return eslora;       
    }
    
    public void setEslora(double eslora){
        this.eslora = eslora;  
    }
    
    public double getTonelaje(){
        return tonelaje;       
    }
  
    public void setTonelaje(double tonelaje){
        this.tonelaje = tonelaje;  
    }
    
    public int getValor(){
        return valor;       
    }
  
    public void setValor(int valor){
        this.valor = valor;  
    }
    
    public double calcularImpuesto() {
        double impuestos;
        if (super.getImporte() < 6000) 
            impuestos = (super.getImporte() * 4 / 100);
        else {
            if ((super.getImporte() > 6000) && (super.getImporte() > 180000))   
                impuestos = (super.getImporte() * 2 / 100);
            else 
                impuestos = (super.getImporte() * 5 / 100); 
            }
        return impuestos;
    }
    
    public String toString(){
        String aux; 
        aux =  super.toString() + ", el nombre de la embarcacion es: " + nombre;
        return aux;
    }
}    