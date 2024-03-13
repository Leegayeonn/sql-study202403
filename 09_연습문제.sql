
/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/
-- INNER : 106��
SELECT *
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id;

-- LEFT OUTER : 107��
SELECT *
FROM employees e 
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- RIGHT OUTER : 122��
SELECT *
FROM employees e 
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- FULL OUTER : 123��
SELECT *
FROM employees e 
FULL JOIN departments d
ON e.department_id = d.department_id;

/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/
SELECT 
    first_name || ' ' || last_name AS name,
    d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;



/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/
SELECT * FROM employees;
SELECT * FROM jobs;


SELECT 
    e.first_name AS �̸�,
    e.job_id AS �������̵�,
    j.job_title AS ����Ÿ��Ʋ
FROM employees e 
JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name;


/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/

SELECT * FROM jobs;
SELECT * FROM job_history;

SELECT *
FROM jobs js 
LEFT JOIN job_history jh
ON js.job_id = jh.job_id;


/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/
SELECT * FROM employees;
SELECT * FROM departments;


SELECT 
     first_name || ' ' || last_name AS �̸�,
     d.department_name AS �μ���
FROM employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id
WHERE first_name = 'Steven'
AND last_name = 'King';


/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/
SELECT *
FROM employees
CROSS JOIN departments
ORDER BY employees.employee_id; -- 2889��

/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT
    e.employee_id AS �����ȣ,
    e.first_name AS �̸�, 
    e.salary AS �޿�,
    d.department_name AS �μ���, 
    loc.city AS �ٹ���
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';




/*
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/
SELECT * FROM employees;
SELECT * FROM jobs;

SELECT 
    *
FROM employees e
LEFT JOIN jobs js
ON e.job_id = js.job_id
WHERE js.job_title = 'Stock Manager'
OR js.job_title = 'Stock Clerk';

/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;


SELECT 
    d.department_id AS �μ���,
    d.department_name AS �μ��̸�
FROM departments d
LEFT JOIN  employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;



/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/
SELECT 
    e1.first_name AS ���,
    e2.first_name AS �ش�Ŵ���
FROM employees e1
LEFT JOIN employees e2
ON e2.employee_id = e1.manager_id
ORDER BY e2.first_name;


/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���.
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���.
*/
SELECT * FROM employees;

SELECT 
    e1.first_name AS ���,
    e1.manager_id AS �����ھ��̵�, 
    e2.first_name AS �Ŵ����̸�, 
    e2.salary AS �Ŵ����޿�
FROM employees e1
LEFT JOIN employees e2
ON e2.employee_id = e1.manager_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e2.salary DESC;
































