//primera forma de hacerlo

let quickSort = ( [ x = [], ...xs ] ) => {

  return ( x.length === 0 ) ? [] : [

    ...quickSort( xs.filter( y => y <= x ) ),
    x,
    
    ...quickSort( xs.filter( y => y > x ) )
  ];
}

let arreglo = [2,8,7,1,3,5,6,4];
let result = quickSort(arreglo);
result;
console.log(result);

//----------------------------------
//----------------------------------
//Otra forma con funcion flecha

let quickSort2 = (array) =>{

  if(array.length == 0) return []; //si el array es vacio
  
  if(array.length == 1) return array; //si tiene elementos

  let i = Math.floor(array.length/2); //sacar el pivote
  
  let pivot = array[i]; //pivote

  array.splice(i,1); //quitar pivote de el array

  //ordenar los elementos de quicksort de izquierda y derecha gracias al return
  return [

    ...quickSort2(array.filter(y => y < pivot))
    ,pivot,
    ...quickSort2(array.filter(y => y > pivot))
    
  ]

}
//array a organizar
let elementos = [2,8,7,1,3,5,6,4];

//array organizado con el quicksort
console.log(quickSort2(elementos));