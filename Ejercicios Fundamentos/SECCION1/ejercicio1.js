

function sesion(){
    for(let i = 2 ; i >= 0; i--){
        let user = "alexander";
        let pass= "1234alex";
        let usuario = prompt("Ingresar Nombre de Usuario: ");
        let contraseña = prompt("Ingresar Contraseña");
    
        if(user == usuario && pass == contraseña) {   
            
            document.write("Bienvenido " + usuario);
            break;
        } else{
            alert("Nombre de usuario o contraseña Incorrecta");
            alert("Tienes "+ i + " intentos, si no te toca esperar 10 minutos mijo");

        }
        if(contraseña){

        }
        if (i == 0){
            document.write("<h1>te toca esperar 10 minutos mijo</h1>");
        }




    }





}

sesion();









    


