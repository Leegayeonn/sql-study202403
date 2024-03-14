
-- ���� Ŀ�� Ȱ��ȭ ���� Ȯ��
SHOW AUTOCOMMIT;
-- ���� Ŀ�� ON
SET AUTOCOMMIT ON;
-- ���� Ŀ�� OFF
SET AUTOCOMMIT OFF;

SELECT * FROM emps
ORDER BY employee_id DESC;

DELETE FROM emps WHERE employee_id = 100;

INSERT INTO emps
    (employee_id , last_name, email, hire_date, job_id)
VALUES
    (304, 'lee', 'lee1234@naver.com', sysdate, 'cooker');

-- �������� ��� ������ ��������� ���(���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����.
ROLLBACK;
    
    
SELECT * FROM emps
ORDER BY employee_id DESC;  

-- ���̺� ����Ʈ ����(����ŬTCL���빮��)
-- �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����.
SAVEPOINT insert_park;

INSERT INTO emps
    (employee_id , last_name, email, hire_date, job_id)
VALUES
    (305, 'Park', 'park4321@naver.com', sysdate, 'cooker');

-- ���̺� ����Ʈ �������� ���ư���
ROLLBACK TO SAVEPOINT insert_park; 

-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����.
-- Ŀ�� �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
-- Ŀ���ϸ� Ȯ��
COMMIT;
    
    
    
    
    
    
    
    
    
    
    
    
    
    

