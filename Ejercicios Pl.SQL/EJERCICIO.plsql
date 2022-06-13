--Traer e imprimir el año de estreno más alto.
DECLARE
variableaño NUMBER;
 
BEGIN
 
SELECT MAX(año)
INTO variableaño
FROM pelicula;
 
DBMS_OUTPUT.put_line('El año mas alto es: '||variableaño);
 
END;






--Traer la descripción de la película "Coco". Si es nula, reemplazarlo por "-Sin descripción-"

DECLARE
vdescripcion varchar(255);
 
BEGIN
 
SELECT nvl(descripcion,'-Sin descripción-')
INTO vdescripcion
FROM pelicula
WHERE idpelicula = 6;
 
DBMS_OUTPUT.put_line(vdescripcion);
 
END;




--Armar e imprimir una descripción corta de cualquier película con el siguiente formato: (año de estreno) - Primeros 40 caracteres de la descripción...
DECLARE 
vdescripcion VARCHAR(255);  
vdescripcion_corta VARCHAR(40); 
vaño NUMBER;
v_idpelicula NUMBER;
 
BEGIN
 
SELECT descripcion,año
INTO vdescripcion, vaño
FROM pelicula
WHERE idpelicula = 1;
 
vdescripcion_corta := SUBSTR(vdescripcion,1,40);
 
DBMS_OUTPUT.put_line('('|| vaño ||') - '|| vdescripcion_corta ||'...');
 
END;

