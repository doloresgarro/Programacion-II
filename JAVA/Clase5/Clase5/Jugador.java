/**
 * B- Implemente constructores para los jugadores y entrenadores, que reciban toda la información
 * necesaria para inicializar el objeto en cuestión. 
 * Los jugadores son empleados que se caracterizan por el número de partidos jugados y el número de goles anotados.
 */


public class Jugador extends Empleado{ 
    private int partidos;
    private int goles; 
 
    // Constructor
    public Jugador (String nombre, int DNI, int edad, double sueldoBasico, int partidos, int  goles){
        super(nombre,DNI,edad,sueldoBasico);
        this.partidos = partidos;
        this.goles = goles;
    }
    
    public int getPartidos(){
        return partidos;       
    }
  
    public void setPartidos(int partidos){
        this.partidos = partidos;
    }
    
    public int getGoles(){
        return goles;       
    }
  
    public void setGoles(int goles){
        this.goles = goles;
    }
  
    // Para los jugadores: el sueldo a cobrar es el sueldo básico y si el promedio de goles por partido es superior a 0,5
    // se adiciona un plus de otro sueldo básico. 
    public double calcularSueldo(){
       double sueldo;
       double promedio = (double)(goles / partidos);
       if (promedio > 0.5) 
           sueldo = super.getSueldoBasico() * 2;
        else 
            sueldo = super.getSueldoBasico(); 
        return sueldo; 
    }
    
    public String toString() {
        String aux;
        aux = super.toString() + " su sueldo es " + calcularSueldo(); 
        return aux;
    }
}


