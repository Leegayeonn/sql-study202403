

-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
-- ��¥�� ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
SELECT TO_CHAR(sysdate)FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS') FROM dual;


-- ���Ĺ��ڿ� �Բ� ����ϰ� ���� ���ڸ� ""�� ���μ� �����Ѵ�
-- ���Ĺ���(-,:)�� �ƴ� �Ϲݹ��ڸ� �����Ϸ��� �ֵ���ǥ�� �������Ѵ�.
SELECT 
TO_CHAR(sysdate, 'YYYY"��" MM"��" DD"��"') 
FROM dual;

-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
-- �ڸ����� ǥ���Ϸ���(�޸�ǥ��)'9'�� �̿��Ͽ� ǥ��(���� ���� 9�� �ƴϰ� �ڸ����� ǥ���ϴ� ��ȣ)
SELECT TO_CHAR(20000)FROM dual;
SELECT TO_CHAR(20000, '99,999')FROM dual;
SELECT TO_CHAR(20000, 'L99,999')FROM dual; -- DB�ش�����(����)ȭ��� ǥ��
SELECT TO_CHAR(20000.2915, '99999.999')FROM dual; -- �ݿø� ����

SELECT 
    first_name,
    TO_CHAR(salary, '$99,999') AS salary
FROM employees;

-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ����� ����ȯ(���� -> ����)
SELECT TO_NUMBER ('2000') + 2000 FROM dual; -- ����� ����ȯ
SELECT '$3,300' + 2000 FROM dual; -- ����
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual; -- ���ڿ� ���ڸ� �������ָ� ����

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13') FROM dual;
SELECT TO_DATE('20230413') FROM dual;
-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�.�Ϻθ� ��ȯ�� �� �����ϴ�.
SELECT TO_DATE('2021-03-31 12:23:50', 'YY-MM-DD HH:MI:SS') FROM dual;

SELECT TO_DATE('2024�� 02�� 12��', 'YYYY"��" MM"��" DD"��"') FROM dual;


-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�غ�����
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ
SELECT '20050102' FROM dual;

SELECT 
    TO_CHAR(
        TO_DATE('20050102', 'YYYYMMDD'),
        'YYYY"��" MM"��" DD"��"'
    ) AS dateInfo
FROM dual;

--------------------------------------------------------------------------------

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�) -> NULL�� ���� ������
SELECT 
    first_name,
    NVL(commission_pct, 0) AS comm_pct
FROM employees;


-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL2(�÷�, null�� �ƴ� ����� ��, null�� ����ǰ�)
SELECT 
    first_name,
    salary,
    NVL2(
        commission_pct,
        salary + (salary * commission_pct),
        salary
    ) AS real_salary
FROM employees;

-- null�� ������ ���� �ʽ��ϴ�.
SELECT 
    first_name,
    salary,
    salary + (salary * commission_pct)
FROM employees;


-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2 ...... default)
-- ����Ŭ ���� �Լ�. ���� �񱳸� ����(��ġ�ϴ����� �񱳰���!) 
SELECT
    first_name,
    job_id,
    salary,
    DECODE(
        job_id, 
        'IT_PROG', salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3,
        salary
    ) AS result
FROM employees;

-- CASE WHEN THEN END
-- ANSI ǥ�� ���� 
-- �񵿵�񱳵� ����
SELECT 
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'FI_ACCOUNT' THEN salary*1.4
        ELSE salary
    END) AS result
FROm employees;

/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/
SELECT 
    hire_date AS �Ի�����,
    first_name AS �̸�,
    TRUNC((sysdate - hire_date) / 365, 0) AS �ټӳ��
FROM employees
WHERE(sysdate - hire_date) / 365 >= 17
ORDER BY �ټӳ�� DESC;


/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/

SELECT 
    department_id,
    first_name,
    manager_id,
    (CASE manager_id
        WHEN 100 THEN '���'
        WHEN 120 THEN '����'
        WHEN 121 THEN '�븮'
        WHEN 122 THEN '����'
        ELSE '�ӿ�'
    END) AS ����
FROM employees
WHERE department_id = 50;





























































