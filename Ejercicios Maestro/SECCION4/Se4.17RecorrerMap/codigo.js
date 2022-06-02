
let a= {
    "santiago": 8,
    "ana": 4,
    "carlos": 9,
    "ulises": 5,
    "adan": 10,
}   

console.log(a)

console.log("-------------------------------") 
console.log("Orden de entrada")
for (let clave in a) {
    console.log('el alumnno(Propiedad): ', clave, '=> saco (valor): =>',a[clave]);
}

console.log("-------------------------------") 
console.log("antes de ordenar por clave o por valor")

//array de arrays: [ [clave, valor], [clave, valor], ... ]

let entryArray = Object.entries(a); 
console.log(entryArray.toString());

// Ordenando por clave tomando como referencia el menor
console.log("--------------------")
console.log("ordenado por clave")
entryArray.sort((a,b) => a[0].localeCompare(b[0]));
console.log(entryArray.toString());

//ordenando por valor tomando como referencia el menor
console.log("--------------------")
console.log("ordenado por valor")
entryArray.sort((a,b) => a[1] -b[1]);
console.log(entryArray.toString());


//ordenado por clave tomando como referencia el mayor

console.log("--------------------")
console.log("ordenado por clave mayor")
entryArray.sort((a,b) => a[0].localeCompare(b[0])).reverse();
console.log(entryArray.toString());

//ordenado por valor tomando como referencia el mayor
console.log("--------------------")
console.log("ordenado por valor mayor")
entryArray.sort((a,b) => a[1] -b[1]).reverse();
console.log(entryArray.toString());




