DECLARE

v_job_id VARCHAR(25);
v_afectadas NUMBER;
job_no_encontrado EXCEPTION;

BEGIN
    v_job_id := 'AAAAA';

-- Update rows in a Table

    UPDATE employees
    SET
        salary = salary * 1.5
    WHERE
        job_id = v_job_id;

    v_afectadas := SQL%rowcount;

IF v_afectadas = 0 THEN
    RAISE job_no_encontrado;
END IF;
dbms_output.put_line('Afectadas: '||v_afectadas);

EXCEPTION
    WHEN job_no_encontrado THEN
        dbms_output.put_line('Ese job no existe: ');
END;