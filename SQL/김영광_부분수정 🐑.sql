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
