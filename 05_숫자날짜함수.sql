
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정.음수를 주는 것도 가능(자릿수)
SELECT
    ROUND(3.1415, 3), ROUND(45.923,0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냄.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923,0), TRUNC(45.923, -1)
FROM dual;

-- ABS(절대값)
SELECT ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지 나눗셈 연산)
SELECT 
    10 / 4, MOD(10, 4)
FROM dual;

--------------------------------------------------------------------------------

-- 날짜 함수
-- sysdate: 컴퓨터의 현재날짜, 시간 정보를 가져와서 제공하는 함수 -> 시간정보도 있음
-- 함수이긴 하지만 괄호는 쓰지않는다 (키워드처럼 사용)
SELECT sysdate AS 오늘날짜 FROM dual;

-- 상세, 밀리초, 표준시까지 표시(잘사용하지는않음)
SELECT systimestamp FROM dual; 

-- 날짜도 연산이 가능.
SELECT sysdate + 1 FROM dual; -- 일자 덧셈연산만 가능

-- 날짜타입과 날짜타입은 뺄셈 연산을 지원함.(갭을 구할수있다)
-- 덧셈은 허용하지 않는다.
SELECT 
    first_name, sysdate - hire_date
FROM employees; -- 일수

SELECT 
    first_name,
    (sysdate - hire_date) / 7 AS week
FROM employees; -- 주수

SELECT 
    first_name,
    (sysdate - hire_date) / 365 AS year
FROM employees; -- 년수


-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual; -- 시간기준으로 일자 반올림(12시이후)
SELECT ROUND(sysdate, 'year') FROM dual; -- 년기준으로 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 월기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 한주를 기준으로 반올림(일~토)

SELECT TRUNC(sysdate) FROM dual; -- 시간기준으로 일자 절사(12시이후)
SELECT TRUNC(sysdate, 'year') FROM dual; -- 년기준으로 절사
SELECT TRUNC(sysdate, 'month') FROM dual; -- 월기준으로 절사
SELECT TRUNC(sysdate, 'day') FROM dual; -- 한주를 기준으로 절사(일~토)








































