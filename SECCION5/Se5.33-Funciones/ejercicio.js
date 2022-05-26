

function calcularImpuestos(salario, porcentajeImpuestos){

    let totalImpuestos = (salario / 100) * porcentajeImpuestos;
    return totalImpuestos;

}


let res = calcularImpuestos(10000.0, 16.0);
document.write(res + "<br><br>");

let res2 = calcularImpuestos(5000.0, 5.0);
document.write(res2);