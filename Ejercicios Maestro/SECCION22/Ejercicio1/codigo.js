function position(x, v, left, right){
    if(left > right) {return -1;}
    let pos = Math.floor((right + left) /2); // sacamos la mitad del vector

    if(x > v[pos]) {return position(x,v,pos+1,right); }
    if(x < v[pos]) {return position(x,v,left,pos-1); }
    return pos;
}

let n = prompt("Ingresar longitud del vector: ");

let prueba = new Array(n);
for(let i = 0; i < n; i++){
    prueba[i] = prompt("Ingresar valores del vector: ");
}
let x = 2.5;
console.log("El elemento "+x+" Se encuentra en la posicion " + position(x,prueba,0,n-1));

