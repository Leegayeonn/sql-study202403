
-- ����Ŭ�� �� �� �ּ��Դϴ�.

/*
���� �� �ּ��Դϴ�.
���K~
*/
-- ��ȸ�Ҷ� �⺻ �ۼ����
-- SELECT [�÷���(������ ����)] FROM [���̺� �̸�]
-- ��ҹ��� ���� �������� �ڵ� �������� ���� Ű���带 �빮�ڷ� �ۼ��Ѵ�.
-- Ű����: �빮��, �ĺ���: �ҹ���
-- ª���� ���ٷ�, ������� �ٰ����Ͽ� ���.


-- ��� �÷� ���ý� "*" ���
SELECT * FROM employees; -- (employees���� ���� ��� �÷��� �����ϰڴ�)
    
-- Ư�� ���ϴ� �÷��� �����Ҷ�
SELECT 
    employee_id, 
    first_name, 
    last_name 
FROM 
    employees;
    
SELECT email, phone_number, hire_date
FROM employees;
    
    
-- �÷��� ��ȸ�ϴ� ��ġ���� * / + - ������ �����մϴ�.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS ������
    -- ��ȸ���뿡�� �߰� ���� ���̺� �߰��Ǵ°��� �ƴ� 
FROM employees;

-- NULL ���� Ȯ�� (���� ���°����� ���� 0�̳� ������� �ٸ� �����Դϴ�.)
SELECT department_id, commission_pct
FROM employees;


-- alias (�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
-- ��ȸ������̸��� ��Ī���� ���ü��ְ� �Ҽ��ִ�(AS[���泻��])
SELECT
    first_name AS �̸�,
    last_name AS ��,
    salary AS �޿�
FROM employees;


-- ���ڸ� ��������(+) ��밡��
-- ���ڴ� || ���
-- ���ڴ� '' �ȿ� ��� (�������� ���� ǥ������)
-- Ư����ȣ Ȭ����ǥ�� '' �ι������� �ȴ�!
/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ�� 
ǥ���ϰ� �ʹٸ� ''�� �ι� �������� ���
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���������� ������� �ʽ��ϴ�.
*/
SELECT
    first_name || ' ' || last_name || '''s salary is $' || salary AS �޿�����
FROM employees;

-- DISTINCT (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;


-- ROWNUM, ROWID (���ȣ, ����̵�)
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ��ȯ)- ����¡�Ҷ� �����ϰ� ����
-- (�ο���̵�: �����ͺ��̽� ���� ���� �ּҸ� ��ȯ)
SELECT ROWNUM, ROWID, employee_id
FROM employees;
    
    
    
    
    
    
    