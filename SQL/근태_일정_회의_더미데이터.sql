-- ATTENDANCE_CURRENT
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (0, '결근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (1, '출근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (2, '퇴근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (3, '휴가');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (4, '출장');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (5, '외근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (6, '업무');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (7, '지각');

-- ATTENDANCE
--CREATE TABLE "ATTENDANCE" (
--	"NO"	NUMBER		NOT NULL,
--	"USER_NO"	NUMBER		NOT NULL,
--	"CURRENT_NO"	NUMBER		NOT NULL,
--	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
--	"CHECK_IN_TIME"	TIMESTAMP	DEFAULT SYSDATE	NULL,
--	"CHECK_OUT_TIME"	TIMESTAMP	DEFAULT SYSDATE	NULL,
--	"PLUS_WORK_TIME"	TIMESTAMP		NULL,
--	"TOTAL_WORK_TIME"	TIMESTAMP		NULL,
--	"OBJECTION_REASON"	VARCHAR2(500)		NULL,
--	"APPROVAL_STATUS"	NUMBER	DEFAULT 0	NULL
--);

--INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, TOTAL_WORK_TIME, OBJECTION_REASON, APPROVAL_STATUS) 
--    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 1, 1, );

-- LEAVE_TYPE
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (0, '오전 반차');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (1, '오후 반차');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (2, '연차');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (3, '출산 휴가');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (4, '결혼 휴가');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (5, '육아 휴직');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (6, '병가');
INSERT INTO LEAVE_TYPE (NO, TYPE) VALUES (7, '경조사');

-- LEAVE
--CREATE TABLE "LEAVE" (
--	"NO"	NUMBER		NOT NULL,
--	"USER_NO"	NUMBER		NOT NULL,
--	"LEAVE_NO"	NUMBER		NOT NULL,
--	"PROXY_NO"	NUMBER		NOT NULL,
--	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
--	"REASON_CONTENT"	VARCHAR2(500)		NOT NULL,
--	"START_TIME"	TIMESTAMP		NOT NULL,
--	"END_TIME"	TIMESTAMP		NOT NULL
--);
--INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME) VALUES (SEQ_LEAVE_NO.NEXTVAL, 1, 2, 1, );

-- CALENDAR_TYPE
INSERT INTO CALENDAR_TYPE (NO, TYPE) VALUES (0, '개인');
INSERT INTO CALENDAR_TYPE (NO, TYPE) VALUES (1, '부서');
INSERT INTO CALENDAR_TYPE (NO, TYPE) VALUES (2, '회사');
INSERT INTO CALENDAR_TYPE (NO, TYPE) VALUES (3, '회의');

-- CALENDAR
--CREATE TABLE "CALENDAR" (
--	"NO"	NUMBER		NOT NULL,
--	"USER_NO"	NUMBER		NOT NULL,
--	"TYPE_NO"	NUMBER		NOT NULL,
--	"REV_NO"	NUMBER		NULL,
--	"TITLE"	VARCHAR2(100)		NOT NULL,
--	"CONTENT"	VARCHAR2(500)		NULL,
--	"START_TIME"	TIMESTAMP		NOT NULL,
--	"END_TIME"	TIMESTAMP		NOT NULL,
--	"PLACE"	VARCHAR2(100)		NULL,
--	"STATUS"	NUMBER	DEFAULT 0	NOT NULL
--);
--INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) VALUES (SEQ_CALENDAR_NO.NEXTVAL, 1);

-- MEETINGROOM
--CREATE TABLE "MEETINGROOM" (
--	"NO"	NUMBER		NOT NULL,
--	"NAME"	VARCHAR2(50)		NOT NULL,
--	"INFO"	VARCHAR2(500)		NOT NULL,
--	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
--	"MODIFYDATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
--	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
--	"ORIGIN_NAME"	VARCHAR2(500)		NULL,
--	"CHANGE_NAME"	VARCHAR2(500)		NULL,
--	"CAPACITY"	NUMBER		NOT NULL,
--    "OPEN_TIME"	TIMESTAMP		NOT NULL,
--	"CLOSE_TIME"	TIMESTAMP		NOT NULL
--);
--INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, STATUS, ORIGIN_NAME, CHANGE_NAME, CAPACITY, OPEN_TIME, CLOSE_TIME) VALUES (SEQ_MEETINGROOM_NO.NEXTVAL);

-- MEETINGROOM_RESERVATION