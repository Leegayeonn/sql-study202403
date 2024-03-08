
SELECT * FROM employees;

-- 비교대상 데이터는 대소문자 구분함! 키워드는 구별안함
-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'King';
