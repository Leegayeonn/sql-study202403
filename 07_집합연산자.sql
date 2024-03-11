
-- 집합 연산자
-- 서로 다른 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해 주는 연산자
-- UNION(합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

-- UNION -> 중복 데이터를 허용하지 않음.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION  
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL -> 중복 데이터를 허용함.
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL  
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT: 교집합 -> 둘다 해당하는 값
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT 
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- MINUS: 차집합(교집합을 뺀것) -> 조회순서대로 차집합 확인가능
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- 조회순서 바꾸기
SELECT 
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';

