
let f = prompt("Escrinir Numero de filas: ");
let c = prompt("Escrinir Numero de columnas: ");
let matriz = new Array(f);

for(let i = 0; i < f; i++){ 
    matriz[i] = new Array(c);
    for(let j = 0; j < c; j++){
        matriz[i][j] = prompt("Escribir valores de la matriz")

    }
}

for(let i = 0;i < f; i++){ 
    
    for(let j = 0; j < c; j++){
        document.write(matriz[i][j]);   

    }
    document.write("<br>")
   
}



