

-- WHILE��

DECLARE 
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- ����� begin
BEGIN
    WHILE v_count <= 10  -- end
    LOOP
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP;
    dbms_output.put_line('1~10���� �հ�: ' || v_total);
END;


-- Ż�⹮ EXIT
DECLARE 
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- ����� begin
BEGIN
    WHILE v_count <= 10  -- end
    LOOP
        EXIT WHEN v_count = 5; -- break
    
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP;
    dbms_output.put_line('1~4 ���� �հ�: ' || v_total);
END;


-- FOR��
DECLARE
    v_num NUMBER := 7; -- ������ 7��

BEGIN
    
    FOR i IN 1..9 -- ��(.) �ΰ��� ���� ǥ�� (1~9)
    LOOP
        dbms_output.put_line(v_num || ' X ' || i || ' = ' || v_num*i);
    END LOOP;
END;


-- CONTINUE�� (¦������ �ǳʶٰ� Ȧ���ܸ� ���)
DECLARE
    v_num NUMBER := 7; -- ������ 7��
BEGIN
    FOR i IN 1..9 -- ��(.) �ΰ��� ���� ǥ�� (1~9)
    LOOP
         CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line(v_num || ' X ' || i || ' = ' || v_num*i);
    END LOOP;
END;

--------------------------------------------------------------------------------
-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
-- ¦���ܸ� ����� �ּ���. (2, 4, 6, 8)
-- ����� ����Ŭ ������ �߿��� �������� �˾Ƴ��� �����ڰ� �����. (% ����~)
DECLARE 
    v_num NUMBER;
BEGIN
    
    FOR v_num IN 1..9
    LOOP
    CONTINUE WHEN MOD(v_num, 2) <> 0;
    dbms_output.put_line('****'|| v_num ||'�� ****');
    
        FOR i IN 1..9
        LOOP
        
            dbms_output.put_line(v_num || ' X ' || i || ' = ' || v_num*i);
        END LOOP;
    END LOOP;
END;




-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ....

CREATE TABLE board (
    bno NUMBER(30),
    writer VARCHAR2(100),
    title VARCHAR2(100)
);

SELECT * FROM board
ORDER BY bno;

CREATE SEQUENCE board_seq
    START WITH 1 -- ��������
    INCREMENT BY 1 -- ��������
    MAXVALUE 300
    NOCYCLE
    NOCACHE;
    
DROP SEQUENCE board_seq;
    
DECLARE 
    v_bno NUMBER;
    v_writer VARCHAR2(100);
    v_title VARCHAR2(100);
BEGIN

    FOR i IN 1..300 
    LOOP
    INSERT INTO board(bno, writer, title)
    VALUES (board_seq.nextval,'test'|| i ,'title'|| i);
    
    END LOOP;
END;

COMMIT;

-- WHILE������ �ۼ�
DECLARE 
    v_num NUMBER := 1;
BEGIN

    WHILE v_num <= 300
    LOOP
        INSERT INTO board
        VALUES (board_seq.NEXTVAL,'test'|| v_num ,'title'|| v_num);
        v_num := v_num + 1;
    
    END LOOP;
END;









































































