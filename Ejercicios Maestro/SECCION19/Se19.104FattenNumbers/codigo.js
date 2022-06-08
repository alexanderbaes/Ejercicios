//FATTEN NUMBERS


function maximo(a,b){
    if(a >= b){
        return a;
    }else{
        return b;
    }

}

function fattenum(x){

    if (x <= 10){
        return x;
    }else{
        let n = x % 10;
        let fn = fattenum(x/10) % 10;
        let valor = maximo(n,fn);

        return 10 * fattenum(x/10) + valor;
    }

}


while(a = prompt("Digite un numero: ") ){
    alert("El fatten numbers de : " +a+ " es: " + fattenum(a));
}




