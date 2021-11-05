-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/alternative_ingredients.csv' 
into table alternative_ingredients
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r\n' 제외
ignore 1 rows;


select * from alternative_ingredients;

drop table alternative_ingredients;


-- alternative_ingredients Table Create SQL
CREATE TABLE alternative_ingredients
(
    `alt_ingre_code`    INT UNSIGNED     NOT NULL    COMMENT '대체 식재료 코드', 
    `raw_ingre_name`    VARCHAR(20)      NOT NULL    COMMENT '원재료 명', 
    `alter_ingre_name`  VARCHAR(20)      NOT NULL    COMMENT '대체재료 명', 
    `brief_desc`        VARCHAR(2000)    NULL        COMMENT '요약설명', 
    `reg_date`          DATETIME         NOT NULL    COMMENT '작성 일자', 
    `m_id`              VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (alt_ingre_code)
);

ALTER TABLE alternative_ingredients COMMENT '대체 식재료 정보';

ALTER TABLE alternative_ingredients
    ADD CONSTRAINT FK_alternative_ingredients_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;