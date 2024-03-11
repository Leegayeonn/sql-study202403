
SELECT * FROM employees;

-- 비교대상 데이터는 대소문자 구분함! 키워드는 구별안함
-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; 
-- 

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = 50;
-- 형변환이 되긴 하지만 타입에 맞게 사용하는게 좋다.


-- 범위 지정가능 (~ 부터 ~ 까지)
SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000; 

-- 날짜 타입 (문자형 형태로 조회하면됨)
SELECT *
FROM employees
WHERE hire_date = '04/01/30';


/* 데이터의 행 제한(BETWEEN, IN, LIKE)*/

-- BETWEEN AND ~에서 ~사이 (부등호보다는 가독성이 좋지만 속도가 조금 차이날수있다)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용(특정 값들과 비교할 때 사용)
SELECT * FROM employees
WHERE manager_id IN(100,101,102);
-- 100이거나, 101이거나, 102이거나

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE 연산자의 사용 (지정 문자열 포함 여부)
-- '%' anything의 뜻 (해당숫자로 시작/끝나는 모든)

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';

-- 앞뒤 상관없이 해당키워드가 포함되어있는 데이터 반환(앞뒤로 %붙혀주기)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

-- 연도, 일자 반환은 %만 사용하면 되지만 월 반환은 어렵다. 그래서
-- '_' 언더바를 통하여 자리 표현(자리수만큼 작성)
-- 월은 앞에 3자리 뒤니까 언더바 3개 _,_,_% 표현!(실제는콤마빼고)
/* % 는 어떠한 문자든, _ 는 데이터의 자리(위치)를 표현할 때*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';


-- IS NULL (null 값 찾기)
-- NULL은 연산불가('='는 IS 로 동등비교,'!='는 IS NOT)
SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;


-- AND, OR
-- AND가 OR보다 연산 순서가 빠름
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;
-- -> AND 가 먼저 연산됨
-- 우선순위인것을 괄호치기

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- 데이터의 정렬(SELECT 구문의 가장 마지막에 배치된다)
-- ASC : ascending 오름차순 -> 생략이 가능(기본값)(작은값부터)
-- DESC : descending 내림차순 (큰값부터)
SELECT * FROM employees
ORDER BY hire_date ASC; 

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

-- 별칭도 정렬조건이 될수있다.
SELECT 
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay ASC;















 
































