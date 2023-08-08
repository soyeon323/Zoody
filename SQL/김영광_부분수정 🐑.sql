--DROP TABLE BOARD CASCADE CONSTRAINTS;
--CREATE TABLE BOARD (
--	NO              NUMBER		                        NOT NULL
--	,USER_NO        NUMBER		                        NOT NULL
--	,CAT_NO         NUMBER		                        NOT NULL
--	,TITLE          VARCHAR2(100)		                NOT NULL
--	,CONTENT        VARCHAR2(4000)		                NOT NULL
--	,ENROLL_DATE    TIMESTAMP       DEFAULT SYSDATE     NOT NULL
--	,MODIFY_DATE    TIMESTAMP		                    NULL
--	,STATUS         CHAR(1)         DEFAULT 'O'	        NOT NULL
--	,FILE_PATH      VARCHAR2(4000)                      NULL
--    ,HIT            NUMBER          DEFAULT 0           NOT NULL
--);
--
--
--
---- BOARD_REPLY
--DROP TABLE BOARD_REPLY CASCADE CONSTRAINTS;
--CREATE TABLE BOARD_REPLY (
--	NO 	                NUMBER		                            NOT NULL
--    ,BOARD_NO 	        NUMBER		                            NOT NULL
--    ,USER_NO 	        NUMBER		                            NOT NULL
--    ,REPLY_COMMENT 	    VARCHAR2(4000)                          NOT NULL
--    ,REPLY_CLASS 	    NUMBER		                            NOT NULL
--    ,REPLY_GROUP 	    NUMBER		                            NOT NULL
--    ,ENOLLDATE 	        TIMESTAMP	    DEFAULT SYSDATE	NOT     NULL
--    ,STATUS 	        CHAR(1)	        DEFAULT 'O'	            NOT NULL
--);

/*=================================================================================================================================================*/
-- 카테고리
DROP TABLE BOARD_CATEGORY CASCADE CONSTRAINTS;
CREATE TABLE BOARD_CATEGORY (
	NO	            NUMBER		        NOT NULL
	,NAME	        VARCHAR2(50)		NOT NULL
	,CATEGORY_GROUP	NUMBER		
);
-- 카테고리 더미
INSERT ALL
    INTO BOARD_CATEGORY (NO, NAME, CATEGORY_GROUP) VALUES (1, '전사' , 1)
    INTO BOARD_CATEGORY (NO, NAME, CATEGORY_GROUP) VALUES (2, '부서' , 2)
    INTO BOARD_CATEGORY (NO, NAME, CATEGORY_GROUP) VALUES (10000, '자유' , 1)
    INTO BOARD_CATEGORY (NO, NAME, CATEGORY_GROUP) VALUES (10000, '익명' , 1)
SELECT 1 FROM DUAL;

/*=================================================================================================================================================*/
commit;

SELECT 
    RN
    ,NO
    ,USER_NO
    ,CAT_NO
    ,TITLE
    ,CONTENT
    ,ENROLL_DATE
    ,MODIFY_DATE
    ,FILE_PATH
FROM 
    (
        SELECT 
            ROWNUM RN
            ,NO
            ,USER_NO
            ,CAT_NO
            ,TITLE
            ,CONTENT
            ,ENROLL_DATE
            ,MODIFY_DATE
            ,FILE_PATH
        FROM BOARD
        WHERE STATUS = 'O'
        ORDER BY NO DESC
    )B
WHERE B.RN BETWEEN 1 AND 7
;

 -- 게시글 더미
 DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO;
DECLARE
   max_rows_per_cat NUMBER := 100;
BEGIN
   FOR cat_no_val IN 1..4 LOOP
      FOR i IN 1..max_rows_per_cat LOOP
         EXIT WHEN i > max_rows_per_cat; 
         INSERT INTO board (NO, USER_NO, CAT_NO, TITLE, CONTENT)
         VALUES (
            SEQ_BOARD_NO.NEXTVAL,
            1,
            cat_no_val,
            '제목' || SEQ_BOARD_NO.NEXTVAL,
            '내용' || SEQ_BOARD_NO.NEXTVAL
         );
      END LOOP;
   END LOOP;
   COMMIT; -- Commit the changes to make them permanent
END;
/
/*====================*/
DROP SEQUENCE SEQ_DOCUMENT_NO;
CREATE SEQUENCE SEQ_DOCUMENT_NO;
-- DOCUMENT
DROP TABLE "DOCUMENT" CASCADE CONSTRAINTS;
CREATE TABLE "DOCUMENT" (
    "NO"	NUMBER		NOT NULL,
	"SCOPE"	NUMBER DEFAULT '1' NOT	NULL,
    DIRECTORY_NO   NUMBER NOT NULL, 
    FILE_NAME   VARCHAR2(4000) NOT NULL, 
    EXTENSION   VARCHAR2(20) NOT NULL,
	STATUS  CHAR(1)	DEFAULT 'O'	NOT NULL,
    ENROLL_DATE  TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	MODIFY_DATE TIMESTAMP		NULL
);

DROP SEQUENCE SEQ_DIRECTORY_NO;
CREATE SEQUENCE SEQ_DIRECTORY_NO;

DROP TABLE "DIRECTORY" CASCADE CONSTRAINTS;
CREATE TABLE "DIRECTORY" (
    "NO" NUMBER	NOT NULL,
    USER_NO NUMBER NOT NULL,
    DIRECTORY_NAME   VARCHAR2(4000) NOT NULL,
    STATUS  CHAR(1)	DEFAULT 'O'	NOT NULL
);

DECLARE
    v_user_no NUMBER;
BEGIN
    FOR i IN 1..200 LOOP
        -- 랜덤한 값 생성 (예시로 1부터 100까지의 값)
        v_user_no := TRUNC(DBMS_RANDOM.VALUE(1, 101));

        INSERT INTO "DOCUMENT" (
            "NO",
            "SCOPE",
            DIRECTORY_NO,
            FILE_NAME,
            EXTENSION,
            STATUS,
            ENROLL_DATE
        ) VALUES (
            SEQ_DOCUMENT_NO.NEXTVAL,
            TRUNC(DBMS_RANDOM.VALUE(1, 4)), -- 랜덤한 "SCOPE" 값 생성 (1부터 10 사이)
            TRUNC(DBMS_RANDOM.VALUE(1, 40)), -- 랜덤한 "DIRECTORY_NO" 값 생성 (1부터 100 사이)
            '테스트_' || i, -- 파일 이름에 번호 추가
            CASE WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN '.txt' ELSE '.doc' END, -- 랜덤한 확장자 생성 (".txt" 또는 ".doc")
            CASE WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 'O' ELSE 'X' END, -- 랜덤한 "STATUS" 값 생성 ("O" 또는 "X")
            SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 365)) -- 최근 1년 이내 랜덤한 "ENROLL_DATE" 생성
        );
    END LOOP;
    COMMIT; -- 변경사항 저장
END;
/



DECLARE
    v_user_no NUMBER;
BEGIN
    FOR i IN 1..100 LOOP
        -- USER_NO가 같은 더미데이터가 두 개씩 존재한다고 가정
        FOR j IN 1..2 LOOP
            INSERT INTO "DIRECTORY" (
                NO,
                USER_NO,
                DIRECTORY_NAME
            ) VALUES (
                SEQ_DIRECTORY_NO.NEXTVAL,
                i,
                LPAD(j, 2, '0') || '_' || '새 폴더' -- 01_ 혹은 02_와 같은 접두사를 붙임
            );
        END LOOP;
    END LOOP;
    COMMIT; -- 변경사항 저장
END;
/
