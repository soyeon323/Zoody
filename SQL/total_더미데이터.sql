-- DEPARTMENT

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1,
    'ZOODY동물원',
    NULL
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물원 아래 2개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    11,
    '경영관리부',
    1
)
;

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    12,
    '동물관리부',
    1
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 경영관리부 아래 4개 과

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    111,
    '총무과',
    11
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    112,
    '운영과',
    11
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    113,
    '시설과',
    11
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    114,
    '조경과',
    11
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물관리부 아래 4개 과

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    121,
    '동물기획과',
    12
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    122,
    '동물복지1과',
    12
);


INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    123,
    '동물복지2과',
    12
);


INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    124,
    '종보전 연구실',
    12
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 총무과 아래 4개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1111,
    '총무인사',
    111
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1112,
    '정보통신',
    111
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1113,
    '노동안전',
    111
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1114,
    '재무',
    111
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 운영과 아래 3개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1121,
    '운영',
    112
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1122,
    '환경',
    112
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1123,
    '고객지원',
    112
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 시설과 아래 4개 부서
 
INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1131,
    '전기시설',
    113
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1132,
    '기계화공',
    113
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1133,
    '건축시설',
    113
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1134,
    '시설안전',
    113
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물기획과 아래 4개 부서   

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1211,
    '동물원운영',
    121
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1212,
    '동물원기획',
    121
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1213,
    '동물영양',
    121
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1214,
    '자연학습',
    121
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물복지1과 아래 4개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1221,
    '조류팀',
    122
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1222,
    '남미팀',
    122
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1223,
    '맹수팀',
    122
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1224,
    '동양팀',
    122
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물복지2과 아래 4개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1231,
    '대동물',
    123
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1232,
    '어린이동물',
    123
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1233,
    '아프리카',
    123
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1234,
    '유인원',
    123
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 종보전연구실 아래 5개 부서

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1241,
    '생태연구',
    124
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1242,
    '분석연구',
    124
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1243,
    '진료',
    124
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1244,
    '병리',
    124
);

INSERT INTO DEPARTMENT
(
    NO,
    NAME,
    UPPER_DEPARTMENT_NO
)
VALUES
(
    1245,
    '방역',
    124
);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 직급

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    1,
    '동물원장',
    1
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    2,
    '부장',
    2
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    31,
    '과장',
    3
)
;

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    32,
    '실장',
    3
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    4,
    '팀장',
    4
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RANK
(
    NO,
    NAME,
    GRADE
)
VALUES
(
    5,
    '사원',
    5
)
;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 직책

DROP SEQUENCE SEQ_POSITION_NO;
CREATE SEQUENCE SEQ_POSITION_NO NOCYCLE NOCACHE;

INSERT INTO POSITION
(
    NO,
    NAME
)
VALUES
(
    0,
    '임시'
)
;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 입사구분

INSERT INTO EMPLOY_DIVISION
(
    NO,
    EMPLOY_DIVISION
)
VALUES
(
    1,
    '신입'
)
;

INSERT INTO EMPLOY_DIVISION
(
    NO,
    EMPLOY_DIVISION
)
VALUES
(
    2,
    '경력'
)
;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 계정 상태

INSERT INTO USER_STATE
(
    NO,
    NAME
)
VALUES
(
    1,
    '정상'
)
;

INSERT INTO USER_STATE
(
    NO,
    NAME
)
VALUES
(
    2,
    '출타'
)
;

INSERT INTO USER_STATE
(
    NO,
    NAME
)
VALUES
(
    3,
    '정지'
)
;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 유저 샘플

DROP SEQUENCE SEQ_USER_NO;
CREATE SEQUENCE SEQ_USER_NO NOCYCLE NOCACHE;

-- 동물원장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1,
    1,
    0,
    1,
    NULL,
    2,
    'admin',
    '1234',
    '오영택',
    'M',
    '19870724',
    'profile-img',
    '알잘딱하게',
    '인천 송도',
    '010-0001-0001',
    'oyt@zoody.co.kr',
    '20190816',
    NULL,
    NULL,
    '07011111111',
    4,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 경영관리부장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    11,
    2,
    0,
    1,
    NULL,
    2,
    'user0011',
    '1234',
    '김남준',
    'M',
    '19940912',
    'profile-img',
    '자유',
    '서울',
    '010-0011-0011',
    'ghdh21@naver.com',
    '20210416',
    NULL,
    NULL,
    '07000110011',
    7,
    500
)
;

-- 동물관리부장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    12,
    2,
    0,
    1,
    NULL,
    2,
    'user0012',
    '1234',
    '유지민',
    'F',
    '20000411',
    'profile-img_0012',
    '광야',
    '서울',
    '010-0012-0012',
    'katarinabluu@zoody.co.kr',
    '20221221',
    NULL,
    NULL,
    '07000120012',
    1,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 총무과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    111,
    31,
    0,
    1,
    NULL,
    2,
    'user0111',
    '1234',
    '김민지',
    'F',
    '20040507',
    'profile-img',
    '김민지',
    '춘천',
    '010-0111-0111',
    'mj_zim@zoody.co.kr',
    '20180109',
    NULL,
    NULL,
    '07001110111',
    0,
    500
)
;

-- 운영과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    112,
    31,
    0,
    1,
    NULL,
    2,
    'user0112',
    '1234',
    '강혜린',
    'F',
    '20060515',
    'profile-img',
    '강',
    '서울',
    '010-0112-0112',
    'liver_sun_ryn@zoody.co.kr',
    '20180109',
    NULL,
    NULL,
    '07001120112',
    0,
    500
)
;

-- 시설과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    113,
    31,
    0,
    1,
    NULL,
    2,
    'user0113',
    '1234',
    '이혜인',
    'F',
    '20080421',
    'profile-img',
    '혠이',
    '인천',
    '010-0113-0113',
    'lee_hyein@zoody.co.kr',
    '20180109',
    NULL,
    NULL,
    '07001130113',
    0,
    500
)
;

--조경과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    114,
    31,
    0,
    1,
    NULL,
    2,
    'user0114',
    '1234',
    '민윤기',
    'M',
    '19930309',
    'profile-img',
    '슈가',
    '대구',
    '010-0114-0114',
    'agustd@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07001140114',
    6,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--동물기획과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    121,
    31,
    0,
    1,
    NULL,
    2,
    'user0121',
    '1234',
    '정호석',
    'M',
    '19940218',
    'profile-img',
    '제이홉',
    '광주',
    '010-0121-0121',
    'uarmyhope@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07001210121',
    3,
    500
)
;

-- 동물복지1과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    122,
    31,
    0,
    1,
    10,
    2,
    'user0122',
    '1234',
    '주호민',
    'M',
    '19810926',
    'profile-img',
    '신과함께',
    '용인',
    '010-0122-0122',
    'homin_zoo@zoody.co.kr',
    '20160909',
    NULL,
    NULL,
    '07001220122',
    6,
    500
)
;

-- 동물복지2과장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    121,
    31,
    0,
    1,
    NULL,
    2,
    'user0123',
    '1234',
    '김태형',
    'M',
    '19951230',
    'profile-img',
    '뷔',
    '대구',
    '010-0123-0123',
    'thv@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07001230123',
    3,
    500
)
;

--종보전연구실장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    121,
    31,
    0,
    1,
    NULL,
    2,
    'user0124',
    '1234',
    '전정국',
    'M',
    '19970901',
    'profile-img',
    '정국',
    '부산',
    '010-0124-0124',
    'jungkook97@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07001240124',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 총무인사팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1111,
    4,
    0,
    1,
    NULL,
    1,
    'user1111',
    '1234',
    '총무인',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1111-1111',
    'user1111@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011111111',
    3,
    500
)
;

-- 정보통신팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1112,
    4,
    0,
    1,
    NULL,
    2,
    'user1112',
    '1234',
    '정보통',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1112-1112',
    'user1112@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011121112',
    3,
    500
)
;

-- 노동안전팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1113,
    4,
    0,
    1,
    NULL,
    2,
    'user1113',
    '1234',
    '노동안',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1113-1113',
    'user1113@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011131113',
    3,
    500
)
;

-- 재무팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1114,
    4,
    0,
    1,
    NULL,
    2,
    'user1114',
    '1234',
    '재무무',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1114-1114',
    'user1114@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011141114',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 운영팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1121,
    4,
    0,
    1,
    NULL,
    2,
    'user1121',
    '1234',
    '운영일',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1121-1121',
    'user1121@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011211121',
    3,
    500
)
;

-- 환경팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1122,
    4,
    0,
    1,
    NULL,
    2,
    'user1122',
    '1234',
    '이경환',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1122-1122',
    'user1122@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011221122',
    3,
    500
)
;

-- 고객지원팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1123,
    4,
    0,
    1,
    NULL,
    1,
    'user1123',
    '1234',
    '고지원',
    'F',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1123-1123',
    'user1123@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011231123',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 전기시설팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1131,
    4,
    0,
    1,
    NULL,
    2,
    'user1131',
    '1234',
    '전시설',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1131-1131',
    'user1131@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011311131',
    3,
    500
)
;

-- 기계화공팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1132,
    4,
    0,
    1,
    NULL,
    2,
    'user1132',
    '1234',
    '기화공',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1132-1132',
    'user1132@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011321132',
    3,
    500
)
;

-- 건축시설팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1133,
    4,
    0,
    1,
    NULL,
    2,
    'user1133',
    '1234',
    '건시축',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1133-1133',
    'user1133@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011331133',
    3,
    500
)
;

-- 시설안전팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1134,
    4,
    0,
    1,
    NULL,
    2,
    'user1134',
    '1234',
    '시안설',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1134-1134',
    'user1131@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07011341134',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 동물원운영팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1211,
    4,
    0,
    1,
    NULL,
    2,
    'user1211',
    '1234',
    '원운영',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1211-1211',
    'user1211@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012111211',
    3,
    500
)
;

-- 동물원기획팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1212,
    4,
    0,
    1,
    NULL,
    2,
    'user1212',
    '1234',
    '원운영',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1212-1212',
    'user1212@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012121212',
    3,
    500
)
;

-- 동물영양팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1213,
    4,
    0,
    1,
    NULL,
    2,
    'user1213',
    '1234',
    '영양동',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1213-1213',
    'user1213@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012131213',
    3,
    500
)
;

-- 자연학습팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1214,
    4,
    0,
    1,
    NULL,
    2,
    'user1214',
    '1234',
    '자학연',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1214-1214',
    'user1214@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012141214',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 조류팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1221,
    4,
    0,
    1,
    NULL,
    2,
    'user1221',
    '1234',
    '조오류',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1221-1221',
    'user1221@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012211221',
    3,
    500
)
;

-- 남미팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1222,
    4,
    0,
    1,
    NULL,
    2,
    'user1222',
    '1234',
    '조오류',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1222-1222',
    'user1222@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012221222',
    3,
    500
)
;

-- 맹수팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1223,
    4,
    0,
    1,
    NULL,
    2,
    'user1223',
    '1234',
    '이지은',
    'F',
    '19930516',
    'profile-img_1223.png',
    '팔레트',
    '성동구 송정동',
    '010-1223-1223',
    'dlwlrma@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012231223',
    3,
    500
)
;

-- 맹수팀원1
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1223,
    5,
    0,
    1,
    NULL,
    2,
    'user12231',
    '1234',
    '차승원',
    'M',
    '19700607',
    'profile-img_12231.png',
    '요한',
    '경기도 시흥군',
    '010-1234-1234',
    '70csw@zoody.co.kr',
    '20150109',
    NULL,
    NULL,
    '07012341234',
    9,
    500
)
;

-- 맹수팀원2
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1223,
    5,
    0,
    1,
    NULL,
    2,
    'user12232',
    '1234',
    '유해진',
    'M',
    '19700104',
    'profile-img_12232.png',
    '요한',
    '충청도 청주시',
    '010-5678-5678',
    'lucky@zoody.co.kr',
    '20180109',
    NULL,
    NULL,
    '07056785678',
    1,
    500
)
;

-- 동양팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1224,
    4,
    0,
    1,
    NULL,
    2,
    'user1224',
    '1234',
    '도양이',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1224-1224',
    'user1224@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012241224',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 대동물팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1231,
    4,
    0,
    1,
    NULL,
    2,
    'user1231',
    '1234',
    '대도우',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1231-1231',
    'user1231@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012311231',
    3,
    500
)
;

-- 어린이동물팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1232,
    4,
    0,
    1,
    NULL,
    2,
    'user1232',
    '1234',
    '이린어',
    'F',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1232-1232',
    'user1232@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012321232',
    3,
    500
)
;

-- 아프리카팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1233,
    4,
    0,
    1,
    NULL,
    2,
    'user1233',
    '1234',
    '이프아',
    'F',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1233-1233',
    'user1233@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012331233',
    3,
    500
)
;

-- 유인원팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1234,
    4,
    0,
    1,
    NULL,
    2,
    'user1234',
    '1234',
    '유인혁',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1234-1234',
    'user1234@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012341234',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 생태연구팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1241,
    4,
    0,
    1,
    NULL,
    2,
    'user1241',
    '1234',
    '연태생',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1241-1241',
    'user1241@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012411241',
    3,
    500
)
;

-- 분석연구팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1242,
    4,
    0,
    1,
    NULL,
    2,
    'user1242',
    '1234',
    '연석분',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1241-1241',
    'user1241@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012411241',
    3,
    500
)
;

-- 진료팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1243,
    4,
    0,
    1,
    NULL,
    2,
    'user1243',
    '1234',
    '진인요',
    'F',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1243-1243',
    'user1243@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012431243',
    3,
    500
)
;

-- 병리팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1244,
    4,
    0,
    1,
    NULL,
    2,
    'user1244',
    '1234',
    '병이리',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1244-1244',
    'user1244@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012441244',
    3,
    500
)
;

-- 방역팀장
INSERT INTO "USER"
(
    NO,
    DEPARTMENT_NO,
    RANK_NO,
    POSITION_NO,
    STATE_NO,
    AGENT,
    DIVISION_NO,
    ID,
    PWD,
    NAME,
    GENDER,
    BIRTH_DATE,
    PROFILE,
    LINE_INTRO,
    ADDRESS,
    PHONE,
    MAIL,
    REGISTRATION_DATE,
    LEAVE_REASON,
    LEAVE_DATE,
    OFFICE_NUMBER,
    LEAVE_COUNT,
    CAPACITY
)
VALUES
(
    SEQ_USER_NO.NEXTVAL,
    1245,
    4,
    0,
    1,
    NULL,
    2,
    'user1245',
    '1234',
    '방여호',
    'M',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1245-1245',
    'user1245@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012451245',
    3,
    500
)
;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    1,
    '승인'
);

INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    2,
    '반려'
);



INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM",
    "AUTHORITY"
)
VALUES
(
    1,
    '품의서',
    '<div class="document-form">
        <div class="document-title">
            품 의 서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name">
                    </td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="approval-inst">
                <table>
                    <tr>
                        <th class="inst-header">결재자 지시사항</th>
                    </tr>
                    <tr>
                        <td class="inst-text">
                            <input name="instruction" class="instruction" type="text">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">제목</td>
                    <td class="title-input-cell">
                        <input class="title-input" type="text" name="title">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <div class="main-form1">아래와 같이 보고하오니 검토 후 재가 바랍니다.</div>
                        <div class="main-form2">-아 래-</div>
                        <textarea name="content" id="approval-main-text"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>',
    1
);

INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM",
    "AUTHORITY"
)
VALUES
(
    2,
    '휴가신청서',
    '<div class="document-form">
        <div class="document-title">
            휴 가 신 청 서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name">
                    </td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">휴가 시작일</th>
                        <td class="leave-table-body">
                            <input type="date" name="startDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 복귀일</th>
                        <td class="leave-table-body">
                            <input type="date" name="endDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 일수</th>
                        <td class="leave-table-body">
                            <input type="text" class="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 유형</th>
                        <td class="leave-table-body leave-category">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">
                        휴가 사유
                        <input type="text" name="title" class="invisible-input" value="휴가 신청서">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="reason" class="leave-reason" ></textarea>
                        <div class="main-form1">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>',
    3
);

INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM",
    "AUTHORITY"
)
VALUES
(
    3,
    '근무신청서',
    '<div class="document-form">
        <div class="document-title">
            휴일/연장 근무 신청서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name"></td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">근무 유형</th>
                        <td class="leave-table-body">
                            <div class="extra-work-category"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">근무 날짜</th>
                        <td class="leave-table-body">
                            <input type="date" name="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">시작 시간</th>
                        <td class="leave-table-body">
                            <input type="time" name="startTime">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">종료 시간</th>
                        <td class="leave-table-body">
                            <input type="time" name="endTime">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">근무 사유</td>
                    <input type="text" name="title" class="invisible-input" value="휴일/연장 근무 신청서">
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="extraWorkReason" class="leave-reason" ></textarea>
                        <div class="main-form1">위와 같이 휴일/연장 근무를 신청하오니 허락하여 주시기 바랍니다.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>',
    4
);




INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM",
    "AUTHORITY"
)
VALUES
(   '4',
    '지출결의서',
    '<div class="document-form">
        <div class="document-title">
            지 출 결 의 서
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="approval-line">
                <table class="approval-line-table">
                    <tr class="table-header-rank">
                        <th class="vertical-cell" rowspan="4">상신인</th>
                        <th class="table-rank sender-rank"></th>
                        <th class="vertical-cell" rowspan="4">결재자</th>
                    </tr>
                    <tr class="table-body-name">
                        <td class="table-name sender-name"></td>
                        <input class="sender-no" name="SenderNo" type="text">
                    </tr>
                    <tr class="approval-result">
                        <td class="table-approval"></td>
                    </tr>
                    <tr class="table-date-area">
                        <td class="table-date"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">제목</td>
                    <td class="title-input-cell">
                        <input class="title-input" type="text" name="receiptTitle">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <div class="table-area">
                            <table class="receipt-table">
                                <thead>
                                    <tr>
                                        <th class="receipt-category">항목</th>
                                        <th class="receipt-breakdown">내역</th>
                                        <th class="receipt-cost">금액</th>
                                        <th class="receipt-note">비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text">
                                        </td>
                                        <td>
                                            <input type="text">
                                        </td>
                                        <td>
                                            <input type="number">
                                        </td>
                                        <td>
                                            <input type="text">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="main-form1">위 금액을 청구하오니 결재 바랍니다.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>',
    2
);

---------------------------------------------------------------------------------------------------------------------------------------------------

-- TODO_LIST TABLE INSERT(할일목록 테이블 INSERT)
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '1', '판다 교배시키기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '2', '우리 청소하기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '3', '동물사랑 포스터 만들기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '4', '알비노 관련 논문 찾아보기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '5', '판다 후손 관심가지기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '6', '확장 공사하기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '7', '포스터 교부하기(근방에서)');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '8', '알비노 개체 분리하기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '9', '판다 건강검진하기');
INSERT INTO TODO_LIST(NO, PROJECT_TODO_NO, CONTENT) VALUES(SEQ_TODO_LIST_NO.NEXTVAL, '10', '사자 정보 등록하기');

-- SUGGESTION TABLE INSERT(건의사항 테이블 INSERT)
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '1', '동물원 배치변경 건의합니다.', '회의실 배치 변경을 요청합니다.', '2023/07/01', 'O', '0', '1');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '2', '프로젝트 관련 건의사항', '회의실 배치 변경을 요청합니다.', '2023/07/11', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '1', '연봉협상 관련 건의합니다.', '회의실 배치 변경을 요청합니다.', '2023/06/01', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '2', '예산안 수정해주세요', '회의실 배치 변경을 요청합니다.', '2023/05/21', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '1', '유선번호 변경 건의드려요', '회의실 배치 변경을 요청합니다.', '2023/07/21', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '2', '정보수정이 안되는데 어떡하죠?', '회의실 배치 변경을 요청합니다.', '2023/07/21', 'O', '0', '1');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '2', '시설관련 건의드립니다.', '회의실 배치 변경을 요청합니다.', '2023/07/01', 'O', '0', '1');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '1', '화장실이 많이 더럽습니다', '회의실 배치 변경을 요청합니다.', '2023/04/23', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '1', '민원인에 대한 정신적 피해보상 문의', '회의실 배치 변경을 요청합니다.', '2023/05/11', 'O', '0', '2');
INSERT INTO SUGGESTION(NO, USER_NO, TITLE, CONTENT, ENROLL_DATE, STATUS, HIT, BOARD_LIMIT) VALUES(SEQ_SUGGESTION_NO.NEXTVAL, '2', '동물원 내 시설에 대한 건의사항입니다.', '회의실 배치 변경을 요청합니다.', '2023/03/23', 'O', '0', '2');

-- ADMIN TABLE INSERT(관리자 테이블 INSERT)
INSERT INTO ADMIN(NO, ID, PWD, POWER, STATUS) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN1', 'ADMIN1', '0', 'O');
INSERT INTO ADMIN(NO, ID, PWD, POWER, STATUS) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN2', 'ADMIN2', '1', 'O');
INSERT INTO ADMIN(NO, ID, PWD, POWER, STATUS) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN3', 'ADMIN3', '2', 'O');
INSERT INTO ADMIN(NO, ID, PWD, POWER, STATUS) VALUES(SEQ_ADMIN_NO.NEXTVAL, 'ADMIN4', 'ADMIN4', '2', 'O');

-- NOTICE_CATEGORY TABLE INSERT(공지사항 카테고리 테이블 INSERT)
INSERT INTO NOTICE_CATEGORY(NO, NAME) VALUES(SEQ_NOTICE_CAT_NO.NEXTVAL, '서비스');
INSERT INTO NOTICE_CATEGORY(NO, NAME) VALUES(SEQ_NOTICE_CAT_NO.NEXTVAL, '안내');
INSERT INTO NOTICE_CATEGORY(NO, NAME) VALUES(SEQ_NOTICE_CAT_NO.NEXTVAL, '이벤트');

-- NOTICE TABLE INSERT(공지사항 테이블 INSERT)
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '1', '1', '동물원 내 비데추가 안내드립니다.', '화장실에 비데를 설치하였습니다. 많은 이용 부탁드립니다.', '2023/07/10', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '2', '2', '새로운 사자 가족 맞이 안내', '새로운 사자 가족을 맞이할 예정입니다. 많은 관심 부탁드립니다.', '2023/07/20', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '3', '3', '사원 업무효율 증진을 위한 이벤트 시행', '동물원 내 가족인 사원분들을 위한 보너스 지급 이벤트를 시행할 예정입니다.', '2023/07/02', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '4', '1', '동물원 서비스 이용 안내', '동물원을 이용하시는 직원분들께서는 공지사항 필독 바랍니다.', '2023/06/28', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '1', '2', '원숭이 우리 수리기간 공지', '원숭이우리 수리기간 안내드리오니 업무에 참고 바랍니다.', '2023/07/15', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '2', '3', '이벤트 관련 공지사항입니다.', '동물원 내 이벤트 많은 참여 바랍니다.', '2023/05/04', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '3', '1', '직원 의견 수렴을 위한 공지 안내', '동물원 내의 모든 직원분들께서는 건의사항 작성 시 의견수렴하여 작성 부탁드립니다.', '2023/06/03', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '4', '2', '직원용 화장실 이용 안내', '직원분들께서는 고객들이 이용하는 화장실 사용 가급적 자제 부탁드립니다.', '2023/07/22', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '1', '3', '모든직원 참여가능)아이패드 증정 이벤트', '아이패드 증정 이벤트 시행 예정입니다. 많은 참여 부탁드립니다.', '2023/06/30', 'O');
INSERT INTO NOTICE(NO, ADMIN_NO, CATEGORY_NO, TITLE, CONTENT, ENROLL_DATE, STATUS) VALUES(SEQ_NOTICE_NO.NEXTVAL, '2', '2', '사내 동아리 필참 안내', '사내 동아리는 필참입니다..', '2023/07/01', 'O');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- EXTRA_WORK_CATEGORY
INSERT INTO EXTRA_WORK_CATEGORY(NO, CATEGORY) VALUES (0,'연장');
INSERT INTO EXTRA_WORK_CATEGORY(NO, CATEGORY) VALUES (1,'야간');
INSERT INTO EXTRA_WORK_CATEGORY(NO, CATEGORY) VALUES (2,'휴일');

-- EXTRA_WORK
INSERT INTO "EXTRA_WORK" ("NO", "USER_NO", "TYPE_NO", "ENROLLDATE", "START_TIME", "END_TIME", "APPROVAL_STATUS", "REASON")
    VALUES (SEQ_EXTRA_WORK_NO.NEXTVAL, 2, 0, '20230727', '1800', '2000', 1, '특별한 이유로 인한 추가 근무');
INSERT INTO "EXTRA_WORK" ("NO", "USER_NO", "TYPE_NO", "ENROLLDATE", "START_TIME", "END_TIME", "APPROVAL_STATUS", "REASON")
    VALUES (SEQ_EXTRA_WORK_NO.NEXTVAL, 2, 1, '20230727', '1900', '2000', 2, '외부 회의로 인한 추가 근무');
INSERT INTO "EXTRA_WORK" ("NO", "USER_NO", "TYPE_NO", "ENROLLDATE", "START_TIME", "END_TIME", "APPROVAL_STATUS", "REASON")
    VALUES (SEQ_EXTRA_WORK_NO.NEXTVAL, 2, 0, '20230726', '1900', '2100', 1, '긴급 업무로 인한 추가 근무');
INSERT INTO "EXTRA_WORK" ("NO", "USER_NO", "TYPE_NO", "ENROLLDATE", "START_TIME", "END_TIME", "APPROVAL_STATUS", "REASON")
    VALUES (SEQ_EXTRA_WORK_NO.NEXTVAL, 2, 1, '20230801', '1830', '2030', 2, '데이터 분석 작업으로 인한 추가 근무');
INSERT INTO "EXTRA_WORK" ("NO", "USER_NO", "TYPE_NO", "ENROLLDATE", "START_TIME", "END_TIME", "APPROVAL_STATUS", "REASON")
    VALUES (SEQ_EXTRA_WORK_NO.NEXTVAL, 2, 0, '20230814', '1900', '2200', 0, '중요한 고객과의 회의로 인한 추가 근무');

-- ATTENDANCE_CURRENT
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (0, '결근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (1, '정상출근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (2, '휴가');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (3, '출장');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (4, '외근');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (5, '업무');
INSERT INTO ATTENDANCE_CURRENT(NO, TYPE) VALUES (6, '지각');

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
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/13', TO_TIMESTAMP('2023-07-13 08:53:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-13 18:02:34', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/14', TO_TIMESTAMP('2023-07-14 08:57:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-14 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '1' HOUR, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/17', TO_TIMESTAMP('2023-07-17 08:55:55', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-17 18:00:27', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/18', TO_TIMESTAMP('2023-07-18 08:53:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-18 18:02:34', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 0, '2023/07/19', TO_TIMESTAMP('2023-07-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '출장이였어요');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 0, '2023/07/20', TO_TIMESTAMP('2023-07-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '출장이였어요');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 0, '2023/07/21', TO_TIMESTAMP('2023-07-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '출장이였어요');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/24', TO_TIMESTAMP('2023-07-24 08:48:01', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-24 18:04:01', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 6, '2023/07/25', TO_TIMESTAMP('2023-07-25 09:05:59', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-25 18:10:12', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 6, '2023/07/26', TO_TIMESTAMP('2023-07-26 09:05:59', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-26 18:10:12', 'YYYY-MM-DD HH24:MI:SS'), '사실은 늦고싶지 않았어요');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/07/27', TO_TIMESTAMP('2023-07-27 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-27 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 1:15:30' DAY TO SECOND, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 6, '2023/07/28', TO_TIMESTAMP('2023-07-28 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-28 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 3:35:30' DAY TO SECOND, '지하철 시위로 대중교통이 지연되었어요.');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 0, '2023/07/31', TO_TIMESTAMP('2023-07-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),NULL);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/01', TO_TIMESTAMP('2023-08-01 08:59:02', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-01 18:06:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/02', TO_TIMESTAMP('2023-08-02 08:53:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-02 18:02:34', 'YYYY-MM-DD HH24:MI:SS'), null);

INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/03', TO_TIMESTAMP('2023-08-03 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-03 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 1:15:30' DAY TO SECOND, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 6, '2023/08/04', TO_TIMESTAMP('2023-08-04 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-04 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 3:35:30' DAY TO SECOND, '지하철 시위로 대중교통이 지연되었어요.');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 3, '2023/08/05', NULL, NULL,NULL);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/07', TO_TIMESTAMP('2023-08-07 08:59:02', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-07 18:06:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/08', TO_TIMESTAMP('2023-08-08 08:53:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-08 18:02:34', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/09', TO_TIMESTAMP('2023-08-09 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-09 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 1:15:30' DAY TO SECOND, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 6, '2023/08/10', TO_TIMESTAMP('2023-08-10 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-10 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 3:35:30' DAY TO SECOND, '지하철 시위로 대중교통이 지연되었어요.');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 3, '2023/08/11', TO_TIMESTAMP('2023-08-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),NULL);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 1, 1, '2023/08/14', TO_TIMESTAMP('2023-08-14 08:59:02', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-14 18:06:18', 'YYYY-MM-DD HH24:MI:SS'), null);


INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 6, 1, '2023/08/03', TO_TIMESTAMP('2023-08-03 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-03 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 1:15:30' DAY TO SECOND, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 5, 6, '2023/08/04', TO_TIMESTAMP('2023-08-04 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-04 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 3:35:30' DAY TO SECOND, '지하철 시위로 대중교통이 지연되었어요.');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 4, 3, '2023/08/05', NULL, NULL,NULL);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 3, 1, '2023/08/07', TO_TIMESTAMP('2023-08-07 08:59:02', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-07 18:06:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 1, '2023/08/08', TO_TIMESTAMP('2023-08-08 08:53:03', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-08 18:02:34', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 4, 1, '2023/08/11', TO_TIMESTAMP('2023-08-11 08:55:23', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 18:06:02', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 1:15:30' DAY TO SECOND, null);
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, PLUS_WORK_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 3, 6, '2023/08/11', TO_TIMESTAMP('2023-08-11 08:57:46', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 18:01:34', 'YYYY-MM-DD HH24:MI:SS'), INTERVAL '0 3:35:30' DAY TO SECOND, '지하철 시위로 대중교통이 지연되었어요.');
INSERT INTO ATTENDANCE(NO, USER_NO, CURRENT_NO, ENROLLDATE, CHECK_IN_TIME, CHECK_OUT_TIME, OBJECTION_REASON) 
    VALUES (SEQ_ATTENDANCE_NO.NEXTVAL, 2, 3, '2023/08/11', TO_TIMESTAMP('2023-08-11 08:57:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 18:21:00', 'YYYY-MM-DD HH24:MI:SS'),NULL);
    
    
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
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 7, 1, '2023/07/03', '형제 결혼식 예정으로 참여', '2023/07/03','2023/07/03');
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 6, 1, '2023/07/20', '정기 건강검진 예정', '2023/07/20', '2023/07/20');
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 2, 1, '2023/07/26', '하루 정도는 쉬어줘야겠습니다', '2023/07/26', '2023/07/26');
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME, STATUS) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 2, 1, '2023/08/23', '가족행사가 있어서 참여해야 할 것 같습니다', TO_TIMESTAMP('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME, STATUS) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 2, 1, '2023/08/18', '가족행사가 있어서 참여해야 할 것 같습니다', TO_TIMESTAMP('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO LEAVE (NO, USER_NO, LEAVE_NO, PROXY_NO, ENROLLDATE, REASON_CONTENT, START_TIME, END_TIME, STATUS) 
    VALUES (SEQ_LEAVE_NO.NEXTVAL, 2, 6, 1, '2023/08/21', '몸이 크게 안좋아 안정을 취해야한다는 진단을 받았습니다', TO_TIMESTAMP('2023-08-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);


-- CALENDAR_TYPE
INSERT INTO CALENDAR_TYPE (NO, TYPE, COLOR) VALUES (0, '개인', 'orange');
INSERT INTO CALENDAR_TYPE (NO, TYPE, COLOR) VALUES (1, '부서', 'purple');
INSERT INTO CALENDAR_TYPE (NO, TYPE, COLOR) VALUES (2, '회사', 'blue');
INSERT INTO CALENDAR_TYPE (NO, TYPE, COLOR) VALUES (3, '회의', 'green');
INSERT INTO CALENDAR_TYPE (NO, TYPE, COLOR) VALUES (4, '휴일', 'red');


-- CALENDAR
-- TYPE_NO : 0 (개인)
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 2, 0, NULL, '서류 작성', '오늘 동물들 아팠던 일 기록해두기', TO_TIMESTAMP('2023-07-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 0);
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 2, 0, NULL, '푸바오 먹이주기', '푸바오 사료 새로 찾아서 먹이줘야하니까 사이트 잘 찾아보기', TO_TIMESTAMP('2023-07-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '푸바오 우리', 0);
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 3, 0, NULL, '개인미팅', '거래처하고 미팅 준비해야하니까 준비물 챙겨가기', TO_TIMESTAMP('2023-08-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 0);
-- TYPE_NO : 1 (부서)
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 4, 1, NULL, '회식', '사유없이 빠지지 마세요', TO_TIMESTAMP('2023-08-11 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), '회사 앞 곱창집', 0);
-- TYPE_NO : 2 (회사)
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 5, 2, NULL, '동물 환영식', '동물원에 새로운 동물친구(원숭이)가 들어와요~ 다 같이 참고해서 신경 써주세요', TO_TIMESTAMP('2023-08-11 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-11 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), '원숭이zone', 0);
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS, ALL_DAY) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 1, 4, NULL, '조기퇴근의 날', '회사의 특별한 날입니다. 모두들 행복한 오후 보내세요.', TO_TIMESTAMP('2023-08-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 0, 1);
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS, ALL_DAY) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 1, 4, NULL, '광복절', '한반도가 일본 제국으로부터 해방된 것을 기념하는 날', TO_TIMESTAMP('2023-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 0, 1);
-- TYPE_NO : 3 (회의)
INSERT INTO CALENDAR (NO, USER_NO, TYPE_NO, REV_NO, TITLE, CONTENT, START_TIME, END_TIME, PLACE, STATUS) 
    VALUES (SEQ_CALENDAR_NO.NEXTVAL, 2, 3, 1, '회의 일정', '안건 : 담당 업무 중 디테일한 수정사항 자료 준비해오세요', TO_TIMESTAMP('2023-08-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 0);

-- MEETINGROOM
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '101호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2017/02/03', NULL,  NULL, '101호.jpeg', 13);
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '102호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2019/02/03', NULL,  NULL, '102호.jpeg', 20);    
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '103호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2021/02/03', NULL,  NULL, '103호.jpeg', 10);
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '104호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2021/02/03', NULL,  NULL, '104호.jpeg', 10);
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '105호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2022/02/03', NULL,  NULL, '105호.jpeg', 20);
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '106호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2022/02/03', NULL,  NULL, '106호.jpeg', 15);
INSERT INTO MEETINGROOM (NO, NAME, INFO, ENROLLDATE, MODIFYDATE, ORIGIN_NAME, CHANGE_NAME, CAPACITY) 
    VALUES (SEQ_MEETINGROOM_NO.NEXTVAL, '107호', '170㎡ 규모, 최대 120명 수용, 전시실로 적합, 회의장 용도로 사용 시 별도 문의', '2022/02/03', NULL,  NULL, '107호.jpeg', 9);

-- MEETINGROOM_RESERVATION
INSERT INTO MEETINGROOM_RESERVATION (NO, MEETINGROOM_NO, USER_NO, "DATE", START_TIME, END_TIME)
    VALUES (SEQ_MEETINGROOM_RESERVATION_NO.NEXTVAL, 1, 3, TO_DATE('2023/08/03', 'YYYY/MM/DD'), 2, 3);
INSERT INTO MEETINGROOM_RESERVATION ("NO", "MEETINGROOM_NO", "USER_NO", "DATE", "START_TIME", "END_TIME")
    VALUES (SEQ_MEETINGROOM_RESERVATION_NO.NEXTVAL, 1, 2, TO_DATE('2023/08/18', 'YYYY/MM/DD'), 11, 12);
    
    
---------------------------------------------------------------------------------------------------------------------------------------------------

--TASTE
INSERT INTO TASTE ("TASTE_NO" , "TASTE") VALUES (1 , '초식');
INSERT INTO TASTE ("TASTE_NO" , "TASTE") VALUES (2 , '육식');
INSERT INTO TASTE ("TASTE_NO" , "TASTE") VALUES (3 , '잡식');
COMMIT;

-- HABITAT
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (1 , '아프리카');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (2 , '유럽');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (3 , '중동');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (4 , '아시아');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (5 , '북아메리카');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (6 , '남아메리카');
INSERT INTO HABITAT ("HABITAT_NO" , "HABITAT") VALUES (7 , '오세아니아');
COMMIT;

--ENDANGERED_RATING
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (1 , '절멸(EX)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (2 , '야생절멸(EW)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (3 , '위급(CR)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (4 , '위기(EN)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (5 , '취약(VU)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (6 , '준위협(NT)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (7 , '최소관심(LC)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (8 , '정보부족(DD)');
INSERT INTO ENDANGERED_RATING ("ENDANGERED_RATING_NO" , "ENDANGERED") VALUES (9 , '미평가(NE)');
COMMIT;

--ANIMAL_CLASSIFICATION
INSERT INTO ANIMAL_CLASSIFICATION("NO" , "NAME") VALUES (1 , '포유류');
INSERT INTO ANIMAL_CLASSIFICATION("NO" , "NAME") VALUES (2 , '조류');
INSERT INTO ANIMAL_CLASSIFICATION("NO" , "NAME") VALUES (3 , '파충류');
INSERT INTO ANIMAL_CLASSIFICATION("NO" , "NAME") VALUES (4 , '양서류');
INSERT INTO ANIMAL_CLASSIFICATION("NO" , "NAME") VALUES (5 , '어류');
COMMIT;


--CURROPTION_SURVEY_QUESTION
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (1 , '동물원 내에서 부당한 업무 알선 및 청탁행위를 목격한 적이 있다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (2 , '동물원 내에서 일부 직원들에게 특혜를 주기 위한 행동을 하는 경우가 있다고 생각한다');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (3 , '예산을 부정적인 사용을 위해 의도적으로 편성하는 경향이 있다고 생각한다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (4 , '임원들은 직원의 이해관계에 치우치지 않고 공정하게 활동하고 있지 않다고 생각한다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (5 , '동물원 에서 부패 관련 사건에 직접적으로 관여한 적이 있다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (6 , '동물원 내에서 지년 1년간 금품이나 향응, 편의 제공을 목격한 적이 있다	');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (7 , '동물원에서는 부정 부패 방지 및 예방을 위해 최선을 다하고 있지 않다고 생각한다.	');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (8 , '동물원의 부정 부패·청렴 수준이 1 년전에 비해 개선되지 않았다고 생각한다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (9 , '나는 동물원의 청렴수준을 신뢰하고 있지 있다.');
INSERT INTO CURROPTION_SURVEY_QUESTION("NO" , "CONTENT") VALUES (10 , '동물원 에서 부패 문화나 부패를 조장하는 요인들이 있다');
COMMIT;

--RESEARCH
INSERT INTO RESEARCH("NO" , "TOTAL_SCORE") VALUES (1, 20);
INSERT INTO RESEARCH("NO" , "TOTAL_SCORE") VALUES (1, 20);
INSERT INTO RESEARCH("NO" , "TOTAL_SCORE") VALUES (1, 20);
INSERT INTO RESEARCH("NO" , "TOTAL_SCORE") VALUES (1, 50);


COMMIT;

--CURROPTION_SURVEY_USER    --SURVEY_NO": 부적합한 식별자
INSERT INTO CURROPTION_SURVEY_USER ("NO" , "SURVEY_NO") VALUES (1, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (2, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (3, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (4, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (5, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (6, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (7, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (8, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (9, 1);
INSERT INTO CURROPTION_SURVEY_USER("NO" , "SURVEY_NO") VALUES (10, 1);
COMMIT;

--ANIMAL_TRAINING
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,1 ,'이름 가르치기','CONTENT01');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,2 ,'대소변 가리기','CONTENT02');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,3 ,'먹이 사냥하기','CONTENT03');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,4 ,'환경 적응 훈련','CONTENT04');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,5 ,'시차 적응 훈련','CONTENT05');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,6 ,'기초 체력 강화 훈련','CONTENT06');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,7 ,'지구력 훈련','CONTENT07');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,8 ,'근력훈련','CONTENT08');
INSERT INTO ANIMAL_TRAINING (TRAINING_NO,NO,TITLE,CONTENT)VALUES(SEQ_ANIMAL_TRAINING_NO.NEXTVAL,9 ,'유연성 훈련','CONTENT09');



--ANIMAL_HEALTH_SCREENING
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,1 ,'암','내용01','질병01','생활습관 개선1');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,2 ,'폐혈증','내용02','질병012','생활습관 개선013');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,3 ,'우울증','내용03','질병013','생활습관 개선014');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,4 ,'감기','내용04','질병014','생활습관 개선015');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,5 ,'코로나','내용05','질병015','생활습관 개선016');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,6 ,'심장 질환','내용06','질병016','생활습관 개선017');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,7 ,'당뇨','내용07','질병0167','생활습관 개선081');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,8 ,'고혈압','내용08','질병017','생활습관 개선019');
INSERT INTO ANIMAL_HEALTH_SCREENING (NO,ANIMAL_NO,STATE_OF_HEALTH,CONTENT,DISEASE,LIFE_STYLE_MANAGEMENT)VALUES(SEQ_ANIMAL_HEALTH_SCREENING_NO.NEXTVAL,9 ,'부정맥','내용09','질병01234','생활습관 개선001');


-- 동물과 카테고리 데이터
INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '사자', 'FEILD01')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,1,1,1,1,'NAME01')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '호랑이', 'FEILD02')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,2,2,2,1,'NAME02')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '토끼', 'FEILD03')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,3,3,3,5,'NAME03')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '개구리', 'FEILD04')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,4,1,4,6,'NAME04')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '사슴', 'FEILD05')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,5,3,3,6,'NAME05')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '두꺼비', 'FEILD06')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,1,2,5,6,'NAME06')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '고라니', 'FEILD07')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,2,3,6,6,'NAME07')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '기린', 'FEILD08')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,3,3,7,6,'NAME08')
SELECT * FROM DUAL;

INSERT ALL
INTO "ANIMAL" ("NO", "CATEGORY_NO", "DEPARTMENT_NO", "PROFILE", "NICK_NAME", "FEILD")
VALUES (SEQ_ANIMAL_NO.NEXTVAL, SEQ_CATEGORY_NO.NEXTVAL,1, 'AAA.PMNG', '하마', 'FEILD09')
INTO "CATEGORY" ("CATEGORY_NO", "CLASSIFICATION_NO", "TASTE_NO", "HABITAT_NO", "ENDANGERED_RATING_NO", "NAME")
VALUES (SEQ_CATEGORY_NO.NEXTVAL,4,3,1,6,'NAME09')
SELECT * FROM DUAL;
        

---------------------------------------------------------------------------------------------------------------------------------------------------

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

---------------------------------------------------------------------------------------------------------------------------------------------------

구분,행정구역코드,1단계,2단계,3단계,격자 X,격자 Y
kor,1100000000,서울특별시,,,60,127
kor,1111000000,서울특별시,종로구,,60,127
kor,1114000000,서울특별시,중구,,60,127
kor,1117000000,서울특별시,용산구,,60,126
kor,1120000000,서울특별시,성동구,,61,127
kor,1121500000,서울특별시,광진구,,62,126
kor,1123000000,서울특별시,동대문구,,61,127
kor,1126000000,서울특별시,중랑구,,62,128
kor,1129000000,서울특별시,성북구,,61,127
kor,1130500000,서울특별시,강북구,,61,128
kor,1132000000,서울특별시,도봉구,,61,129
kor,1135000000,서울특별시,노원구,,61,129
kor,1138000000,서울특별시,은평구,,59,127
kor,1141000000,서울특별시,서대문구,,59,127
kor,1144000000,서울특별시,마포구,,59,127
kor,1147000000,서울특별시,양천구,,58,126
kor,1150000000,서울특별시,강서구,,58,126
kor,1153000000,서울특별시,구로구,,58,125
kor,1154500000,서울특별시,금천구,,59,124
kor,1156000000,서울특별시,영등포구,,58,126
kor,1159000000,서울특별시,동작구,,59,125
kor,1162000000,서울특별시,관악구,,59,125
kor,1165000000,서울특별시,서초구,,61,125
kor,1168000000,서울특별시,강남구,,61,126
kor,1171000000,서울특별시,송파구,,62,126
kor,1174000000,서울특별시,강동구,,62,126
kor,2600000000,부산광역시,,,98,76
kor,2611000000,부산광역시,중구,,97,74
kor,2614000000,부산광역시,서구,,97,74
kor,2617000000,부산광역시,동구,,98,75
kor,2620000000,부산광역시,영도구,,98,74
kor,2623000000,부산광역시,부산진구,,97,75
kor,2626000000,부산광역시,동래구,,98,76
kor,2629000000,부산광역시,남구,,98,75
kor,2632000000,부산광역시,북구,,96,76
kor,2635000000,부산광역시,해운대구,,99,75
kor,2638000000,부산광역시,사하구,,96,74
kor,2641000000,부산광역시,금정구,,98,77
kor,2644000000,부산광역시,강서구,,96,76
kor,2647000000,부산광역시,연제구,,98,76
kor,2650000000,부산광역시,수영구,,99,75
kor,2653000000,부산광역시,사상구,,96,75
kor,2671000000,부산광역시,기장군,,100,77
kor,2700000000,대구광역시,,,89,90
kor,2711000000,대구광역시,중구,,89,90
kor,2714000000,대구광역시,동구,,90,91
kor,2717000000,대구광역시,서구,,88,90
kor,2720000000,대구광역시,남구,,89,90
kor,2723000000,대구광역시,북구,,89,91
kor,2726000000,대구광역시,수성구,,89,90
kor,2729000000,대구광역시,달서구,,88,90
kor,2771000000,대구광역시,달성군,,86,88
kor,2800000000,인천광역시,,,55,124
kor,2811000000,인천광역시,중구,,54,125
kor,2814000000,인천광역시,동구,,54,125
kor,2817700000,인천광역시,미추홀구,,54,124
kor,2818500000,인천광역시,연수구,,55,123
kor,2820000000,인천광역시,남동구,,56,124
kor,2823700000,인천광역시,부평구,,55,125
kor,2824500000,인천광역시,계양구,,56,126
kor,2826000000,인천광역시,서구,,55,126
kor,2871000000,인천광역시,강화군,,51,130
kor,2872000000,인천광역시,옹진군,,54,124
kor,2900000000,광주광역시,,,58,74
kor,2911000000,광주광역시,동구,,60,74
kor,2914000000,광주광역시,서구,,59,74
kor,2915500000,광주광역시,남구,,59,73
kor,2917000000,광주광역시,북구,,59,75
kor,2920000000,광주광역시,광산구,,57,74
kor,3000000000,대전광역시,,,67,100
kor,3011000000,대전광역시,동구,,68,100
kor,3014000000,대전광역시,중구,,68,100
kor,3017000000,대전광역시,서구,,67,100
kor,3020000000,대전광역시,유성구,,67,101
kor,3023000000,대전광역시,대덕구,,68,100
kor,3100000000,울산광역시,,,102,84
kor,3111000000,울산광역시,중구,,102,84
kor,3114000000,울산광역시,남구,,102,84
kor,3117000000,울산광역시,동구,,104,83
kor,3120000000,울산광역시,북구,,103,85
kor,3171000000,울산광역시,울주군,,101,84
kor,3600000000,세종특별자치시,,,66,103
kor,3611000000,세종특별자치시,세종특별자치시,,66,103
kor,4100000000,경기도,,,60,120
kor,4111100000,경기도,수원시장안구,,60,121
kor,4111300000,경기도,수원시권선구,,60,120
kor,4111500000,경기도,수원시팔달구,,61,121
kor,4111700000,경기도,수원시영통구,,61,120
kor,4113100000,경기도,성남시수정구,,63,124
kor,4113300000,경기도,성남시중원구,,63,124
kor,4113500000,경기도,성남시분당구,,62,123
kor,4115000000,경기도,의정부시,,61,130
kor,4117100000,경기도,안양시만안구,,59,123
kor,4117300000,경기도,안양시동안구,,59,123
kor,4119000000,경기도,부천시,,56,125
kor,4121000000,경기도,광명시,,58,125
kor,4122000000,경기도,평택시,,62,114
kor,4125000000,경기도,동두천시,,61,134
kor,4127100000,경기도,안산시상록구,,58,121
kor,4127300000,경기도,안산시단원구,,57,121
kor,4128100000,경기도,고양시덕양구,,57,128
kor,4128500000,경기도,고양시일산동구,,56,129
kor,4128700000,경기도,고양시일산서구,,56,129
kor,4129000000,경기도,과천시,,60,124
kor,4131000000,경기도,구리시,,62,127
kor,4136000000,경기도,남양주시,,64,128
kor,4137000000,경기도,오산시,,62,118
kor,4139000000,경기도,시흥시,,57,123
kor,4141000000,경기도,군포시,,59,122
kor,4143000000,경기도,의왕시,,60,122
kor,4145000000,경기도,하남시,,64,126
kor,4146100000,경기도,용인시처인구,,64,119
kor,4146300000,경기도,용인시기흥구,,62,120
kor,4146500000,경기도,용인시수지구,,62,121
kor,4148000000,경기도,파주시,,56,131
kor,4150000000,경기도,이천시,,68,121
kor,4155000000,경기도,안성시,,65,115
kor,4157000000,경기도,김포시,,55,128
kor,4159000000,경기도,화성시,,57,119
kor,4161000000,경기도,광주시,,65,123
kor,4163000000,경기도,양주시,,61,131
kor,4165000000,경기도,포천시,,64,134
kor,4167000000,경기도,여주시,,71,121
kor,4180000000,경기도,연천군,,61,138
kor,4182000000,경기도,가평군,,69,133
kor,4183000000,경기도,양평군,,69,125
kor,4300000000,충청북도,,,69,107
kor,4311100000,충청북도,청주시상당구,,69,106
kor,4311200000,충청북도,청주시서원구,,69,107
kor,4311300000,충청북도,청주시흥덕구,,67,106
kor,4311400000,충청북도,청주시청원구,,69,107
kor,4313000000,충청북도,충주시,,76,114
kor,4315000000,충청북도,제천시,,81,118
kor,4372000000,충청북도,보은군,,73,103
kor,4373000000,충청북도,옥천군,,71,99
kor,4374000000,충청북도,영동군,,74,97
kor,4374500000,충청북도,증평군,,71,110
kor,4375000000,충청북도,진천군,,68,111
kor,4376000000,충청북도,괴산군,,74,111
kor,4377000000,충청북도,음성군,,72,113
kor,4380000000,충청북도,단양군,,84,115
kor,4400000000,충청남도,,,68,100
kor,4413100000,충청남도,천안시동남구,,63,110
kor,4413300000,충청남도,천안시서북구,,63,112
kor,4415000000,충청남도,공주시,,63,102
kor,4418000000,충청남도,보령시,,54,100
kor,4420000000,충청남도,아산시,,60,110
kor,4421000000,충청남도,서산시,,51,110
kor,4423000000,충청남도,논산시,,62,97
kor,4425000000,충청남도,계룡시,,65,99
kor,4427000000,충청남도,당진시,,54,112
kor,4471000000,충청남도,금산군,,69,95
kor,4476000000,충청남도,부여군,,59,99
kor,4477000000,충청남도,서천군,,55,94
kor,4479000000,충청남도,청양군,,57,103
kor,4480000000,충청남도,홍성군,,55,106
kor,4481000000,충청남도,예산군,,58,107
kor,4482500000,충청남도,태안군,,48,109
kor,4500000000,전라북도,,,63,89
kor,4511100000,전라북도,전주시완산구,,63,89
kor,4511300000,전라북도,전주시덕진구,,63,89
kor,4513000000,전라북도,군산시,,56,92
kor,4514000000,전라북도,익산시,,60,91
kor,4518000000,전라북도,정읍시,,58,83
kor,4519000000,전라북도,남원시,,68,80
kor,4521000000,전라북도,김제시,,59,88
kor,4571000000,전라북도,완주군,,63,89
kor,4572000000,전라북도,진안군,,68,88
kor,4573000000,전라북도,무주군,,72,93
kor,4574000000,전라북도,장수군,,70,85
kor,4575000000,전라북도,임실군,,66,84
kor,4577000000,전라북도,순창군,,63,79
kor,4579000000,전라북도,고창군,,56,80
kor,4580000000,전라북도,부안군,,56,87
kor,4600000000,전라남도,,,51,67
kor,4611000000,전라남도,목포시,,50,67
kor,4613000000,전라남도,여수시,,73,66
kor,4615000000,전라남도,순천시,,70,70
kor,4617000000,전라남도,나주시,,56,71
kor,4623000000,전라남도,광양시,,73,70
kor,4671000000,전라남도,담양군,,61,78
kor,4672000000,전라남도,곡성군,,66,77
kor,4673000000,전라남도,구례군,,69,75
kor,4677000000,전라남도,고흥군,,66,62
kor,4678000000,전라남도,보성군,,62,66
kor,4679000000,전라남도,화순군,,61,72
kor,4680000000,전라남도,장흥군,,59,64
kor,4681000000,전라남도,강진군,,57,63
kor,4682000000,전라남도,해남군,,54,61
kor,4683000000,전라남도,영암군,,56,66
kor,4684000000,전라남도,무안군,,52,71
kor,4686000000,전라남도,함평군,,52,72
kor,4687000000,전라남도,영광군,,52,77
kor,4688000000,전라남도,장성군,,57,77
kor,4689000000,전라남도,완도군,,57,56
kor,4690000000,전라남도,진도군,,48,59
kor,4691000000,전라남도,신안군,,50,66
kor,4700000000,경상북도,,,89,91
kor,4711100000,경상북도,포항시남구,,102,94
kor,4711300000,경상북도,포항시북구,,102,95
kor,4713000000,경상북도,경주시,,100,91
kor,4715000000,경상북도,김천시,,80,96
kor,4717000000,경상북도,안동시,,91,106
kor,4719000000,경상북도,구미시,,84,96
kor,4721000000,경상북도,영주시,,89,111
kor,4723000000,경상북도,영천시,,95,93
kor,4725000000,경상북도,상주시,,81,102
kor,4728000000,경상북도,문경시,,81,106
kor,4729000000,경상북도,경산시,,91,90
kor,4772000000,경상북도,군위군,,88,99
kor,4773000000,경상북도,의성군,,90,101
kor,4775000000,경상북도,청송군,,96,103
kor,4776000000,경상북도,영양군,,97,108
kor,4777000000,경상북도,영덕군,,102,103
kor,4782000000,경상북도,청도군,,91,86
kor,4783000000,경상북도,고령군,,83,87
kor,4784000000,경상북도,성주군,,83,91
kor,4785000000,경상북도,칠곡군,,85,93
kor,4790000000,경상북도,예천군,,86,107
kor,4792000000,경상북도,봉화군,,90,113
kor,4793000000,경상북도,울진군,,102,115
kor,4794000000,경상북도,울릉군,,127,127
kor,4800000000,경상남도,,,91,77
kor,4812100000,경상남도,창원시의창구,,90,77
kor,4812300000,경상남도,창원시성산구,,91,76
kor,4812500000,경상남도,창원시마산합포구,,89,76
kor,4812700000,경상남도,창원시마산회원구,,89,76
kor,4812900000,경상남도,창원시진해구,,91,75
kor,4817000000,경상남도,진주시,,81,75
kor,4822000000,경상남도,통영시,,87,68
kor,4824000000,경상남도,사천시,,80,71
kor,4825000000,경상남도,김해시,,95,77
kor,4827000000,경상남도,밀양시,,92,83
kor,4831000000,경상남도,거제시,,90,69
kor,4833000000,경상남도,양산시,,97,79
kor,4872000000,경상남도,의령군,,83,78
kor,4873000000,경상남도,함안군,,86,77
kor,4874000000,경상남도,창녕군,,87,83
kor,4882000000,경상남도,고성군,,85,71
kor,4884000000,경상남도,남해군,,77,68
kor,4885000000,경상남도,하동군,,74,73
kor,4886000000,경상남도,산청군,,76,80
kor,4887000000,경상남도,함양군,,74,82
kor,4888000000,경상남도,거창군,,77,86
kor,4889000000,경상남도,합천군,,81,84
kor,5000000000,제주특별자치도,,,52,38
kor,5011000000,제주특별자치도,제주시,,53,38
kor,5013000000,제주특별자치도,서귀포시,,52,33
kor,5019000000,이어도,,,28,8
kor,5019099000,이어도,,,28,8
kor,5100000000,강원특별자치도,,,73,134
kor,5111000000,강원특별자치도,춘천시,,73,134
kor,5113000000,강원특별자치도,원주시,,76,122
kor,5115000000,강원특별자치도,강릉시,,92,131
kor,5117000000,강원특별자치도,동해시,,97,127
kor,5119000000,강원특별자치도,태백시,,95,119
kor,5121000000,강원특별자치도,속초시,,87,141
kor,5123000000,강원특별자치도,삼척시,,98,125
kor,5172000000,강원특별자치도,홍천군,,75,130
kor,5173000000,강원특별자치도,횡성군,,77,125
kor,5175000000,강원특별자치도,영월군,,86,119
kor,5176000000,강원특별자치도,평창군,,84,123
kor,5177000000,강원특별자치도,정선군,,89,123
kor,5178000000,강원특별자치도,철원군,,65,139
kor,5179000000,강원특별자치도,화천군,,72,139
kor,5180000000,강원특별자치도,양구군,,77,139
kor,5181000000,강원특별자치도,인제군,,80,138
kor,5182000000,강원특별자치도,고성군,,85,145
kor,5183000000,강원특별자치도,양양군,,88,138


COMMIT;