-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe_tips.csv' 
into table recipe_tips
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r' -- '\r' 제외
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류시 사용

select * from recipe_tips;

CREATE TABLE recipe_tips
(
    `tip_code`      INT UNSIGNED     NOT NULL    COMMENT '팁 코드', 
    `cooking_code`  INT UNSIGNED     NOT NULL    COMMENT '조리 과정 코드', 
    `m_id`          VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
    `reg_date`      DATETIME         NOT NULL    COMMENT '작성 일자', 
    `user_tip`      VARCHAR(2000)    NOT NULL        COMMENT '작성자 과정 팁', 
    `rcp_code`      INT UNSIGNED     NOT NULL    COMMENT '레시피 코드', 
     PRIMARY KEY (tip_code)
);

ALTER TABLE recipe_tips COMMENT '레시피 순서별 팁 정보';

ALTER TABLE recipe_tips
    ADD CONSTRAINT FK_recipe_tips_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE recipe_tips
    ADD CONSTRAINT FK_recipe_tips_cooking_code_recipe_cookings_cooking_code FOREIGN KEY (cooking_code)
        REFERENCES recipe_cookings (cooking_code) ON DELETE RESTRICT ON UPDATE RESTRICT;