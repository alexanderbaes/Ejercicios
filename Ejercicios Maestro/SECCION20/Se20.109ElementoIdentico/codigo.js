
let n = Number(prompt("Digitar el tamaño del vector"));

let sun = new Array(n);

for(let i = 0; i < n; i++){
    sun[i] = Number(prompt("Digitar valor del vector: "));
}

let contador = 0;
for(let j = 0; j < n; j++){
    if(sun[j] === sun[n-1]){
        contador = contador + 1; //tambien se coloca contador = contador+1
    }

}

alert("Numero de elementos del contador: " + contador);

//1 7 3 2 4 7 5 8 7