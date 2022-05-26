//Segundo Ejercicio


let edad = prompt("Ingresar la edad");

switch (true) {
    case edad >= 1 && edad <= 17:
        document.write("<h1>Es menor de edad</h1>");
        break;

    case edad >= 18 && edad <= 59:
        document.write("<h1>Es mayor de edad</h1>");
        break;

    case edad >= 60 && edad <= 125:
        document.write("<h1>Es de la tercera edad</h1>");
        break;

    default:
        document.write("<h1>Edad invalida</h1>");
        break;
  
}