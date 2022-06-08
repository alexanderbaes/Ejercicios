function time_lapse(time_1, time_2){
    if (time_1 < time_2) { return time_2 - time_1; }
    else { return 60 - (time_1 - time_2); }
}


let a = prompt("Ingresar primer time: ");
let b = prompt("Ingresar segundo time: ");

let lapso = time_lapse(a,b);
let cierto = true;
let c = Number(prompt("ingreso de otro time: "));

while(c != -1 && cierto){
    if(isNaN(c)){
        break;
    }else{
        let nuevolapso = time_lapse(b,c);
        cierto = lapso == nuevolapso;
        b = c;
        c = Number(prompt("ingreso de otro time: "))
    }
    
}
if(cierto){
    console.log(lapso);
}else {
    console.log(0);
}

