/**
 * Para los subsidios de gas natural se registran los datos mencionados anteriormente,y así también el número de
medidor, el tamaño del hogar (en metros cuadrados) y cantidad de calefactores/estufas. Para los subsidios de energía
eléctrica se registran, además de los datos del subsidio, el NIS (Número de Identificación de Sumistro), y la cantidad de
electrodomésticos.
 */
public class GasNatural extends Solicitud{ 
    private int numMedidor;
    private int metrosCuadrados;
    private int cantEstufas;

    public GasNatural() {
    }
    
    public GasNatural (String numGestion, int fecha, double ingresos, int integrantes, String region, Persona persona, int numMedidor, int metrosCuadrados, int cantEstufas){
        super(numGestion, fecha, ingresos, integrantes, region, persona);
        this.numMedidor = numMedidor;
        this.metrosCuadrados = metrosCuadrados;
        this.cantEstufas = cantEstufas;
    }
    
    public int getNumMedidor(){
        return numMedidor;       
    }
  
    public void setNumMedidor(int numMedidor){
        this.numMedidor = numMedidor;
    }
    
    public int getMetrosCuadrados(){
        return metrosCuadrados;       
    }
  
    public void setMetrosCuadrados(int metrosCuadrados){
        this.metrosCuadrados = metrosCuadrados;
    }
    
    public int getCantEstufas(){
        return cantEstufas;       
    }
  
    public void setCantEstufas(int cantEstufas){
        this.cantEstufas = cantEstufas;
    }
    
    //-----------------------------------------------------------------------
    /*
     * Si el ingreso mensual familiar declarado supera los 300000 pesos se calcula a partir de hacer el producto
    entre 250 pesos y la mitad de metros cuadrados de la propiedad sumado a 750 pesos por cada
    calefactor/estufa, en cambio si el ingreso está entre 300000 y 150000, se calcula 100 pesos por un tercio
   de los metros cuadrados más 500 pesos por cada calefactor/estufa, finalmente si los ingresos son
   inferiores a 150000 se calcula el 2% del ingreso mensual y un monto fijo de 1000 pesos. 
     */
   public double calcularSubsidio(){
       double subsidio;
       
       if (super.getIngresos() > 300000) 
           subsidio = (double)( ( 250 * (1/2 * metrosCuadrados)) + (750 * cantEstufas) ) ;
        else
            if ( (super.getIngresos() < 300000) && (super.getIngresos() > 150000) ) 
                subsidio = (double) ( (100 * (1/3 * metrosCuadrados)) + (750 * cantEstufas) ) ;
            else 
                subsidio = (( 2 * super.getIngresos() / 100) + 1000);
        return subsidio; 
    }
    
   /**
    * Por su parte, para acceder al subsidio del gas natural, el ingreso mensual familiar sobre la cantidad de
    integrantes junto a la cantidad de calefactores/estufas, no debe superar el 40% del ingreso. Además de
    las condiciones previamente descritas, para ambos casos, se debe cumplir con los valores de ingresos
    nacionales base que maneja la Secretaría de Energía en los cuales asocia a una determinada región, un
    valor de ingresos que determina si el grupo familiar puede, o no, obtener el subsidio.
    */ 
    public boolean accesoSubsidio(){
       boolean acceso = false;
       if ( ( ( super.getIngresos() / super.getIntegrantes() ) + cantEstufas) < (40 * super.getIngresos() / 100) )
           acceso= TarifasNacionalesPorRegion.puedeAccederAlSubsidio(super.getIngresos(), super.getRegion());        
       return acceso; 
    }    
    
    
    /**
     * Implemente los métodos necesarios para que la Secretaría de Energía pueda ver un listado con toda la
    información detallada de los subsidios, incluyendo aquellas solicitudes que fueron denegadas (el listado debe
discriminar si la persona obtuvo el subsidio o no) y en todos los casos debe mostrar el valor final de la tarifa
(con subsidio o sin el mismo).
     */
   public String toString(){
        String aux; 
        if (accesoSubsidio())
            aux = "Accede al subsidio y este es de: " + calcularSubsidio(); 
        else 
            aux = "No accede al subsidio, por lo tanto la tarifa basica es de: " + super.getTarifaBasica();
        return aux;
    }
     
}
