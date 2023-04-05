/**}
 *La Secretaría de Energía del Ministerio de Economía de la Nación necesita gestionar las solicitudes de subsidios a las
tarifas de los hogares de cada región del país, para ello utilizó el Registro de Acceso a los Subsidios a la Energía (RASE).
De cada solicitud se conoce: número de gestión (alfanumérico), fecha que se gestionó la solicitud, ingresos mensuales
declarados, cantidad de integrantes del grupo familiar, región (Patagonia, PampaHúmeda, PampaSeca, Cuyo,
SierrasPampeanas, NOA, Chaqueña, Mesopotamia) y de la persona que realizó la solicitud, se conoce: nombre, apellido
y CUIT. Las solicitudes de subsidios pueden ser para gas natural o para energía eléctrica.
 */

public abstract class Solicitud
{
    private String numGestion;
    private int fecha;
    private double ingresos;
    private int integrantes; 
    private String region;
    private Persona persona; 
    
    
    
    public Solicitud(){
    }
    
    public Solicitud(String numGestion, int fecha, double ingresos, int integrantes, String region, Persona persona){
        this.numGestion = numGestion;
        this.fecha = fecha;
        this.ingresos = ingresos;
        this.integrantes = integrantes;
        this.region = region;
        this.persona = persona;
    }
    
    
    public String getNumGestion(){
        return numGestion;       
    }
    
    public void setNumGestion(String numGestion){
        this.numGestion = numGestion;       
    }
    
    public int getFecha(){  
        return fecha;       
    }
    
    public void setFecha(int fecha){  
        this.fecha = fecha; 
    }
    
    public double getIngresos(){
        return ingresos;       
    }
    
    public void setIngresos(double ingresos){
        this.ingresos = ingresos;       
    }
     
    public int getIntegrantes() {
        return integrantes;
    }
   
    public void setIntegrantes(int integrantes) {
        this.integrantes = integrantes;
    }
    
    public String getRegion(){
        return region;       
    }
    
    public void setRegion(String region){
        this.region = region;       
    }
    
    public Persona getPersona() {
        return persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }    
    
    /**
     *  Para aquellos casos en que los ingresos no les permitan acceder al subsidio tanto para gas
    natural como para energía eléctrica, la tarifa plena se basa en un 5% del ingreso mensual familiar
    declarado.
     */
    public double getTarifaBasica() {
        double tarifaB = 5 * ingresos / 100;
        return tarifaB;
    }
    
    
    
    abstract double calcularSubsidio();
    abstract boolean accesoSubsidio();
    
    
    
    
}

