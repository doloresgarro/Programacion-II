
/**
 * 3-A- Definir una clase para representar micros. Un micro se caracteriza por su patente, destino, hora salida, una cantidad de asientos
 * fija (20) para los que debe registrar su estado (es decir si está o no ocupado) y cantidad de asientos ocupados.  
 * El micro puede ocuparse total o parcialmente.
a)    Defina métodos getters/setters para patente, destino y hora de salida.
b)    Implemente un constructor que permita inicializar el micro creado con una patente,  un destino y una hora de salida 
(recibidas como parámetro) y sin pasajeros. 
c)    Implemente métodos para: 
i.    devolver la cantidad de asientos ocupados
ii.   devolver si el micro está lleno
iii.  validar un número de asiento recibido como parámetro
iv.   devolver el estado de un nro. de asiento válido recibido como parámetro
v.    ocupar un nro. de asiento válido recibido como parámetro
vi.   liberar un nro. de asiento válido recibido como parámetro
vii.  devolver el nro. del primer asiento libre

 */


public class Micro {
    private String patente;
    private String destino;
    private int hora;
    private boolean [] vector = new boolean [20];
    private int cantPasajeros;
    
    
    public Micro(){
     
    }
    
    public Micro(String patente, String destino, int hora){
        this.patente = patente;
        this.destino = destino;
        this.hora = hora;
        this.cantPasajeros = 0;
    }
    
    
    // Defina métodos getters/setters para patente, destino y hora de salida.
    
    //---------------------------------------------------
    public String getPatente() {
        return this.patente;
    }
    
    public void setPatente(String patente) {
        this.patente = patente;
    }

    //--------------------------------------------------
    public String getDestino() {
        return this.destino;
    }

     public void setDestino(String destino) {
        this.destino = destino;
    }
    
    //------------------------------------------------------
    public int getHora() {
        return this.hora;
    }
    
    public void setHora(int hora) {
        this.hora = hora;
    }

    //---------------------------------------
    
    public int getAsientosOcupados() {
        return cantPasajeros;
        
    }  
    
    //----------------------------------------------
    public void InicializarMicro() {
        for (int i = 0; i < 20; i++) {
            vector[i] = false;
        }       
    }
    
    //-----------------------------------------------
    public boolean getLleno() {
        boolean lleno = false;
        if (cantPasajeros == 20) 
            lleno = true;
        return lleno;
        }
    
    //---------------------------------------------------
    //iii.    validar un número de asiento recibido como parámetro 
     public boolean validar(int pos) {
        boolean valido = false;
        if ((pos >= 0) && (pos < 20))
             valido = true;
        return valido;
        }
      
    // iv. Devolver el estado de un nro. de asiento válido recibido como parámetro     
    public boolean ocupado(int pos) {
        boolean ok = false;
        if (validar(pos)) {
            if (vector[pos]) 
                 ok = true ;
                }
         return ok;
        }
    
    // v.  Ocupar un nro. de asiento válido recibido como parámetro     
     public void Ocupar (int pos) {
        if (validar(pos)){
            vector[pos] = true;    
            cantPasajeros ++;
        }
    }
    
    // vi.    liberar un nro. de asiento válido recibido como parámetro 
    public void Desocupar (int pos) {
        if (validar(pos)){
            vector[pos] = false;    
            cantPasajeros --;
        }
    }
    
    // vii.    devolver el nro. del primer asiento libre 
    public int PrimerAsientoLibre() {
        int i = 0;
        while (ocupado(i) && (i < 20)) {
            i ++; 
        }       
        if (i == 20)
            return -1;
        else
            return i;
    }    
}
    
        
    
