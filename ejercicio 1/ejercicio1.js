function IniciarSession(){
    let nameuser = "alexanderbaes";
    let password = 12345678;
    usuario = prompt("Ingresar Nombre de Usurio");
    contraseña = prompt("Ingresar Contraseña");


    if (usuario == nameuser && contraseña == password ){
        return "Bienvenido";

    }else{
        return alert("Usuario o contraseña incorrecto/no existe");
    }
    

}

let bienvenido = IniciarSession();
document.write(bienvenido);