/**
   -    Revista, que tiene asociado su nombre, un número de volumen y la cantidad de artículos en su interior. 
 */

public class Revista extends Ejemplar { 
    private String nombreRevista;
    private int numVolumen = Generador.getNroVolumen();
    private int cantArticulos;

    // Constructor
    public Revista (int codigo, int cantPaginas, String resumen, int añoPublicacion, Responsable resp, String nombreRevista, /*int numVolumen,*/ int cantArticulos){
        super(codigo, cantPaginas, resumen, añoPublicacion, resp);
        this.nombreRevista = nombreRevista;
        //this.numVolumen = numVolumen;
        this.cantArticulos = cantArticulos;
    }
    
    public Revista(){
    }
    
    public String getNombreRevista(){
        return nombreRevista;       
    }
  
    public void setNombreRevista(String nombreRevista){
        this.nombreRevista = nombreRevista;
    }
    
    /*
    public int getNumVolumen(){
        return numVolumen;       
    }
  
    public void setNumVolumen(int numVolumen){
        this.numVolumen = numVolumen;
    }
    */
    
    public int getCantArticulos(){
        return cantArticulos;       
    }
  
    public void setCantArticulos(int cantArticulos){
        this.cantArticulos = cantArticulos;
    }

    public String toString(){
        String aux; 
        aux = "El nombre de la revista es: " + nombreRevista + " y el numero de volumen es: " + numVolumen;
        return aux;
    }
    
    // -Para las revistas, se agrega además el número de volumen (que se solicita mediante el método getNroVolumen()
    //  de la clase Generador provista para el repaso).
    public String modificar() {
        nombreRevista = nombreRevista + numVolumen;
        return nombreRevista;
    }
}