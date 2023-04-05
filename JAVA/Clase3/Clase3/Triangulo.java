

/**
Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus 3 lados (double), 
el color de relleno (String) y el color de línea (String). 

El triángulo debe saber: 
    Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#) 
    Calcular el área y devolverla (método calcularArea)
    Calcular el perímetro y devolverlo (método calcularPerimetro)

NOTA: Calcular el área con la fórmula  Área= √(s(s-a)(s-b)(s-c))   , 
donde a,b y c son los lados y s=(a+b+c)/2 . La función raíz cuadrada es Math.sqrt(#)

 */
public class Triangulo
{
    // instance variables - replace the example below with your own
    private double a;
    private double b;
    private double c;
    private String colorR;
    private String colorL;

    
    public Triangulo(double lado1, double lado2, double lado3, String relleno, String linea)
    {
        // inicializar instance variables
        a = lado1;
        b = lado2;
        c = lado3;
        colorR = relleno;
        colorL = linea;
    }
    
    //constructor
    public Triangulo(){  
    
    }
    
    
    //---------------------------------------------------------------------
    public double getA() {
        return a;
    }
    
    
    public void setA(double lado1) {
        a = lado1;
    }
    
    //-----------------------------
      
    public double getB() {
        return b;
    }
    
    
    public void setB(double lado2) {
        b = lado2;
    }
    
    //-----------------------------------
      
    public double getC() {
        return c;
    }
    
    
    public void setC (double lado3) {
        c = lado3;
    }
    
    //--------------------------------
      
    public String getColorR() {
        return colorR;
    }
    
    public void setColorR(String relleno) {
        colorR = relleno;
    }
      
    //--------------------------------------
    public String getColorL() {
        return colorL;
    }
    
    public void setColorL(String linea) {
        colorL = linea;
    }
    //------------------------------------
    //Calcular el área y devolverla (método calcularArea)
    //Área= √(s(s-a)(s-b)(s-c))   , 
    // donde a,b y c son los lados y s=(a+b+c)/2 . La función raíz cuadrada es Math.sqrt(#)

    public double getCalcularArea() {
        double area;
        double s;
        s = (a + b + c) / 2;
        area = Math.sqrt (s*(s-a)*(s-b)*(s-c));
        return area; 
    }  
    
    public double getCalcularPerimetro() {
        double perimetro = a + b + c;
        return perimetro;
    }
    
    
}