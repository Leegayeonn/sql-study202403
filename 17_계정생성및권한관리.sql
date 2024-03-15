
-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ���
-- CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER user1 IDENTIFIED BY user1;

/*
DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/


INSERT INTO hr.departments
VALUES (300, 'test', 100, 1800);

-- ���� ���� �ֱ�
GRANT CREATE SESSION TO user1;

-- ���̺� ��ȸ�� �� �ִ� �����ֱ�
GRANT SELECT ON hr.departments TO user1;

-- ���̺� �����͸� ������ �� �ִ� �����ֱ�
GRANT INSERT ON hr.departments TO user1;

-- ���̺� �����ϴ� �����ֱ�
GRANT CREATE TABLE TO user1;

--�����ڿ� ���ϴ� ���� �ֱ�(TO)
GRANT RESOURCE, CONNECT, DBA TO user1;
-- ���� �ٽ� ���� �ޱ�(FROM)
REVOKE RESOURCE, CONNECT, DBA FROM user1;

-- ���̺��� ����Ǵ� ����� ���̺� �����̽��� �����ϴ� �ڵ�
-- �⺻������ �����Ǵ� users ���̺� �����̽��� ��뷮�� ���������� ����.
ALTER USER user1
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;


-- ����� ���� ����
-- DROP USER [�����̸�] CASCADE;
-- CASCADE ���� �� -> ���̺� or ������ �� ��ü�� �����Ѵٸ� ���� ���� �ȵ�.
DROP USER user1;  -- sql plus ���� quit�ϰ�, ��� ��ü�� ������ ������ ������ �� ����.

DROP USER user1 CASCADE; -- ���� CASCADE ������ ���������� ����



























