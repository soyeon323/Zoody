DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE TABLE BOARD (
	NO              NUMBER		                        NOT NULL
	,USER_NO        NUMBER		                        NOT NULL
	,CAT_NO         NUMBER		                        NOT NULL
	,TITLE          VARCHAR2(100)		                NOT NULL
	,CONTENT        VARCHAR2(4000)		                NOT NULL
	,ENROLL_DATE    TIMESTAMP       DEFAULT SYSDATE     NOT NULL
	,MODIFY_DATE    TIMESTAMP		                    NULL
	,STATUS         CHAR(1)         DEFAULT 'O'	        NOT NULL
	,FILE_PATH      VARCHAR2(4000)                      NULL
    ,HIT            NUMBER          DEFAULT 0           NOT NULL
);



-- BOARD_REPLY
DROP TABLE BOARD_REPLY CASCADE CONSTRAINTS;
CREATE TABLE BOARD_REPLY (
	NO 	                NUMBER		                            NOT NULL
    ,BOARD_NO 	        NUMBER		                            NOT NULL
    ,USER_NO 	        NUMBER		                            NOT NULL
    ,REPLY_COMMENT 	    VARCHAR2(4000)                          NOT NULL
    ,REPLY_CLASS 	    NUMBER		                            NOT NULL
    ,REPLY_GROUP 	    NUMBER		                            NOT NULL
    ,ENOLLDATE 	        TIMESTAMP	    DEFAULT SYSDATE	NOT     NULL
    ,STATUS 	        CHAR(1)	        DEFAULT 'O'	            NOT NULL
);

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
