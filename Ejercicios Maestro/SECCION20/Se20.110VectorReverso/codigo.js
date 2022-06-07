while(n = prompt("Digitar el tamaño del vector: ")){//escribo tamaño del vector
    let lista = new Array(n);
    for(let i = 0; i < n; i++){
        lista[i] = prompt("Digitar valores del vector: "); // escribo valores del vector
    }

    for(let j = n-1;j >= 0; j--){

        if(j != 0){
            console.log(lista[j] +" ");
        }else{
            console.log(lista[j]);
            console.log("----------------------------------------")
            console.log("----------------------------------------")
        }
        
    }


}