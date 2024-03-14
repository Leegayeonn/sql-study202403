
-- 오토 커밋 활성화 여부 확인
SHOW AUTOCOMMIT;
-- 오토 커밋 ON
SET AUTOCOMMIT ON;
-- 오토 커밋 OFF
SET AUTOCOMMIT OFF;

SELECT * FROM emps
ORDER BY employee_id DESC;

DELETE FROM emps WHERE employee_id = 100;

INSERT INTO emps
    (employee_id , last_name, email, hire_date, job_id)
VALUES
    (304, 'lee', 'lee1234@naver.com', sysdate, 'cooker');

-- 보류중인 모든 데이터 변경사항을 취소(폐기)
-- 직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료.
ROLLBACK;
    
    
SELECT * FROM emps
ORDER BY employee_id DESC;  

-- 세이브 포인트 생성(오라클TCL전용문법)
-- 롤백할 포인트를 직접 이름을 붙여서 지정.
-- ANSI 표준 문법은 아니기 때문에 그렇게 권장하지는 않음.
SAVEPOINT insert_park;

INSERT INTO emps
    (employee_id , last_name, email, hire_date, job_id)
VALUES
    (305, 'Park', 'park4321@naver.com', sysdate, 'cooker');

-- 세이브 포인트 시점으로 돌아가기
ROLLBACK TO SAVEPOINT insert_park; 

-- 보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료.
-- 커밋 후에는 어떠한 방법을 사용하더라도 되돌릴 수 없습니다.
-- 커밋하면 확정
COMMIT;
    
    
    
    
    
    
    
    
    
    
    
    
    
    

