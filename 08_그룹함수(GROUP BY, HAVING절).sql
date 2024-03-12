
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT
-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
SELECT
    ROUND(AVG(salary),2),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; -- �� �� �������� ��
SELECT COUNT(first_name) FROM employees; -- �÷��ϳ��ϴ°ͺ��� �����̼� ��üȮ��
SELECT COUNT(commission_pct) FROM employees; -- NULL�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; -- NULL�� �ƴ� ���� ��

SELECT * FROM employees;


-- �μ����� �׷�ȭ, �׷��Լ��� ���(GROUP BY���� �� �־���Ѵ�.)
SELECT
    department_id,
    COUNT(employee_id)|| '��' AS  �����,
    AVG(salary) AS ��ձ޿� 
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- ��������
-- �׷� �Լ��� �ܵ������� ���� ���� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�. �׷��� �ݵ�� �ʿ��մϴ�.
SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
ORDER BY department_id; -- ����


-- GROUP BY���� ����� �� GROUP���� ������ ���� �÷��� ��ȸ�� �� �����ϴ�.
SELECT
    job_id, -- �׷����� ������ ���� �÷��̹Ƿ� ��ȸ�Ұ���
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- ����


-- GROUP BY�� 2���̻� ��밡��.
SELECT
    job_id, 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;


-- GROUP BY�� ���� �׷�ȭ �� �� ������ �� ��� HAVING�� ���.
-- WHERE�� �Ϲ� ������, GROUP BY���� ���� ����˴ϴ�.
-- GROUP BY�� WHERE���� HAVING
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 10000;


SELECT 
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿������ 5000 �̻� ��ȸ
SELECT 
    department_id,
    AVG(salary) AS �޿����
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY �޿���� DESC;



--------------------------------------------------------------------------------

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id;

SELECT
    job_id,
    AVG(salary) AS ����
FROM employees
GROUP BY job_id
ORDER BY ���� DESC;


/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
SELECT 
    TO_CHAR(hire_date,'YYYY"��"') AS �Ի�⵵,
    COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY"��"')
ORDER BY �Ի�⵵;


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
SELECT
    department_id AS �μ�,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary) >= 7000
ORDER BY department_id;
    

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/

SELECT
    department_id AS �μ����̵�,
    TRUNC(AVG(salary + commission_pct*salary),2) AS ��ձ޿�,
    SUM(salary + commission_pct*salary) AS �޿��հ�,
    COUNT(*) AS ����� 
FROM employees 
WHERE commission_pct IS NOT NULL
GROUP BY department_id
ORDER BY department_id;

SELECT * FROM employees;










































