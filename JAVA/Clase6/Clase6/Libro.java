
/**
     Libro, que también tiene asociado un título, la cantidad de capítulos del mismo y si es o no una edición de bolsillo.
 */

public class Libro extends Ejemplar{ 
    private String titulo;
    private int cantCapitulos;
    private boolean edicionDeBolsillo = false;

    // Constructor
    public Libro (int codigo, int cantPaginas, String resumen, int añoPublicacion, Responsable resp, String titulo, int cantCapitulos, boolean edicicionDeBolsillo ){
        super(codigo, cantPaginas, resumen, añoPublicacion, resp);
        this.titulo = titulo;
        this.cantCapitulos = cantCapitulos;
        this.edicionDeBolsillo = edicionDeBolsillo;
    }
    
    public Libro() {
    }
    
    public String getTitulo(){
        return titulo;       
    }
  
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
    
    public int getCantCapitulos(){
        return cantCapitulos;       
    }
  
    public void setCantCapitulos(int cantCapitulos){
        this.cantCapitulos = cantCapitulos;
    }
    
    public boolean getEdicionDeBolsillo(){
        return edicionDeBolsillo;       
    }
  
    public void setEdicionDeBolsillo(boolean edicicionDeBolsillo){
        this.edicionDeBolsillo = edicionDeBolsillo;
    }
   
    public String toString(){
        String aux; 
        aux = "El codigo del libro es: " + super.getCodigo() + " el titulo es: " + titulo + ", el nombre del responsable es: " + super.getResponsable().getNombreApellido();
        return aux;
    }
    
    public String modificar() {
        if (edicionDeBolsillo)
            titulo = titulo + " - De Bolsillo";  
        else
            titulo = titulo + " - no es De Bolsillo"; 
        return titulo;
    }
}
