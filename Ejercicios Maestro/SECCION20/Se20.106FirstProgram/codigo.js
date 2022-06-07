
alert("Escriba las notas de los 5 alumnos: ")
let notas = new Array(5);

for(let i = 0; i < 5; i++){
    notas[i] = prompt("digitar nota; "),0
}

for(let i = 0; i < 5; i++){
    console.log(notas[i]);
}