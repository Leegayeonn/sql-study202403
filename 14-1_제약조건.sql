
-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű) - NULL �����
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)- NULL ���!
-- NOT NULL: null�� ������� ����. (�ʼ���) , �ߺ����
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ����)
CREATE TABLE dept2 (  -- �������� �ĺ��ڴ� ��������(����Ŭ�� �˾Ƽ� �̸�����)
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY, --���̺��_�÷���_��������(���) ��������
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, -- �ʼ���, �ߺ�������(�����������)
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), -- �����ϰ� �ִٴ� ��
    dept_bonus NUMBER(10) CONSTRAINT dep2_bonus_ck CHECK(dept_bonus > 10000 ),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))  --male, female (m/f)
);

SELECT * FROM dept2;

DROP TABLE dept2;

-- ���̺� ���� ���� ���� (��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2 (  
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL, 
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1),

    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name), 
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id), 
    CONSTRAINT dep2_bonus_ck CHECK(dept_bonus > 10000 ),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))  
);
SELECT * FROM dept2;
ROLLBACK;

-- �ܷ� Ű foriegn key�� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���.
INSERT INTO dept2
VALUES(10, '�濵����', 6542, 90000, 'M'); -- ����(��ġ�ϴ� location_id�� ����)

INSERT INTO dept2
VALUES(20, '��������', 1900, 90000, 'M');


-- ������ ���� �������� �˻�!
UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; -- ����(�ܷ�Ű �������� ����)

UPDATE dept2
SET dept_no = 20
WHERE dept_no = 10; -- ����(�ֿ�Ű �������� ����,PK �ߺ�)

UPDATE dept2
SET dept_bonus = 900
WHERE dept_no = 10; -- ����(check �������� ����)


-- ���̺� ���� ���� �������� �߰� �� ����, ����
-- ���������� �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ��մϴ�.

CREATE TABLE dept2 (  
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL, 
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1)    
);
SELECT * FROM dept2;
DESC dept2;
-- pk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);
-- fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000); 
-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name); 
-- NOT NULL�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- ���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2';

-- ���� ���� ���� (���� ������ �̸����� -> �̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
ALTER TABLE dept2 DROP CONSTRAINT dept2_deptno_pk;


--------------------------------------------------------------------------------
-- �������� 

--���� 1
CREATE TABLE members (
    m_name VARCHAR2(3) NOT NULL,
    m_num NUMBER(10),
    reg_date DATE NOT NULL,
    gender VARCHAR2(1),
    loca NUMBER(4),
    
    CONSTRAINT mem_memnum_pk PRIMARY KEY(m_num),
    CONSTRAINT mem_regdate_uk UNIQUE(reg_date),
    CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id)
);

INSERT INTO members
VALUES ('AAA', 1, '2018/07/01','M', 1800);

INSERT INTO members
VALUES ('BBB', 2, '20180702','F', 1900);

INSERT INTO members
VALUES ('CCC', 3, '20180703','M', 2000);

INSERT INTO members
VALUES ('DDD', 4, sysdate, 'M', 2000);

ROLLBACK;
SELECT * FROM members;

COMMIT;

-- ���� 2
SELECT 
    m.m_name, m.m_num, 
    loc.street_address, loc.location_id
FROM members m
JOIN locations loc
ON m.loca = loc.location_id
ORDER BY m.m_num;





























