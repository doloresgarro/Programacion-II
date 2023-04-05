/** 1 -  Queremos representar la información de empleados de un club: jugadores y entrenadores. 
	Cualquier empleado se caracteriza por su nombre, DNI, edad y sueldo básico. 
	Los jugadores son empleados que se caracterizan por el número de partidos jugados y el número de goles anotados.
	Los entrenadores son empleados  que se caracterizan por la cantidad de campeonatos ganados.

A- Implemente la jerarquía de clases, con los atributos de cada clase y métodos para obtener/modificar el valor de los mismos. 
B- Implemente constructores para los jugadores y entrenadores, que reciban toda la información necesaria para inicializar el 
objeto en cuestión. 
C- Cualquier empleado (jugador / entrenador) debe saber responder al mensaje calcularSueldoACobrar (que calcula y devuelve 
el sueldo a cobrar) pero de manera diferente:
	Para los jugadores: el sueldo a cobrar es el sueldo básico y si el promedio de goles por partido es superior a 0,5
 se adiciona un plus de otro sueldo básico. 
	Para los entrenadores: el sueldo a cobrar es el sueldo básico al cual se le adiciona un plus por campeonatos ganados 
(5000$ si ha ganado entre 1 y 4 campeonatos;  $30.000 si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10
 campeonatos). 
*/
public abstract class Empleado {
    private String nombre;
    private int DNI;
    private int edad;
    private double sueldoBasico;
    
    public Empleado(String nombre, int DNI, int edad, double sueldoBasico){
        this.setNombre(nombre);
        this.setDni(DNI);
        this.setEdad(edad);
        this.setSueldoBasico(sueldoBasico);
    }
    
    public Empleado(){
    }
   
    public String getNombre(){
        return nombre;       
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;       
    }
    
    public int getDNI(){
        return DNI;       
    }
    
    public void setDni(int DNI){
        this.DNI = DNI;       
    }
    
    public int getEdad(){  
        return edad;       
    }
    
    public void setEdad(int edad){  
        this.edad = edad; 
    }
     
    public double getSueldoBasico() {
        return sueldoBasico;
    }
   
    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    // D) Cualquier empleado debe responder al mensaje toString, que devuelve un String que lo representa. 
    // La representación de cualquier empleado está compuesta por su nombre y sueldo a cobrar. 
        public String toString(){
        String aux; 
        aux = "El nombre del empleado es " + nombre;
        return aux;
    }
    

    abstract double calcularSueldo();       
}

