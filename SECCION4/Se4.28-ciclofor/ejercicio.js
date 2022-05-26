//Primer ejercicio

let resultado = 0;
for (let i = 10; i >= 0; i--){

    
   resultado+= i;

}

document.write(resultado + "<br><br>");



//Segundo ejercicio

let calificaciones = [90.5, 87.4, 65.6, 40.57];
let suma = 0;

for (let i = 0; i < calificaciones.length; i++){

   suma += calificaciones[i];

}

let resultado2 = suma/calificaciones.length;

document.write(resultado2);