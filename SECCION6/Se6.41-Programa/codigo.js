function main(){

    alert("Factorial de un numero: ");
    let valor =prompt("Ingresa el numero: ");


    try {
        valor = parseInt(valor);

    } catch (error) {
        document.write("<h1>DEBES INGRESAR UN NUMERO ENTERO</h1>");
        return main();
        
    }
    
    if (valor <= 0){
        document.write("DEBES INGRESAR UN NUMERO MAYOR QUE CERO");
        return main;

    }

    let resultado = 1;
    for (i=1; i<=valor; i++) {
		resultado *= i; 
	}


    document.write("El factorial de " + valor + " es:  " + resultado);

    


}
main();

