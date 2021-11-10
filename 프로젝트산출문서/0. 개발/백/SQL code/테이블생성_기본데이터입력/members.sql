-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/members.csv' 
into table members
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r\n' 제외
ignore 1 rows;


select * from members;

drop table members;


-- create
CREATE TABLE members
(
    `m_id`        VARCHAR(20)    NOT NULL    COMMENT '회원 아이디', 
    `m_pwd`       VARCHAR(20)    NOT NULL    COMMENT '회원 비밀번호', 
    `m_name`      VARCHAR(20)    NOT NULL    COMMENT '회원 이름', 
    `m_age`       INT            NOT NULL    COMMENT '회원 나이', 
    `m_gender`    VARCHAR(1)     NOT NULL    COMMENT '회원 성별', 
    `m_joindate`  DATETIME       NULL    COMMENT '가입 일자', 
    `admin_yn`    VARCHAR(1)     NOT NULL    COMMENT '관리자 여부', 
     PRIMARY KEY (m_id)
);

ALTER TABLE members COMMENT '회원 정보';