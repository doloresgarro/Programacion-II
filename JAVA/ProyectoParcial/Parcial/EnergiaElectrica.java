
/**
 * Para los subsidios de gas natural se registran los datos mencionados anteriormente,y así también el número de
medidor, el tamaño del hogar (en metros cuadrados) y cantidad de calefactores/estufas. Para los subsidios de energía
eléctrica se registran, además de los datos del subsidio, el NIS (Número de Identificación de Sumistro), y la cantidad de
electrodomésticos.
 */
public class EnergiaElectrica extends Solicitud{ 
    private int NIS;
    private int cantElectrodomesticos;

    public EnergiaElectrica() {
    }
    
    public EnergiaElectrica (String numGestion, int fecha, double ingresos, int integrantes, String region, Persona persona,int NIS, int cantElectrodomesticos){
        super(numGestion, fecha, ingresos, integrantes, region, persona);
        this.NIS = NIS;
        this.cantElectrodomesticos = cantElectrodomesticos;
    }
    
    public int getNIS(){
        return NIS;       
    }
  
    public void setNIS(int NIS){
        this.NIS = NIS;
    }
    
     public int getCantElectrodomesticos(){
        return cantElectrodomesticos;       
    }
  
    public void setCantElectrodomesticos(int cantElectrodomesticos){
        this.cantElectrodomesticos = cantElectrodomesticos;
    }
    
    /**
     *  - Si el ingreso mensual familiar declarado supera los 300 000 pesos se calcula a partir de hacer 500 pesos
    por cada electrodoméstico que exista en el hogar, en cambio si el ingreso está entre 300000 y 150000, se
    calcula a partir de 100 pesos por la mitad de los electrodomésticos existentes además del 2% del ingreso
    familiar, finalmente si los ingresos son inferiores a 150000 se calcula el 1,5% del ingreso mensual además
    de un monto fijo de 400 pesos por cada integrante del grupo familiar.
     */
    public double calcularSubsidio(){
       double subsidio;
       
       if (super.getIngresos() > 300000) 
           subsidio = (double) (500 * cantElectrodomesticos);
        else
            if ( (super.getIngresos() < 300000) && (super.getIngresos() > 150000) ) 
                subsidio = (double) ( (100 * (1/2 * cantElectrodomesticos) ) + (2 * super.getIngresos() / 100) ) ;
            else 
                subsidio = (( 3/2 * super.getIngresos() / 100) + (400 * super.getIntegrantes() ) );
        return subsidio; 
    }
    
    /**
        La posibilidad de acceder al subsidio en el caso de la energía eléctrica se da por la siguiente ecuación:
    el ingreso mensual familiar sobre la cantidad de integrantes no debe superar el 45% de dicho ingreso.
    Además de
    las condiciones previamente descritas, para ambos casos, se debe cumplir con los valores de ingresos
    nacionales base que maneja la Secretaría de Energía en los cuales asocia a una determinada región, un
    valor de ingresos que determina si el grupo familiar puede, o no, obtener el subsidio.
    
    Para saber si el grupo familiar puede acceder al subsidio en su región, se dispone de la clase
    TarifasNacionalesPorRegion, que posee un método puedeAccederAlSubsidio(ingreso, región) el cual recibe el
    ingreso mensual familiar y la región donde reside la familia (RESPETAR LOS NOMBRES DE LAS REGIONES
    COMO SE CITAN ANTERIORMENTE). Este mensaje devuelve verdadero si se les puede otorgar el subsidio o falso
    en caso contrario.
    
    Para aquellos casos en que los ingresos no les permitan acceder al subsidio tanto para gas
    natural como para energía eléctrica, la tarifa plena se basa en un 5% del ingreso mensual familiar
    declarado.
    
    */
    public boolean accesoSubsidio(){
       boolean acceso = false;
       if ( (super.getIngresos() / super.getIntegrantes() ) < (45 * super.getIngresos() / 100) )
           acceso= TarifasNacionalesPorRegion.puedeAccederAlSubsidio(super.getIngresos(), super.getRegion());    
       return acceso; 
    }    
   
    /**
     * Implemente los métodos necesarios para que la Secretaría de Energía pueda ver un listado con toda la
    información detallada de los subsidios, incluyendo aquellas solicitudes que fueron denegadas (el listado debe
    discriminar si la persona obtuvo el subsidio o no) y en todos los casos debe mostrar el valor final de la tarifa
    (con subsidio o sin el mismo).
     */    
    //-----------------------------------------------------------------------
    public String toString(){
        String aux; 
        if (accesoSubsidio())
            aux = "Accede al subsidio y este es de: " + calcularSubsidio(); 
        else 
            aux = "No accede al subsidio, por lo tanto la tarifa basica es de: " + super.getTarifaBasica();
        return aux;
    }
    
    
    
}
