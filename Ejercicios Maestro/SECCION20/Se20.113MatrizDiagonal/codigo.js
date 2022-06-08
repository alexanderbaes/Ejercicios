function is_diagonal_matriz(matriz){
    let n = matriz.length;
    for(let i = 0;i < n; i++){
        for(let j = 0; j < n; j++){
            if(i != j && matriz[i][j] != 0){
                return false;
            }
        }
    }
    return true;

}


let tamaño_matriz = 3;
let matrix = new Array(tamaño_matriz);

for(let i = 0; i < tamaño_matriz; i++){
    matrix[i] = new Array(tamaño_matriz);
    for(let j = 0; j < tamaño_matriz; j++){
        matrix[i][j] = prompt("Ingresar Valores de La matriz");
    }
}

if(is_diagonal_matriz(matrix)){
    console.log("La matriz es diagonal.");
}else {
    console.log("La matriz no es diagonal.");
}