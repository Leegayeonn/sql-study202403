
-- �����Լ�
-- ROUND(�ݿø�)
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����.������ �ִ� �͵� ����(�ڸ���)
SELECT
    ROUND(3.1415, 3), ROUND(45.923,0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶�.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923,0), TRUNC(45.923, -1)
FROM dual;

-- ABS(���밪)
SELECT ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(������ ������ ����)
SELECT 
    10 / 4, MOD(10, 4)
FROM dual;

--------------------------------------------------------------------------------

-- ��¥ �Լ�
-- sysdate: ��ǻ���� ���糯¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð������� ����
-- �Լ��̱� ������ ��ȣ�� �����ʴ´� (Ű����ó�� ���)
SELECT sysdate AS ���ó�¥ FROM dual;

-- ��, �и���, ǥ�ؽñ��� ǥ��(�߻�������¾���)
SELECT systimestamp FROM dual; 

-- ��¥�� ������ ����.
SELECT sysdate + 1 FROM dual; -- ���� �������길 ����

-- ��¥Ÿ�԰� ��¥Ÿ���� ���� ������ ������.(���� ���Ҽ��ִ�)
-- ������ ������� �ʴ´�.
SELECT 
    first_name, sysdate - hire_date
FROM employees; -- �ϼ�

SELECT 
    first_name,
    (sysdate - hire_date) / 7 AS week
FROM employees; -- �ּ�

SELECT 
    first_name,
    (sysdate - hire_date) / 365 AS year
FROM employees; -- ���


-- ��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual; -- �ð��������� ���� �ݿø�(12������)
SELECT ROUND(sysdate, 'year') FROM dual; -- ��������� �ݿø�
SELECT ROUND(sysdate, 'month') FROM dual; -- ���������� �ݿø�
SELECT ROUND(sysdate, 'day') FROM dual; -- ���ָ� �������� �ݿø�(��~��)

SELECT TRUNC(sysdate) FROM dual; -- �ð��������� ���� ����(12������)
SELECT TRUNC(sysdate, 'year') FROM dual; -- ��������� ����
SELECT TRUNC(sysdate, 'month') FROM dual; -- ���������� ����
SELECT TRUNC(sysdate, 'day') FROM dual; -- ���ָ� �������� ����(��~��)








































