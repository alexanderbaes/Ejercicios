
let f = Number(prompt("Escrinir Numero de filas: "));
let c = Number(prompt("Escrinir Numero de columnas: "));

let matriz = new Array(f , new Array(c));

for(let i = 0; i < f.length; i++){
    for(let j = 0; j < c.length; c++){
        matriz[i][j] = prompt("digitar valores de la matriz: ")
    }
}

for(let i = 0;i < f.length; i++){
    for(let j = 0; j < c.length; j++){
        console.log(matriz[i][j]);
    }
}
