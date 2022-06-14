DECLARE
CURSOR empleados IS
 SELECT E.*
 FROM employees E
 WHERE E.COMMISSION_PCT IS NULL AND E.HIRE_DATE <= DATE'2005-12-31'
 FOR UPDATE;
 v_porcentaje_comision NUMBER;
BEGIN

FOR emp IN empleados LOOP
 v_porcentaje_comision := 0;
 
 IF emp.salary BETWEEN 1000 AND 5000 THEN
    v_porcentaje_comision := 0.1;
 ELSIF emp.salary BETWEEN 5001 AND 10000 THEN
    v_porcentaje_comision := 0.2;
 ELSIF emp.salary > 10001 THEN
    v_porcentaje_comision := 0.3;
 END IF;

 DBMS_OUTPUT.PUT_LINE('Empleados: ' ||emp.last_name||', '||emp.first_name||'. con ID: '||emp.employee_id||'. Califica para recibir porcentaje comision.');
 DBMS_OUTPUT.PUT_LINE('Porcentaje asignado: '||v_porcentaje_comision|| ' %.');

 UPDATE employees SET COMMISSION_PCT = v_porcentaje_comision
 WHERE CURRENT OF empleados;

END LOOP;

END;