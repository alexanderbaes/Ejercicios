let inicio = alert("Calcular el area de figuras geometricas");

let opcion = prompt(`Seleccionar una opcion:  (1).Circulo , (2)Triangulo `, 0);


switch(parseInt(opcion)){
    case 1:
        calcularAreaCirculo();
        break;
    case 2:
        calcularAreaTriangulo();
        break;

    default : {
        document.write("<h1>Opcion No Valida</h1>");
        break;       
    }

}

function calcularAreaCirculo(){
    let radio = prompt("Ingresa el radio del circulo: " ,0);

    let area = (radio * radio) * 3.14159;

    document.write("El area es.  " + area);

}

function calcularAreaTriangulo(){

    let base = prompt("Ingresa la medida de la base: ",0);
    let altura = prompt("Ingresa la medida de la altura: ");
    let area = (base * altura) / 2;

    document.write("El area es.  " + area);

}

