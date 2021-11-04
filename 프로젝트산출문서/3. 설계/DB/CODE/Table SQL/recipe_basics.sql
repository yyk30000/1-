-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe_basics.csv' 
into table recipe_basics
CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r' 제외
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류시 사용
SET FOREIGN_KEY_CHECKS = 1;

select * from recipe_basics;

drop table recipe_basics;

cREATE TABLE recipe_basics
(
    `rcp_code`          INT UNSIGNED    NOT NULL    COMMENT '레시피 코드', 
    `rcp_name`          VARCHAR(20)     NOT NULL    COMMENT '레시피 이름', 
    `rcp_desc`          VARCHAR(150)    NOT NULL    COMMENT '레시피 간략소개', 
    `rcp_t_code`        INT             NOT NULL    COMMENT '레시피 유형코드', 
    `rcp_cooking_time`  VARCHAR(20)     NOT NULL    COMMENT '레시피 조리시간', 
    `rcp_t`             VARCHAR(20)     NOT NULL    COMMENT '레시피 유형분류', 
    `rcp_calory`        VARCHAR(20)     NOT NULL    COMMENT '레시피 칼로리', 
    `rcp_size`          VARCHAR(20)     NOT NULL    COMMENT '레시피 분량', 
    `rcp_level`         INT             NOT NULL    COMMENT '레시피 난이도', 
    `rcp_pic1`          VARCHAR(150)    NULL        COMMENT '레시피 이미지1', 
    `reg_date`          DATETIME        NOT NULL    COMMENT '작성일자', 
    `m_id`              VARCHAR(20)     NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (rcp_code)
);

ALTER TABLE recipe_basics COMMENT '레시피 기본 정보';

ALTER TABLE recipe_basics
    ADD CONSTRAINT FK_recipe_basics_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
