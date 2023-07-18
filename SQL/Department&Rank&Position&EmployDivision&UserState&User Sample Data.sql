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
    'user0001',
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
    'rkive@zoody.co.kr',
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
    'profile-img',
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
    NULL,
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
    '맹수연',
    'F',
    '19970901',
    'profile-img',
    '404',
    '안산',
    '010-1223-1223',
    'user1223@zoody.co.kr',
    '20130109',
    NULL,
    NULL,
    '07012231223',
    3,
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



