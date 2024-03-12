
/*
문제 1.
-EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
-EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 주석으로 작성)
*/
-- INNER : 106행
SELECT *
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id;

-- LEFT OUTER : 107행
SELECT *
FROM employees e 
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- RIGHT OUTER : 122행
SELECT *
FROM employees e 
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- FULL OUTER : 123행
SELECT *
FROM employees e 
FULL JOIN departments d
ON e.department_id = d.department_id;

/*
문제 2.
-EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
조건)employee_id가 200인 사람의 이름, department_name를 출력하세요
조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다
*/
SELECT 
    first_name || ' ' || last_name AS name,
    d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;



/*
문제 3.
-EMPLOYEES, JOBS테이블을 INNER JOIN하세요
조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
HINT) 어떤 컬럼으로 서로 연결되어 있는지 확인
*/
SELECT * FROM employees;
SELECT * FROM jobs;


SELECT 
    e.first_name AS 이름,
    e.job_id AS 직무아이디,
    j.job_title AS 직무타이틀
FROM employees e 
JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name;


/*
문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
*/

SELECT * FROM jobs;
SELECT * FROM job_history;

SELECT *
FROM jobs js 
LEFT JOIN job_history jh
ON js.job_id = jh.job_id;


/*
문제 5.
--Steven King의 부서명을 출력하세요.
*/
SELECT * FROM employees;
SELECT * FROM departments;


SELECT 
     first_name || ' ' || last_name AS 이름,
     d.department_name AS 부서명
FROM employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id
WHERE first_name = 'Steven'
AND last_name = 'King';


/*
문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
*/
SELECT *
FROM employees
CROSS JOIN departments
ORDER BY employees.employee_id; -- 2889행


