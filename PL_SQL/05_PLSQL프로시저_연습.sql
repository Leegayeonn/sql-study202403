
/*
���ν����� divisor_proc
���� �ϳ��� ���޹޾� �ش� ���� ����� ������ ����ϴ� ���ν����� �����մϴ�.
*/
CREATE OR REPLACE PROCEDURE divisor_proc
    (d_num IN NUMBER)
IS
    d_count NUMBER := 0;
BEGIN
    d_count := 0;
    
    FOR i IN 1..d_num
    LOOP
        IF MOD(d_num, i) = 0 THEN
         d_count := d_count + 1;
         
         
    END IF;
    END LOOP;
    dbms_output.put_line(d_num ||'�� ����� ����: '|| d_count);
    
END;

EXEC divisor_proc(3);


/*
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/
CREATE OR REPLACE PROCEDURE depts_proc
    (
    p_dep_id IN departments.department_id%TYPE,
    p_dep_name IN departments.department_name%TYPE,
    p_flag IN VARCHAR2
    )
IS
    v_cnt NUMBER := 0;
BEGIN

    SELECT 
        COUNT(*)
    INTO v_cnt
    FROM depts
    WHERE department_id = p_dep_id;

    CASE
    WHEN p_flag = 'I' THEN
        INSERT INTO depts (department_id, department_name)
        VALUES(p_dep_id, p_dep_name);
        dbms_output.put_line('�μ������ �Ϸ�Ǿ����ϴ�.');
            
    WHEN p_flag = 'U' THEN
    
        IF v_cnt = 0 THEN
            dbms_output.put_line('�����ϰ��� �ϴ� �μ��� �������� �ʽ��ϴ�.');
            RETURN;
        END IF; 
    
    
        UPDATE depts SET department_name = p_dep_name
        WHERE department_id = p_dep_id;
        
    WHEN p_flag = 'D' THEN
        
        IF v_cnt = 0 THEN
            dbms_output.put_line('�����ϰ��� �ϴ� �μ��� �������� �ʽ��ϴ�.');
            RETURN;
        END IF;   
        
        DELETE depts 
        WHERE department_id = p_dep_id;
    ELSE 
        dbms_output.put_line('�ش� flag�� ���� ������ �غ���� �ʾҽ��ϴ�.');
    END CASE;
    COMMIT;
    
    EXCEPTION 
    WHEN OTHERS THEN
        dbms_output.put_line('���ܰ� �߻��߽��ϴ�.');
        dbms_output.put_line('ERROR msg: '|| SQLERRM);
        ROLLBACK;
END;

EXEC depts_proc(80, '������', 'I');

-- �������� �ɾ department_id �ߺ����� 
ALTER TABLE depts ADD CONSTRAINT depts_deptno_pk PRIMARY KEY(department_id);



SELECT * FROM depts;



/*
employee_id�� ���޹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/
CREATE OR REPLACE PROCEDURE emp_hire_proc
    (
    p_emp_id IN employees.employee_id%TYPE,
    p_year OUT NUMBER
    )
IS
  v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT 
        hire_date
    INTO 
        v_hire_date
    FROM employees
    WHERE employee_id = p_emp_id;

    p_year := TRUNC((sysdate - v_hire_date)/ 365);
    
    EXCEPTION 
    WHEN OTHERS THEN
        dbms_output.put_line('�ش� ���̵�� �����ϴ�.');
       p_year := 0;
END;

DECLARE 
    v_year NUMBER;
BEGIN
    emp_hire_proc(100, v_year);
    IF v_year > 0 THEN
        dbms_output.put_line('�ټӳ��: '|| v_year || '��');
    END IF;
END;






















































