const paises = ["Panama","Egipto","Argentina"];

document.write("Coleccion Original: <b>" +paises+ "</b><br>");
paises.push("Francia");

document.write("Nuevo pais agregado : <b>" +paises+ "</b><br>");
paises.splice(1,1);

document.write("Pais Eliminado: <b>" +paises+ "</b><br>");
paises.push("Australia");

document.write("Nuevo pais agregado : <b>" +paises+ "</b><br>");
paises.sort();

document.write("implementacion de sort : <b>" +paises+ "</b><br>");
paises.push("Brasil");

document.write("Resultado final : <b>" +paises+ "</b><br>")

