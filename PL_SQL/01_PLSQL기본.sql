
/*
# PL/SQL
- ����Ŭ���� �����ϴ� SQL ���α׷��� ����̴�.
- �Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��� ������ ó���� ����
 ������ �� �� �ִ� ���������� �ڵ� �ۼ� ����Դϴ�.
- �������� �������� ��� ������ �ϰ� ó���ϱ� ���� �뵵�� ����մϴ�.
*/

-- Ctrl Enter �ƴϰ�
-- F9 ����!!!!


SET SERVEROUTPUT ON; -- ��¹� Ȱ��ȭ

-- �͸� ��� ����
DECLARE  -- ������ �����ϴ� ����(�����)

    emp_num NUMBER; -- ��������

BEGIN -- �ڵ带 �����ϴ� ����(�����)

    emp_num := 10; -- ���� ������ :=
    DBMS_OUTPUT.put_line(emp_num);
    DBMS_OUTPUT.put_line('Hello pl/sql!');
    
END; -- PL/SQL�� ������ ����(�����)

/*
- DML��
DDL���� ����� �Ұ����ϰ�, �Ϲ������� SQL���� SELECT ���� ����ϴµ�, 
Ư���� ���� SELECT�� �Ʒ��� INTO���� ����ؼ� ������ �Ҵ��� �� �ֽ��ϴ�.
*/

DECLARE 
    v_emp_name VARCHAR2(50); -- ����� ����(���ڿ� Ÿ���� �������� �ʿ�)
    v_dep_name departments.department_name%TYPE; -- �μ��� ����
BEGIN
    SELECT 
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ��ȸ ����� ������ ����
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 103;
    
    dbms_output.put_line(v_emp_name || '-' || v_dep_name);
END;

-- 2. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
<JOB_ID>: CEO
*/
DECLARE 
    v_emp_max employees.employee_id%TYPE; -- �μ��� ����
BEGIN
    SELECT 
       MAX(employee_id)
    INTO
       v_emp_max 
    FROM employees;
    
    dbms_output.put_line(v_emp_max);
    
    INSERT INTO emps 
        (employee_id, last_name, email, hire_date, job_id)
    VALUES (v_emp_max + 1, 'steven','stevenjobs', sysdate, 'CEO');
    
    
END;


SELECT * FROM emps;






























































