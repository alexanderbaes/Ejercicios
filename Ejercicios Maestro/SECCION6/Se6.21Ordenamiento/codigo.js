
function pos_min(v, left, right) {
    let pos = left;
    for(let i = left + 1; i <= right; i++){
        if(v[i] < v[pos]){
            pos = i;
        }
    }return pos;

}

function selection_sort(v){
    let posultima = v.length -1;
    for(let i = 0; i < posultima; i++){
        let min = pos_min(v,i,posultima);
       // swap(v[min], v[i]);
        [v[min], v[i]] = [v[i], v[min]];
        
    }
    return v
}

let california = [50,16,27,350,8,1]
console.log("Vector sin ordenar: " + california)

console.log("Vector Ordenado: " + selection_sort(california));








/*     function swap(a, b) {
        let aux = arr[a];
        arr[a] = arr[b];
        arr[b] = aux;
      } */