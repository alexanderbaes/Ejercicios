class Pila {
    #elementos = []; //el # es para privatizar los elementos 

    //push: Agrega un nuevo valor a la pila, ubicándolo al final de ésta.
    push = (elemento) => {
      return this.#elementos.push(elemento);
    }
    //pop: Retorna el último valor ingresado a la pila, sacándolo de ésta.
    pop = () => {
      return this.#elementos.pop();
    }
    //peek: Retorna el último valor ingresado a la pila, sin sacarlo de ésta.
    peek = () =>{
        return this.#elementos[this.#elementos.length - 1];
    }
    //size: Retorna el número de elementos que contiene la pila.
    size = () => {
        return this.#elementos.length;
    }
    //isempty: Este método comprueba si la pila está vacía.
    isempty = () => {
      return this.#elementos.length === 0;
    }
    //empty: Este método eliminará todos los elementos de la pila.
    empty = () => {
      this.#elementos.length = 0;
    }
    //print: Muestra el contenido de la pila.
    print = () =>{
        console.log(this.#elementos);
    }

}
//creamos la pila
const pila = new Pila();
// Agregamos elementos a la pila
pila.push('a');
pila.push('b');
pila.push('c');
pila.push('d');
console.log("Tamaño de la pila: " + pila.size()); // 4
console.log("el elemento elimina es: " + pila.pop()); // 'd'
console.log("ahora el tamaño es de: " + pila.size()); // 3
console.log("El ultimo elemento de la pila es: " + pila.peek()); // c
pila.print();

