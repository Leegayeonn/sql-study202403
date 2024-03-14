
-- INSERT
-- ���̺� ���� Ȯ��(describe ����)
DESC departments;

-- (1) INSERT�� ù��° ��� (��� �÷� �����͸� �ѹ��� �����ؼ� ����)
INSERT INTO departments
VALUES(300, '���ߺ�'); -- ����(�÷��� �������� �ʰ� ���� �ִ� ��쿡�� ��簪�� �� ����Ѵ�.NULL��뿩�λ������)

INSERT INTO departments
VALUES(300, '���ߺ�',100, 1500);

SELECT * FROM departments;

-- ���� ������ �ٽ� �ڷ� �ǵ����� Ű����
ROLLBACK; 

-- (2) INSERT�� �ι�° ��� (���� �÷��� �����ϰ� ����, NOT NULL �÷��� Ȯ��!)
INSERT INTO departments
    (department_id, location_id)
VALUES
    (301, 1500); -- ���� NOT NULL�� �� ���� �־�����Ѵ�
ROLLBACK;

-- �纻 ���̺� ����
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false��(1 = 2) �����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ���� �ȵ�
-- CTAS���� �÷��� ������ �����͸� ������ ��, ��������(PK, FK..)���������ʽ��ϴ�.
-- 1) �����ͱ��� ����
CREATE TABLE emps AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

-- 2) ������ ���� ������ �����ϰ������ WHERE false���� �ָ�ȴ�.
CREATE TABLE emps AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM emps;

-- ���̺� ����
DROP TABLE emps;

-- (3) INSERT�� 3��° ��� (��������)
-- CTAS���� �÷��� ������ �����͸� ������ ��, ��������(PK, FK..)���������ʽ��ϴ�.
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);


--------------------------------------------------------------------------------

-- UPDATE
-- UPDATE ���̺��̸� SET �÷�=��(�����İ�갪�� ����), �÷�=��... WHERE ������ ��� ���� ����(������ ��������)
CREATE TABLE emps AS
(SELECT * FROM employees);

SELECT * FROM emps;

-- UPDATE�� ������ ���� ������ ������ �� �������� �� �����ؾ��Ѵ�.
-- �׷��� ������ ���� ����� ��ü ���̺�� �����ȴ�.
UPDATE emps SET salary = 30000; -- ��ü�� �ϰ� ������
-- ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;
SELECT * FROM emps;

UPDATE emps SET salary = salary + salary*0.1
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.1234.1234',manager_id = 102
WHERE employee_id = 100;

-- UPDATE (��������)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (
        SELECT job_id, salary, manager_id
        FROM emps
        WHERE employee_id = 100
    )
WHERE employee_id = 101;

SELECT * FROM emps;

--------------------------------------------------------------------------------

-- DELETE
-- DELETE�� WHERE���� �������� ������ ���̺� ��ü ���� ����� �˴ϴ�.
-- �� ������ ���� �÷����� �Ұ�!
-- �������� �൵ ���� ����
DELETE FROM emps
WHERE employee_id = 103;
SELECT * FROM emps;

-- DELETE(��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');

































































