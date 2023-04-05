
/**
4-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por conocer a los micros que la componen
 (a lo sumo 15). 
i.    Defina un constructor para crear una flota vacía (sin micros)

Implemente métodos para:
ii.    devolver si la flota está completa (tiene 15 micros) o no.
iii.    agregar a la flota un micro recibido como parámetro.
iv.    eliminar de la flota el micro con patente igual a una recibida como parámetro.
v.    buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo 
        (en caso de no existir dicho micro, retornar NULL). 
vi.    buscar en la flota un micro con destino igual a uno recibido como parámetro y retornarlo 
        (en caso de no existir dicho micro, retornar NULL). 

*/

public class FlotaMicros {
    private Micro [] vector = new Micro [15];
    private int cantMicros;
    // Constructor vacío;
    public FlotaMicros(){
     
    }
    
    
    public void Inicializar() {
        for (int i = 0; i < 15; i++)
            vector[i] = null;
        cantMicros = 0;
    }
    
    // iii.    agregar a la flota un micro recibido como parámetro
    public void agregarMicro (Micro m) {
        vector [cantMicros] = m;
        cantMicros ++;
    }

    //ii.    devolver si la flota está completa (tiene 15 micros) o no.
    public boolean getLleno() {
        boolean lleno = false;
        if (cantMicros == 15)
            lleno = true;
        return lleno;
    }
    
    // iv.    eliminar de la flota el micro con patente igual a una recibida como parámetro.
    public void EliminarMicro(String patente) { // PREGUNTAR QUE PASA SI NOS PIDEN ELIMINAR MAS MICROS
        int i = 0;
        while (! (vector[i].getPatente().equals(patente)) && (i < 15)) {
            i++; 
        }
        if (vector[i].getPatente().equals(patente)) 
            vector[i] = null;         
    }
    
  
    // v. Buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo 
    //    (en caso de no existir dicho micro, retornar NULL). 
    public Micro BuscarPatente(String patente) {
        int i = 0;
        boolean encontre = false;
         while   ((i < 15) && (! encontre) ){
            if ( (vector[i] != null) && (vector[i].getPatente().equals(patente)))
            {
                encontre = true; }
            else {
                i++;
            }
        }
        if (i == 15)
            return null;
        else 
            return vector [i];
    }


    // buscar en la flota un micro con destino igual a uno recibido como parámetro y retornarlo 
    // (en caso de no existir dicho micro, retornar NULL). 
    public Micro BuscarDestino(String destino) {
        int i = 0;
        boolean encontre = false; 
        while ( (i < 15) && (! encontre) ){
            if ( (vector[i] != null) && (vector[i].getDestino().equals(destino)))
                encontre = true;   
            else 
                i++; 
            }  
        if (i == 15)
            //return vector [i].toString();
            return null;
        else 
            return vector[i];
    }
}
    
        
    