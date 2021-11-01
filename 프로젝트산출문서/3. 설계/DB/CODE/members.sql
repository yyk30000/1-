select * from members;

drop table members;

insert into members
values ('test', '12345', 'test', 16, '0', '2021.11.01', 'y');


-- create
CREATE TABLE members
(
    `m_id`        VARCHAR(20)    NOT NULL    COMMENT '회원 아이디', 
    `m_pwd`       VARCHAR(20)    NOT NULL    COMMENT '회원 비밀번호', 
    `m_name`      VARCHAR(20)    NOT NULL    COMMENT '회원 이름', 
    `m_age`       INT            NOT NULL    COMMENT '회원 나이', 
    `m_gender`    VARCHAR(1)     NOT NULL    COMMENT '회원 성별', 
    `m_joindate`  DATETIME       NOT NULL    COMMENT '가입 일자', 
    `admin_yn`    VARCHAR(1)     NOT NULL    COMMENT '관리자 여부', 
     PRIMARY KEY (m_id)
);

ALTER TABLE members COMMENT '회원 정보';