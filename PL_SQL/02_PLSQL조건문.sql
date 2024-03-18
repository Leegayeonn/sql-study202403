
-- IF문
DECLARE 
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    -- 10~ 120 부서중 하나를 랜덤으로 뽑기
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); -- -1은 일의자리에서 반올림하라는뜻
    dbms_output.put_line('생성된 난수: '|| v_department_id);
    SELECT 
        salary
    INTO
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- 첫째 값만 구해서 변수에 저장.
    
    IF
        v_salary <= 5000
    THEN 
        dbms_output.put_line('급여가 좀 낮음!');
    ELSIF
        v_salary <= 9000
    THEN 
        dbms_output.put_line('급여가 중간임!');
    ELSE 
        dbms_output.put_line('급여가 높음!');
    END IF; -- IF가 끝났다는것을 작성해주어야함
END;



-- CASE문
DECLARE 
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    -- 10~ 120 부서중 하나를 랜덤으로 뽑기
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); -- -1은 일의자리에서 반올림하라는뜻
    dbms_output.put_line('생성된 난수: '|| v_department_id);
    SELECT 
        salary
    INTO
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- 첫째 값만 구해서 변수에 저장.
    
    CASE
        WHEN v_salary <= 5000 THEN
            dbms_output.put_line('급여가 좀 낮음!');
        WHEN v_salary <= 9000 THEN
            dbms_output.put_line('급여가 중간임!');
        ELSE 
            dbms_output.put_line('급여가 높음!');
    END CASE;
END;



-- 중첩 IF문
DECLARE 
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
    v_commission NUMBER := 0;
BEGIN
    -- 10~ 120 부서중 하나를 랜덤으로 뽑기
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); -- -1은 일의자리에서 반올림하라는뜻
    dbms_output.put_line('생성된 난수: '|| v_department_id);
    
    SELECT 
        salary, commission_pct
    INTO
        v_salary, v_commission
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- 첫째 값만 구해서 변수에 저장.
    
    IF v_commission > 0 THEN
        IF v_commission > 0.15 THEN
            dbms_output.put_line('커미션이 15% 이상입니다!');
            dbms_output.put_line(v_salary * v_commission);
        END IF; -- 닫는괄호라고 생각하면됨
    ELSE
        dbms_output.put_line('커미션이 없음');
    
    END IF; -- IF가 끝났다는것을 작성해주어야함
END;










































































