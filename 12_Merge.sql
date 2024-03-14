
-- MERGE: 테이블 병합.

/*
UPDATE와  INSERT를 한방에 처리

한 테이블에 해당하는 데이터가 존재한다면 
UPDATE로 처리
없으면 INSERT로 처리
*/
-- 1) 머지할 테이블 생성(데이터는 없이)
CREATE TABLE emps_it AS (SELECT * FROM employees WHERE 1 = 2);

-- 2) 생성한 테이블에 데이터 넣기
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (106, '춘식', '김', 'CHOONSIK', sysdate, 'IT_PROG');
    
SELECT * FROM emps_it; -- 예비

SELECT * FROM employees -- 원본데이터
WHERE job_id = 'IT_PROG';

-- 3) 새로만든 테이블에 머지(employee_id 106으로 데이터가 같음)
MERGE INTO emps_it a -- 머지를 할 타겟 테이블
    USING -- 병합시킨 데이터(테이블 이름, 서브쿼리 등....)
        (SELECT * FROM employees
        WHERE job_id = 'IT_PROG') b -- 병합하고자 하는 데이터를 서브쿼리로 표현함(테이블도가능)
    ON -- 병합시킬 데이터의 연결조건
        (a.employee_id = b.employee_id) -- employee_id 컬럼을 통해 양쪽 데이터 존재 유무 확인.
WHEN MATCHED THEN -- 바로 위에 작성한 조건이 일치하는경우 (동일한 데이터가 있는경우)
    UPDATE SET 
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
    /*
        DELETE만 단독으로 쓸 수는 없습니다.
        UPDATE 이후에 DELETE 작성이 가능합니다.
        UPDATE 된 대상을 DELETE 하도록 설계되어 있기 때문에
        삭제할 대상 컬럼들을 동일한 값으로 일단 UPDATE를 진행하고
        DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제합니다.
     */
    DELETE 
        WHERE a.employee_id = b.employee_id
        
WHEN NOT MATCHED THEN -- 조건이 일치하지 않는경우
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);

-- 4) 머지 확인
-- employee_id 106이 UPDATE됨 
SELECT * FROM emps_it;

--------------------------------------------------------------------------------

-- 위에 머지(병합)후 데이터 추가로 INSERT 함!
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');

-- 머지 후 추가된 테이블 확인
SELECT * FROM emps_it;

/*
employees 테이블을 매번 빈번하게 수정되는 테이블이라고 가정하자.
기존의 데이터는 email, phone, salary, comm_pct, man_id, dept_id을
업데이트 하도록 처리
새로 유입된 데이터는 그대로 추가.
*/

MERGE INTO emps_it a
    USING 
        employees b -- 테이블자체로
    ON 
        (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET 
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
        (b.employee_id, b.first_name, b.last_name,
        b.email, b.phone_number, b.hire_date, b.job_id,
        b.salary, b.commission_pct, b.manager_id, b.department_id);
        
SELECT * FROM emps_it
ORDER BY employee_id ASC;

ROLLBACK;


--------------------------------------------------------------------------------

CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts;


ROLLBACK;
DELETE FROM depts;
DROP TABLE depts;

-- 문제 1
INSERT INTO depts
    (department_id, department_name, location_id)
VALUES
    (280, '개발',1800);
    
INSERT INTO depts
    (department_id, department_name, location_id)
VALUES
    (290, '회계부',1800);
INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '재정', 301,1800);
INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (310, '인사',302,1800);
    INSERT INTO depts
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '영업',303,1700);
    

    
-- 문제 2
-- 1)
SELECT * FROM depts;

UPDATE depts SET department_name = 'IT bank'
WHERE department_name = 'IT Support';

ROLLBACK;
-- 2) 
UPDATE depts SET manager_id = 301
WHERE department_id = 290;

-- 3)
UPDATE depts 
SET 
    department_name = 'IT Help',
    manager_id = 303, 
    location_id = 1800
WHERE department_name = 'IT Helpdesk';

-- 4) 
UPDATE depts SET manager_id = 301
WHERE department_id IN (290, 300, 310, 320);

SELECT * FROM depts;

-- 문제3
-- 1)
DELETE FROM depts
WHERE department_id = (SELECT department_id FROm depts
                        WHERE department_name = '영업');
ROLLBACK;
-- 2)
DELETE FROM depts
WHERE department_id = (SELECT department_id FROm depts
                        WHERE department_name = 'NOC');

-- 문제4
-- 1)
DELETE FROM depts
WHERE department_id > 200;

-- 2) 
UPDATE depts SET manager_id = 100
WHERE manager_id IS NOT NULL;

-- 3) 
SELECT * FROM depts; -- 타겟테이블

-- 4)
MERGE INTO depts d
    USING 
        departments dt -- 테이블자체로
    ON 
        (d.department_id = dt.department_id)
WHEN MATCHED THEN
    UPDATE SET
        d.department_name = dt.department_name,
        d.manager_id = dt.manager_id,
        d.location_id = dt.location_id
        
WHEN NOT MATCHED THEN
    INSERT VALUES
        (dt.department_id, dt.department_name, dt.manager_id, dt.location_id);
        

-- 문제 5
-- 5-1)
CREATE TABLE jobs_it AS (SELECT * FROM jobs WHERE min_salary > 6000);
SELECT * FROM jobs_it;

-- 5-2)
INSERT INTO jobs_it 
VALUES('IT_DEV', '아이티개발팀', 6000, 20000);
INSERT INTO jobs_it 
VALUES('NET_DEV', '네트워크개발팀', 5000, 20000);
INSERT INTO jobs_it 
VALUES('SEC_DEV', '보안개발팀', 6000, 19000);

-- 5-3)
SELECT * FROM jobs_it; -- 타겟테이블
SELECT * FROM jobs;
-- 5-4)
MERGE INTO jobs_it j
    USING 
        (SELECT 
            *
        FROM jobs  WHERE min_salary > 5000
        ) js
    ON (j.job_id = js.job_id) 
WHEN MATCHED THEN
    UPDATE SET 
        j.min_salary = js.min_salary,
        j.max_salary = js.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
        (js.job_id, js.job_title, js.min_salary,js.max_salary);



















