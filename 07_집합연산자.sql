
-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION -> �ߺ� �����͸� ������� ����.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION  
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL -> �ߺ� �����͸� �����.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL  
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT: ������ -> �Ѵ� �ش��ϴ� ��
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT 
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- MINUS: ������(�������� ����) -> ��ȸ������� ������ Ȯ�ΰ���
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- ��ȸ���� �ٲٱ�
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';

