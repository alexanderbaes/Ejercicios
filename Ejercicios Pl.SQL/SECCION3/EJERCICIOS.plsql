--Dada una determinada opinión, si esta fue de 1 o 2 puntos llenar una variable con el valor "Mala". Si fue de 3 o 4 puntos "Buena" y si fue de 5 puntos "Excelente". Luego imprimir el resultado junto al título de la película.
DECLARE
--VARIABLES DECLARADAS PARA LOS DATOS DE conexionpeliculas
v_id_opinion NUMBER := 20;
v_id_pelicula NUMBER;
v_puntuacion NUMBER;      
v_calificacion VARCHAR(10);
v_titulo VARCHAR(50);
 
BEGIN
    
SELECT puntuacion,idpelicula -- SELECCIONAMOS COLUMNA PUNTUACION Y IDPELICULA
INTO v_puntuacion, v_id_pelicula --VARIABLES PARA LLENAR PUNTUACION Y ID DE PELICULA
FROM opinion  --SELECCIONAMOS LA TABLA OPINION
WHERE idopinion = v_id_opinion; -- ACA DECIMOS QUE EL ID VA SER IGUAL A NUESTRA VARIBLE
    
SELECT titulo -- SELECCIONAMOS COLUMNA TITULO
INTO v_titulo -- VARIABLE PARA LLENAR LOS TITULOS
FROM pelicula -- SELECCIONAMOS LA TABLA PELICULA
WHERE idpelicula = v_id_pelicula; -- ACA DECIMOS QUE EL ID VA SER IGUAL A NUESTRA VARIBLE
    
--SI V_PUNTUACION TIENE PUNTUACION DE 1 O 2 ENTONCES 
IF v_puntuacion IN(1,2) THEN  
--LE DAMOS LA CALIFICACION MALA
    v_calificacion := 'Mala'; 
--SI V_PUNTUACION TIENE PUNTUACION DE 3 O 4 ENTONCES
ELSIF v_puntuacion IN(3,4) THEN 
--LE DAMOS LA CALIFICACION BUENA
    v_calificacion := 'Buena'; 
--SI V_PUNTUACION TIENE PUNTUACION DE 5 ENTONCES
ELSIF v_puntuacion IN(5) THEN 
-- LE DAMOS CALIFICACION EXCELENTE
     v_calificacion := 'Excelente'; 
--CERRAMOS IF
END IF;  
-- MOSTRAMOS TITULO DE LA PELICULA Y SU CALIFICACION  
DBMS_OUTPUT.PUT_LINE('La pelicula: '||v_titulo||' Tiene calificaicon de'||': '||v_calificacion); 

END;

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--Calcular la potencia de un número cualquiera e imprimir el resultado. Ejemplo: 2^4 = 16.

DECLARE
--DECLARAMOS LAS VARIABLES Y LE ASIGNAMOS VALOR
v_base NUMBER(8) := &valor;
v_exponente NUMBER(8) := &valor2;  
v_resultado NUMBER := 1;
v_contador NUMBER := 1;
 
BEGIN
 
--HACEMOS UN BUCLE WHILE  
--MIENTRAS CONTADOR SEA MENOR O IGUAL A EXPONENTE EJECUTAMOS EL WHILE Y USAMOS LOOP PARA CONTROLAR WHILE
WHILE(v_contador <= v_exponente) LOOP  
-- RESULTADO VA A SER IGUAL A RESULTADO POR LA BASE
    v_resultado := v_resultado*v_base; 
    --AUMENTAMOS EL CONTADOR
    v_contador := v_contador+1; 
--CERRAMOS BLOQUE LOOP  
END LOOP;
--MOSTRAMOS EL RESULTADO 
DBMS_OUTPUT.PUT_LINE('El Resultado es: '||v_resultado);
 
END;