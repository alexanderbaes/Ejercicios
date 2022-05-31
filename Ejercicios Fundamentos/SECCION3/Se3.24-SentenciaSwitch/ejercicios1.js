
//Primer Ejercicio

let edad = prompt("Ingresar la edad");

if (edad > 0 && edad <= 125){

    if(edad < 18){
        document.write("<h1>Es Menor de edad</h1>");
    } else {
        if (edad < 60){
            document.write("<h1>Es Mayor de edad</h1>");
        } else{
            document.write("<h1>Es de la tercera edad</h1>");
        }
    }

} else{
    document.write("<h1>Edad invalida</h1>");
}


