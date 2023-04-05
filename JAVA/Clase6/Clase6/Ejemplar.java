
/**
 Una editorial universitaria, necesita registrar la información correspondiente a los ejemplares que publicó y se publicarán.
 Cada Ejemplar posee un código identificatorio, cantidad de páginas, un resumen, año de publicación (si aún no fue publicado 
 este valor es cero) y la información del responsable a cargo de la edición. Para el responsable se registra su DNI, nombre y 
 apellido. 
a) Implementar la clase Ejemplar con sus respectivos atributos, constructores y métodos para acceder y modificar atributos.
-    Para los libros, se concatena al final de su título si el mismo es o no una edición de bolsillo, por ejemplo, si el 
libro es “Programación en JAVA”, su título se modificará a “Programación en JAVA – De Bolsillo” 

 */
public abstract class Ejemplar
{
    private int codigo;
    private int cantPaginas;
    private String resumen;
    private int añoPublicacion; 
    private Responsable resp; // Responsable es una clase que creamos aparte, resp --> es el "tipo de dato"
    
    
    
    public Ejemplar(int codigo, int cantPaginas, String resumen, int añoPublicacion, Responsable resp){
        this.codigo = codigo;
        this.cantPaginas = cantPaginas;
        this.resumen = resumen;
        //this.publicado = publicado;
        this.añoPublicacion = añoPublicacion;
        this.resp = resp; //???????????????????????????????????????? se puede eso????????????????????????????
    }
    
    public Ejemplar(){
    }
    
    public int getCodigo(){
        return codigo;       
    }
    
    public void setCodigo(int codigo){
        this.codigo = codigo;       
    }
    
    public int getCantPaginas(){  
        return cantPaginas;       
    }
    
    public void setCantPaginas(int cantPaginas){  
        this.cantPaginas = cantPaginas; 
    }
    
    public String getResumen(){
        return resumen;       
    }
    
    public void setResumen(String resumen){
        this.resumen = resumen;       
    }
     
    public int getAñoPublicacion() {
        return añoPublicacion;
    }
   
    public void setAñoPublicacion(int AñoPublicacion) {
        this.añoPublicacion = añoPublicacion;
    }
    
    public Responsable getResponsable() {
        return resp;
    }
    
    public void setResponsable(Responsable resp) {
        this.resp = resp;
    }    
    
    abstract String modificar();
}


