
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

/*
문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 
급여, 부서명, 근무지를 출력하세요. (Alias를 사용)
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT
    e.employee_id AS 사원번호,
    e.first_name AS 이름, 
    e.salary AS 급여,
    d.department_name AS 부서명, 
    loc.city AS 근무지
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';




/*
문제 8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 
직원 정보만 출력하세요.
*/
SELECT * FROM employees;
SELECT * FROM jobs;

SELECT 
    *
FROM employees e
LEFT JOIN jobs js
ON e.job_id = js.job_id
WHERE js.job_title = 'Stock Manager'
OR js.job_title = 'Stock Clerk';

/*
문제 9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;


SELECT 
    d.department_id AS 부서명,
    d.department_name AS 부서이름
FROM departments d
LEFT JOIN  employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;



/*
문제 10. 
-join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.
*/
SELECT 
    e1.first_name AS 사원,
    e2.first_name AS 해당매니저
FROM employees e1
LEFT JOIN employees e2
ON e2.employee_id = e1.manager_id
ORDER BY e2.first_name;


/*
문제 11. 
-- EMPLOYEES 테이블에서 left join하여 관리자(매니저)id와, 매니저의 이름, 매니저의 급여 까지 출력하세요.
-- 매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 정렬하세요.
*/
SELECT * FROM employees;

SELECT 
    e1.first_name AS 사원,
    e1.manager_id AS 관리자아이디, 
    e2.first_name AS 매니저이름, 
    e2.salary AS 매니저급여
FROM employees e1
LEFT JOIN employees e2
ON e2.employee_id = e1.manager_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e2.salary DESC;
































