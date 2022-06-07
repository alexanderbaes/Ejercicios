//Factorial de n

function factorialn(n){
    let fact = 1;
    for(let i = 1; i <= n; i++){
        fact *= i;    // se puede hacer eso para no hacer fact = fact * i;
    }

    return fact;

}

let a;
while(a = prompt("Digite un numero para mostrar su factorial: ")){
    alert("su Factorial es: " + factorialn(a))
}