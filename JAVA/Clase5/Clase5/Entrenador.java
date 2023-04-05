
/**
 * B- Implemente constructores para los jugadores y entrenadores, que reciban toda la información
 * necesaria para inicializar el objeto en cuestión. 
 *Los entrenadores son empleados  que se caracterizan por la cantidad de campeonatos ganados.
 *
 */


public class Entrenador extends Empleado{ 
    private int ganados;

    // Constructor
    public Entrenador (String nombre, int DNI, int edad, double sueldoBasico, int ganados){
        super(nombre,DNI,edad,sueldoBasico);
        this.ganados = ganados;
    }
        
    public int getGanados(){
        return ganados;       
    }
  
    public void setGanados(int ganados){
        this.ganados = ganados;
    }
    
  
    // Para los entrenadores: el sueldo a cobrar es el sueldo básico al cual se le adiciona un plus por campeonatos ganados
    // (5000$ si ha ganado entre 1 y 4 campeonatos;  $30.000 si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de
    // 10 campeonatos). 
    public double calcularSueldo() {
       double sueldo;
       if ( (ganados > 1) && (ganados < 5))
           sueldo = super.getSueldoBasico() + 5000; 
        else 
           if ( (ganados > 4) && (ganados < 11))
               sueldo = super.getSueldoBasico() + 30000;
            else 
                sueldo = super.getSueldoBasico() + 50000; 
       return sueldo;              
    }
    
    public String toString() {
        String aux;
        aux = super.toString() + " su sueldo es " + calcularSueldo(); 
        return aux;
    }
}


