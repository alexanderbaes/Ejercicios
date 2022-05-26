function main(){

    alert("Factorial de un numero: ");
    let valor =Number(prompt("Ingresa el numero: "));


    try {
        if(isNaN(valor)){
            throw "<h1>DEBES INGRESAR UN NUMERO ENTERO</h1>"
        }
        
    } catch (error) {
        document.write(error);
        return;
        
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

