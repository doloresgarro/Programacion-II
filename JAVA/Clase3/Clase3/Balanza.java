/**
 * Definir una clase para representar balanzas comerciales (para ser utilizadas en verdulerías, carnicerías, etc). 
 * Una balanza comercial sólo mantiene el monto y la cantidad de items correspondientes a la compra actual 
 * (es decir, no almacena los ítems de la compra). La balanza debe responder a los siguientes mensajes: 
    iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual. 
    
        registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado 
        y su precio por kg, debiendo  realizar las actualizaciones en el estado de la balanza. 
    devolverMontoAPagar(): retorna el monto de la compra actual. 
    devolverResumenDeCompra(): retorna un String del siguiente estilo 
        “Total a pagar X por la compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra. 

 */
public class Balanza
{
    // instance variables - replace the example below with your own
    private double monto;
    private int cantidad;
   
    //constructor
    public Balanza(){  
    
    }
    
    
    //---------------------------------------------------------------------
    public void IniciarCompra() {
        monto = 0;
        cantidad = 0;
    }
    
 
    //  registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado 
    public void registrarProducto (double pesoEnKg, double precioPorKg) {
        monto = monto + ((pesoEnKg * precioPorKg));
        cantidad ++;
    }
    
    
    //    devolverMontoAPagar(): retorna el monto de la compra actual.  
    public double getMontoAPagar(){
        return monto; }
    
    // 
    public String devolverResumenDeCompra(){
        String aux; 
        aux = "Total a pagar " + monto + ", por la compra de " + cantidad;
        return aux;
    }    
    
    
    }
    


