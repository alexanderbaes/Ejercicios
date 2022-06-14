DECLARE
v_departamento departments.department_name%TYPE;
BEGIN

SELECT d.department_name
INTO v_departamento
FROM departments d
WHERE d.department_id = 200;

CASE 
WHEN v_departamento = 'Operations' THEN
DBMS_OUTPUT.PUT_LINE('El departamento se encuentra en el piso 4 ');
WHEN v_departamento IN ('IT Support', 'NOC', 'IT Helpdesk', 'IT') THEN
DBMS_OUTPUT.PUT_LINE('El departamento se encuentra en el piso 3 ');
WHEN 'Government Sales' THEN
DBMS_OUTPUT.PUT_LINE('El departamento se encuentra en el piso 2 ');
ELSE 
DBMS_OUTPUT.PUT_LINE('El departamento se encuentra en el piso 1 ');

END CASE;
END;