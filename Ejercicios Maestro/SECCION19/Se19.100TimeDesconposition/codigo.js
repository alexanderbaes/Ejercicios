// n segundos  ---> descomponer el numero

function descompose(n, h, m, s){
    h = n / 3600;
    m = (n % 3600) / 60;
    s = (n % 3600) % 60;

}


