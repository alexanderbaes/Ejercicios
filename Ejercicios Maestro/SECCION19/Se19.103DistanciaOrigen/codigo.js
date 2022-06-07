//DISTANCIA AL ORIGEN

function dis_ori(x,y){
    
    let d = Math.sqrt(x*x + y*y);
    return d;
}


let a = prompt("Dame el valor 1",0);
let b = prompt("Dame el valor 2",0);

alert("La distancia de origen es: " + dis_ori(a,b));


