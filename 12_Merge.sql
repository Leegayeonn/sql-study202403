
-- MERGE: ���̺� ����.

/*
UPDATE��  INSERT�� �ѹ濡 ó��

�� ���̺� �ش��ϴ� �����Ͱ� �����Ѵٸ� 
UPDATE�� ó��
������ INSERT�� ó��
*/
-- 1) ������ ���̺� ����(�����ʹ� ����)
CREATE TABLE emps_it AS (SELECT * FROM employees WHERE 1 = 2);

-- 2) ������ ���̺� ������ �ֱ�
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (106, '���', '��', 'CHOONSIK', sysdate, 'IT_PROG');
    
SELECT * FROM emps_it; -- ����

SELECT * FROM employees -- ����������
WHERE job_id = 'IT_PROG';

-- 3) ���θ��� ���̺� ����(employee_id 106���� �����Ͱ� ����)
MERGE INTO emps_it a -- ������ �� Ÿ�� ���̺�
    USING -- ���ս�Ų ������(���̺� �̸�, �������� ��....)
        (SELECT * FROM employees
        WHERE job_id = 'IT_PROG') b -- �����ϰ��� �ϴ� �����͸� ���������� ǥ����(���̺�����)
    ON -- ���ս�ų �������� ��������
        (a.employee_id = b.employee_id) -- employee_id �÷��� ���� ���� ������ ���� ���� Ȯ��.
WHEN MATCHED THEN -- �ٷ� ���� �ۼ��� ������ ��ġ�ϴ°�� (������ �����Ͱ� �ִ°��)
    UPDATE SET 
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
    /*
        DELETE�� �ܵ����� �� ���� �����ϴ�.
        UPDATE ���Ŀ� DELETE �ۼ��� �����մϴ�.
        UPDATE �� ����� DELETE �ϵ��� ����Ǿ� �ֱ� ������
        ������ ��� �÷����� ������ ������ �ϴ� UPDATE�� �����ϰ�
        DELETE�� WHERE���� �Ʊ� ������ ������ ���� �����ؼ� �����մϴ�.
     */
    DELETE 
        WHERE a.employee_id = b.employee_id
        
WHEN NOT MATCHED THEN -- ������ ��ġ���� �ʴ°��
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);

-- 4) ���� Ȯ��
-- employee_id 106�� UPDATE�� 
SELECT * FROM emps_it;

--------------------------------------------------------------------------------

-- ���� ����(����)�� ������ �߰��� INSERT ��!
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '����', '��', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '�ϳ�', '��', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '���', '��', 'HMSON', '20/04/06', 'AD_VP');

-- ���� �� �߰��� ���̺� Ȯ��
SELECT * FROM emps_it;

/*
employees ���̺��� �Ź� ����ϰ� �����Ǵ� ���̺��̶�� ��������.
������ �����ʹ� email, phone, salary, comm_pct, man_id, dept_id��
������Ʈ �ϵ��� ó��
���� ���Ե� �����ʹ� �״�� �߰�.
*/

MERGE INTO emps_it a
    USING 
        employees b -- ���̺���ü��
    ON 
        (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET 
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
        (b.employee_id, b.first_name, b.last_name,
        b.email, b.phone_number, b.hire_date, b.job_id,
        b.salary, b.commission_pct, b.manager_id, b.department_id);
        
SELECT * FROM emps_it
ORDER BY employee_id ASC;

ROLLBACK;


--------------------------------------------------------------------------------

CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts;


ROLLBACK;
DELETE FROM depts;
DROP TABLE depts;

-- ���� 1
INSERT INTO depts
    (department_id, department_name, location_id)
VALUES
    (280, '����',1800);
    
INSERT INTO depts
    (department_id, department_name, location_id)
VALUES
    (290, 'ȸ���',1800);
INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '����', 301,1800);
INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (310, '�λ�',302,1800);
    INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '����',303,1700);
    

    
-- ���� 2
-- 1)
SELECT * FROM depts;

UPDATE depts SET department_name = 'IT bank'
WHERE department_name = 'IT Support';

ROLLBACK;
-- 2) 
UPDATE depts SET manager_id = 301
WHERE department_id = 290;

-- 3)
UPDATE depts 
SET 
    department_name = 'IT Help',
    manager_id = 303, 
    location_id = 1800
WHERE department_name = 'IT Helpdesk';

-- 4) 
UPDATE depts SET manager_id = 301
WHERE department_id IN (290, 300, 310, 320);

SELECT * FROM depts;

-- ����3
-- 1)
DELETE FROM depts
WHERE department_id = (SELECT department_id FROm depts
                        WHERE department_name = '����');
ROLLBACK;
-- 2)
DELETE FROM depts
WHERE department_id = (SELECT department_id FROm depts
                        WHERE department_name = 'NOC');

-- ����4
-- 1)
DELETE FROM depts
WHERE department_id > 200;

-- 2) 
UPDATE depts SET manager_id = 100
WHERE manager_id IS NOT NULL;

-- 3) 
SELECT * FROM depts; -- Ÿ�����̺�

-- 4)
MERGE INTO depts d
    USING 
        departments dt -- ���̺���ü��
    ON 
        (d.department_id = dt.department_id)
WHEN MATCHED THEN
    UPDATE SET
        d.department_name = dt.department_name,
        d.manager_id = dt.manager_id,
        d.location_id = dt.location_id
        
WHEN NOT MATCHED THEN
    INSERT VALUES
        (dt.department_id, dt.department_name, dt.manager_id, dt.location_id);
        

-- ���� 5
-- 5-1)
CREATE TABLE jobs_it AS (SELECT * FROM jobs WHERE min_salary > 6000);
SELECT * FROM jobs_it;

-- 5-2)
INSERT INTO jobs_it 
VALUES('IT_DEV', '����Ƽ������', 6000, 20000);
INSERT INTO jobs_it 
VALUES('NET_DEV', '��Ʈ��ũ������', 5000, 20000);
INSERT INTO jobs_it 
VALUES('SEC_DEV', '���Ȱ�����', 6000, 19000);

-- 5-3)
SELECT * FROM jobs_it; -- Ÿ�����̺�
SELECT * FROM jobs;
-- 5-4)
MERGE INTO jobs_it j
    USING 
        (SELECT 
            *
        FROM jobs  WHERE min_salary > 5000
        ) js
    ON (j.job_id = js.job_id) 
WHEN MATCHED THEN
    UPDATE SET 
        j.min_salary = js.min_salary,
        j.max_salary = js.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
        (js.job_id, js.job_title, js.min_salary,js.max_salary);



















