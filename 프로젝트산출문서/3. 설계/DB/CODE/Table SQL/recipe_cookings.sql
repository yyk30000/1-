-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe_cookings.csv' 
into table recipe_cookings
fields terminated by','
LINES TERMINATED BY '\r' -- '\r' 제외
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류시 사용

select * from recipe_cookings;

drop table recipe_cookings;

CREATE TABLE recipe_cookings
(
    `cooking_code`     INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '조리 과정 코드', 
    `rcp_code`         INT UNSIGNED     NOT NULL    COMMENT '레시피 코드', 
    `cooking_order`    INT UNSIGNED     NOT NULL    COMMENT '요리 순서', 
    `cooking_content`  VARCHAR(2000)    NOT NULL    COMMENT '요리 설명', 
    `cooking_img1`     VARCHAR(150)     NULL        COMMENT '과정 이미지1', 
    `cooking_tip`      VARCHAR(2000)    NULL        COMMENT '조리 과정 팁', 
    `reg_date`         DATETIME         NOT NULL    COMMENT '작성 일자', 
    `m_id`             VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (cooking_code)
);

ALTER TABLE recipe_cookings COMMENT '레시피 조리 과정 정보';

ALTER TABLE recipe_cookings
    ADD CONSTRAINT FK_recipe_cookings_rcp_code_recipe_basics_rcp_code FOREIGN KEY (rcp_code)
        REFERENCES recipe_basics (rcp_code) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE recipe_cookings
    ADD CONSTRAINT FK_recipe_cookings_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
