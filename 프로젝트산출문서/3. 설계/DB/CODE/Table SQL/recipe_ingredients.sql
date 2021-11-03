-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe_ingredients.csv' 
into table recipe_ingredients
fields terminated by','
LINES TERMINATED BY '\r' -- '\r' 제외
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류 시 사용

select * from recipe_ingredients;

drop table recipe_ingredients;

CREATE TABLE recipe_ingredients
(
    `ingre_code`    INT UNSIGNED    NOT NULL    COMMENT '재료 코드', 
    `rcp_code`      INT UNSIGNED    NOT NULL    COMMENT '레시피 코드', 
    `ingre_name`    VARCHAR(150)    NOT NULL    COMMENT '재료 명', 
    `ingre_weight`  VARCHAR(20)     NULL        COMMENT '재료 용량', 
    `ingre_t_code`  INT             NOT NULL    COMMENT '재료 타입 코드', 
    `ingre_t_name`  VARCHAR(20)     NOT NULL    COMMENT '재료 타입 명', 
     PRIMARY KEY (ingre_code)
);

ALTER TABLE recipe_ingredients COMMENT '레시피 재료 정보';

ALTER TABLE recipe_ingredients
    ADD CONSTRAINT FK_recipe_ingredients_rcp_code_recipe_basics_rcp_code FOREIGN KEY (rcp_code)
        REFERENCES recipe_basics (rcp_code) ON DELETE RESTRICT ON UPDATE RESTRICT;
