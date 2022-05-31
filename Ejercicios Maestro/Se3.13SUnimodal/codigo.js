

//forma normal

let arreglo = [2, 3, 9, 6, 4, 1];
let max = arreglo.reduce(function(a, b){ return Math.max(a, b);}, -Infinity);

console.log(max);