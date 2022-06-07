//Valor minimo de un vector


let n = Number(prompt("Digitar tamaño del vector"));// para darle el tamaño al vector
let voices = new Array(n);  //aqui se colocara el tamaño agregado del vector

for(let i = 0; i < n; i++){
    voices[i] = prompt("Digitar valores del vector "); // Rellenamos el vector
}
let min = voices[0]; //suponemos que el minimo esta en la posicion 0

for(let j = 1; j < n; j++){ //buscamos desde la posicion 1
    if(voices[j] < min){
        min = voices[j]  //recorremos el vector y dejamos en variable min el valor minimo del vector 
    }
}


alert("El valor minimo del vector es: " + min);//mostramos el minimo del vector