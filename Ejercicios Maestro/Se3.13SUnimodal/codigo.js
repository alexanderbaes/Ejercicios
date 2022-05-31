

function secuenciaUnimodal(){

    let arreglo = [2,3,9,6,4,1];

    let max = arreglo.reduce(function(a, b){
         console.log("Comparaciones: " + a,b);
 
         return Math.max(a, b);}
         
         , -Infinity);

        if(isNaN(max)){
            throw "no se puede comparar el max(top) con valores no enteros"
        }
         

    console.log("El top es: " + max);

    
}
secuenciaUnimodal();





