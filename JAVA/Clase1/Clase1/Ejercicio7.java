
/**
Escriba un programa que simule el ingreso de personas a un banco. 
Cada persona que ingresa indica la operación que desea realizar 
(0: “cobro de cheque” 1: “depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de jubilación” 4: “cobro de planes”).
 La recepción de personas culmina cuando un empleado ingresa la  operación 999 (cierre del banco). 
Informar la cantidad de personas atendidas por cada operación y la operación más solicitada.   
 */


import java.util.Scanner; // Importamos funcionalidad para la entrada 

public class Ejercicio7{
    
    public static void main (String[]args) { 
    Scanner in = new Scanner (System.in); // declaramos scanner
    int [] vector;
    vector = new int [4];
    int i;
    //inicializamos vector
    for (i=0; i<4; i++) {
        vector [i] = 0;
    }
    
    //ingresamos las operaciones para contarlas
    System.out.print ("Ingrese operacion\n");
    int operacion= in.nextInt ();

    while (operacion != 999)
    {
        vector [operacion] ++;
        System.out.print ("Ingrese operacion\n");
        operacion= in.nextInt ();
    }
    
    int max = -1;
    int maxOperacion = -1;
    
    for (i=0; i<4; i++)
        {
            System.out.print ("La cantidad de personas atendidas para la operacion " + i + "es: " + vector [i] + "\n");
            if (vector [i] > max){
                max = vector [i];
                maxOperacion = i;
            }
        }
    
    System.out.print ("La operacion mas solicitada es: " + maxOperacion + "\n");
        
    in.close();   
   

    }
}