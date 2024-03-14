
-- INSERT
-- 테이블 구조 확인(describe 묘사)
DESC departments;

-- (1) INSERT의 첫번째 방법 (모든 컬럼 데이터를 한번에 지정해서 삽입)
INSERT INTO departments
VALUES(300, '개발부'); -- 에러(컬럼을 지정하지 않고 값만 주는 경우에는 모든값을 다 줘야한다.NULL허용여부상관없이)

INSERT INTO departments
VALUES(300, '개발부',100, 1500);

SELECT * FROM departments;

-- 실행 시점을 다시 뒤로 되돌리는 키워드
ROLLBACK; 

-- (2) INSERT의 두번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 컬럼을 확인!)
INSERT INTO departments
    (department_id, location_id)
VALUES
    (301, 1500); -- 에러 NOT NULL은 꼭 값을 넣어줘야한다
ROLLBACK;

-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값(1 = 2) 지정하면 -> 테이블의 구조만 복사되고 데이터는 복사 안됨
-- CTAS문은 컬럼의 구조와 데이터를 복사할 뿐, 제약조건(PK, FK..)복제되지않습니다.
-- 1) 데이터까지 복사
CREATE TABLE emps AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

-- 2) 데이터 말고 구조만 복사하고싶을때 WHERE false값을 주면된다.
CREATE TABLE emps AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM emps;

-- 테이블 삭제
DROP TABLE emps;

-- (3) INSERT의 3번째 방법 (서브쿼리)
-- CTAS문은 컬럼의 구조와 데이터를 복사할 뿐, 제약조건(PK, FK..)복제되지않습니다.
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);


--------------------------------------------------------------------------------

-- UPDATE
-- UPDATE 테이블이름 SET 컬럼=값(연산후계산값도 가능), 컬럼=값... WHERE 수정할 대상에 대한 조건(누구를 수정할지)
CREATE TABLE emps AS
(SELECT * FROM employees);

SELECT * FROM emps;

-- UPDATE를 진행할 때는 누구를 수정할 지 조건으로 잘 지목해야한다.
-- 그렇지 않으면 수정 대상이 전체 테이블로 지정된다.
UPDATE emps SET salary = 30000; -- 전체가 일괄 수정됨
-- ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;
SELECT * FROM emps;

UPDATE emps SET salary = salary + salary*0.1
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.1234.1234',manager_id = 102
WHERE employee_id = 100;

-- UPDATE (서브쿼리)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (
        SELECT job_id, salary, manager_id
        FROM emps
        WHERE employee_id = 100
    )
WHERE employee_id = 101;

SELECT * FROM emps;

--------------------------------------------------------------------------------

-- DELETE
-- DELETE도 WHERE절을 지정하지 않으면 테이블 전체 행이 대상이 됩니다.
-- 행 삭제만 가능 컬럼삭제 불가!
-- 여러개의 행도 삭제 가능
DELETE FROM emps
WHERE employee_id = 103;
SELECT * FROM emps;

-- DELETE(서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');

































































