function merge(v, left,medio,right){
    let tamañov = right - left  + 1; //de aqui sacamos el tamaño del vector
    let aux = [tamañov];
    let i = left; //secuencia para el vector de la izquierda
    let j = medio+1;//secuencia para el vector de la derecha
    let kaux = 0; // vector auxiliar - parametro
    while(i <= medio && j <= right){
        if(v[i] <= v[j]){
            aux[k] = v[i];
            ++i;
        }else{
            aux[k] = v[j];
            ++j;
        }
        ++k;
    }
    while(i <= medio){ // relleno aux con v[i] - vector de la izquierda
        aux[k] = v[i];
        ++k;
        ++i;
    }
    while(j <= right){  // relleno aux con v[j] - vector de la derecha
        aux[k] = v[j];
        ++k;
        ++j;
    }
    for(k = 0; k < tamañov; ++k){
        v[left + k] = aux[k];
    }

}

function mergesort(v, left, right){
    if(left < right){ // esto se cumpliera solo si derecha es mayor que izquierda
        let mitad = (left + right) / 2; // aqui saco la posicion de la mitad 
        mergesort(v,left,mitad);   // aca se ordena la primera mitad de izquierda hasta el medio
        mergesort(v,mitad + 1,right); //aca se ordena la otra mitad de la mitad hasta la derecha
        mergesort(v,left,mitad,right); //aqui se funciona el vector


    }
}

let vector = [12,15,4,2,3,5];
