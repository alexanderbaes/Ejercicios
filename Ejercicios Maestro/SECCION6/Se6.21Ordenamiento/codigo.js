
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


let n = Number(prompt("Ingresar  vector"));
let california = new Array(n);
console.log(california);
console.log(selection_sort(california));

/* let n = Number(prompt("Ingresar  vector"));
let california = [n];
console.log(california); */








/*     function swap(a, b) {
        let aux = arr[a];
        arr[a] = arr[b];
        arr[b] = aux;
      } */