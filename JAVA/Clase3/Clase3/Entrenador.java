/**
 * 
 * 3- A- Modifique la clase Persona (del ejercicio 2 de la clase 2) para representar entrenadores de un club de fútbol. 
 * Un entrenador se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
	Defina métodos para obtener/modificar el valor de cada atributo.
	Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el entrenador. El sueldo se 
compone del sueldo básico, al cual se le adiciona un plus por campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos;
 $30.000 si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos). 

 */
public class Entrenador {
    private String nombre;
    private double sueldo;
    private int cantGanados; 
    
    public Entrenador(String nom, double sueldob, int ganados){
        nombre = nom;
        sueldo = sueldob;
        cantGanados = ganados; 
    }
    
    public Entrenador(){
     
    }
    
    //-------------------------------------------
    public String getNombre() {
        return nombre;
    }
    
    public double getsueldo() {
        return sueldo;
    }

    public int getganados() {
        return cantGanados;
    }
    
    //-----------------------------------
    public void setNombre(String nom) {
        nombre = nom;
    }

    public void setSueldo(double sueldob) {
        sueldo = sueldob;
    }

    public void setGanados(int ganados) {
        cantGanados = ganados;
    }

    //---------------------------------------
    
    public double getCalcularSueldo() {
        double s = sueldo;
        
        if ((cantGanados >= 1) && (cantGanados <= 4)) 
            s = s + 5000;
        else 
            if ((cantGanados  >= 5) && (cantGanados <= 10))
                s = s + 30000;
            else 
                s = s + 50000;
        return s; 
    }  
    
    public String toString(){
        String aux; 
        aux = "El nombre es " + nombre + ", sueldo: " + sueldo + " cantidad de partidos ganados " + cantGanados;
        return aux;
    }
}