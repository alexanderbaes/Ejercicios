--Prueba de if - else
DECLARE
edad NUMBER;
 
BEGIN
 
edad := 18;

IF edad >= 18 THEN
DBMS_OUTPUT.put_line('Eres mayor de edad:');
ELSE 
DBMS_OUTPUT.put_line('Eres menor de edad:');
END IF;
 
END;

--OTRA PRUEBA

DECLARE
v_salary NUMBER;

BEGIN

-- Select rows from a Table

SELECT E.salary
INTO v_salary
FROM EMPLOYEES E 
WHERE E.employee_id=200;

IF v_salary > 1000 AND v_salary <= 5000 THEN
DBMS_OUTPUT.put_line('Empleado de categoria C ');

END IF;

IF v_salary > 5000 AND v_salary <= 10000 THEN
DBMS_OUTPUT.put_line('Empleado de categoria B ');

END IF;

IF v_salary > 10000  THEN
DBMS_OUTPUT.put_line('Empleado de categoria A ');

END IF;

END;


--if anidados

DECLARE
v_salary NUMBER;

BEGIN

-- Select rows from a Table

SELECT E.salary
INTO v_salary
FROM EMPLOYEES E 
WHERE E.employee_id=200;

IF v_salary BETWEEN 1000 AND 5000 THEN
DBMS_OUTPUT.put_line('Empleado de categoria C ');

ELSIF v_salary BETWEEN 5000 AND 10000 THEN
DBMS_OUTPUT.put_line('Empleado de categoria B ');

ELSIF v_salary > 10000  THEN
DBMS_OUTPUT.put_line('Empleado de categoria A ');

END IF;

END;