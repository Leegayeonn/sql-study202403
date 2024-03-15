
/*
- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입.
- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리 -> ex) 265.43
- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정됩니다.
- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지)
- CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbyte)
- BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
- DATE -> BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능
- 시, 분, 초 지원 가능.
*/
-- 테이블 만들기(컬럼별 타입주기)
CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);
DESC dept2;
SELECT * FROM dept2;

-- NUMBER와 VARVHAR2 타입의 길이를 확인
INSERT INTO dept2
VALUES(10,'영업부','서울',sysdate,1000000);
INSERT INTO dept2
VALUES(20,'개발부','서울',sysdate,2000000);
INSERT INTO dept2
VALUES(30,'경영지원','경기',sysdate,2000000000);

-- 컬럼 추가
ALTER TABLE dept2
ADD dept_count NUMBER(3);

-- 컬럼명 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

SELECT * FROM dept2;

-- 컬럼 속성 수정
-- 만약 변경하고자 하는 컬럼에 데이터가 이미 존재한다면, 그에 맞는 타입으로 변경해야함.
-- 맞지않는 타입으로 변경 불가능.
-- 커밋과 롤백의 효과가 없다!(DDL은 자동으로 커밋이됨)
-- 다시 되돌아 갈수 없으니 신중하게 테이블 삭제 및 수정하기!
ALTER TABLE dept2
MODIFY dept_name VARCHAR2(50); -- 속성! 길이를 길게 변경

-- DDL(CREATE, ALTER, TRUNCATE, DROP)은 트랜잭션의 대상이 아닙니다.
ROLLBACK;

-- 컬럼 삭제
-- 컬럼의 데이터가 존재해도 삭제된다.
ALTER TABLE dept2
DROP COLUMN dept_bonus;

SELECT * FROM dept3;

-- 테이블 이름변경
ALTER TABLE dept2
RENAME TO dept3;


-- 테이블 내부데이터 삭제 (구조는 남겨두고 내부 데이터만 모두 삭제)
TRUNCATE TABLE dept3;

-- 테이블 전체 삭제
DROP TABLE dept3;















































