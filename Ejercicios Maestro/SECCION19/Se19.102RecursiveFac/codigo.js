//Construir una funcion recursiva que retorne el factorial de un numero n

function factorialr(n){
    if(n==0){
        return 1;
    }else {
        return n * factorialr(n - 1);
    }

}

let a;
while(a = prompt("Digite un numero para mostrar su factorial: ")){
    alert("el Factorial de: " +a+ " es: " + factorialr(a));
}