
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


