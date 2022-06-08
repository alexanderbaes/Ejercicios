function diferrence(v1,v2){
    let n = v1.length;
    let m = v2.length;
    let aux = new Array(n);
    let i,j,k = 0;
    while(i < n && j < m){
        if(v1[i] < v2[j]){
            if(k == 0 || v1[i] != aux[k-1]){
                aux[k] = v1[i];
                k++;
            }
            i++;
        }else if(v2[j] < v1[i]){
            j++;
        }else{
            i++;
        }
    }

    while(i < n){
        if(k == 0 || aux[k-1] != v1[i]){
            aux[k] = v1[i];
            k++;
        }
        i++;

    }
    let dif = new Array(k);
    for(let z = 0; z < k; z++){
        dif[z] = aux[z]
    }
    return dif;
}

let n = prompt("Ingresar longitud del primer vector");
let a = new Array(n);
for(let i = 0;i < n;i++){
    a[i]=prompt("Ingresar valor del primer vector")
}
let m = prompt("Ingresar longitud del segundo vector")
let b = new Array(m);
for(let j = 0;j < m;j++){
    b[j]=prompt("Ingresar valor del segundo vector")
}
console.log("El vector diferencia de a y b es: ");
let diferencia = diferrence(a,b);