function merge2(v,left,mitad,right){
    let i = left; //secuencia para el vector de la izquierda
    let j = mitad;//secuencia para el vector de la derecha
    let aux = [];
    while(mitad > i || right > j){ 
        if(i < mitad && j < right){
            v[i] < v[j] ? aux.push(v[i++]) : aux.push(v[j++]); 
        }else {
            i < mitad ? aux.push(v[i++]) : aux.push(v[j++]);
        }
    }
    aux.forEach((a,b) => v[left + b] = a);
   
}

function mergesort2(v,left,right){
    left = left === undefined ? 0 : left;
    right = right === undefined ? v.length : right;
    if(right < left > 2){ // esto se cumpliera solo si derecha es mayor que izquierda
        mergesort(v,left, Math.floor((right + left) / 2));//aca se ordena izquierda hasta la mitad
        mergesort(v, Math.floor((right + left) / 2),right);//aca se ordena mitad hasta la derecha
        merge(v,left,Math.floor((right + left) /2),right);//aqui se funciona el vector;
    } else if (right - left === 2 && v[left] > v[right - 1]) {
        let tamp = v[left];
        v[left] = v[right - 1];
        v[right - 1] = tamp;
    }
}

let arregloprueba = [50,40,25,70,2,4,3,8];
console.log("vector antes de arreglar: " + arregloprueba);
mergeSort(arregloprueba)
console.log("vector despues de arreglar: " + arregloprueba);