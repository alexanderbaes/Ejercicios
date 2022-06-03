//forma del video
function insertionsort(v){
    for(let i = 1; i < v.length; ++i){
        let x = v[i];
        let j = i;
        while(j > 0 && v[j-1] > x){
            v[j] = v[j-1];
            --j;
        }
        v[j] = x;
    }
    return v;
}

let arreglo = [5,42,58,71,2,3,1];
console.log("Vector antes de ordenar: " + arreglo);
console.log(insertionsort(arreglo));


//otra forma cambiando ciertas cosas


function insertionsort2(v){
    for(let i = 1; i < v.length; i++){
        let j = i - 1;
        let aux = v[i];

        while(j >= 0 && v[j] > aux){
            v[j+1] = v[j];
            --j;
        }
        v[j+1] = aux;
    }
    return v;
}

let arreglo2 = [5,42,58,71,2,3,1];
console.log("Vector antes de ordenar: " + arreglo2);
console.log(insertionsort2(arreglo2));