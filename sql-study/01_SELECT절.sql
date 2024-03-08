
-- 오라클의 한 줄 주석입니다.

/*
여러 줄 주석입니다.
하핳~
*/
-- 조회할때 기본 작성방법
-- SELECT [컬럼명(여러개 가능)] FROM [테이블 이름]
-- 대소문자 구분 안하지만 코드 가독성을 위해 키워드를 대문자로 작성한다.
-- 키워드: 대문자, 식별자: 소문자
-- 짧은건 한줄로, 길어지면 줄개행하여 사용.


-- 모든 컬럼 선택시 "*" 사용
SELECT * FROM employees; -- (employees에서 부터 모든 컬럼을 선택하겠다)
    
-- 특정 원하는 컬럼을 선택할때
SELECT 
    employee_id, 
    first_name, 
    last_name 
FROM 
    employees;
    
SELECT email, phone_number, hire_date
FROM employees;
    
    
-- 컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS 성과금
    -- 조회내용에만 뜨고 실제 테이블에 추가되는것은 아님 
FROM employees;

-- NULL 값의 확인 (값이 없는것이지 숫자 0이나 공백과는 다른 존재입니다.)
SELECT department_id, commission_pct
FROM employees;


-- alias (컬럼명, 테이블명의 이름을 변경해서 조회합니다.)
-- 조회결과의이름을 별칭으로 나올수있게 할수있다(AS[변경내용])
SELECT
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;


-- 숫자만 덧셈연산(+) 사용가능
-- 문자는 || 사용
-- 문자는 '' 안에 사용 (공백으로 띄어쓰기 표현가능)
-- 특수기호 홑따옴표는 '' 두번적으면 된다!
/*
오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표 특수기호를 
표현하고 싶다면 ''를 두번 연속으로 사용
문자열 연결기호는 || 입니다. 문자열의 덧셈연산을 허용하지 않습니다.
*/
SELECT
    first_name || ' ' || last_name || '''s salary is $' || salary AS 급여내역
FROM employees;

-- DISTINCT (중복 행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;


-- ROWNUM, ROWID (행번호, 행아이디)
-- (**로우넘: 쿼리에 의해 반환되는 행 번호를 반환)- 페이징할때 유용하게 사용됨
-- (로우아이디: 데이터베이스 내의 행의 주소를 반환)
SELECT ROWNUM, ROWID, employee_id
FROM employees;
    
    
    
    
    
    
    