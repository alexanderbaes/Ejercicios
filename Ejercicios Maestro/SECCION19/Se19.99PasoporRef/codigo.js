//Funciones y procedimientos
//Paramentros: Paso por referencia ( & )

function swaptwo(a,b){
    let aux = b;
    b = a;
    a = aux;
    return console.log("ahora x vale y: " + a + "\n"
    + "ahora y vale x: "+b);
}
let x = 2;
let y = 5;

console.log("Esto vale x: " + x);
console.log("Esto vale y: " + y);

swaptwo(x,y);
