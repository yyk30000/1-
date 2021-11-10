-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/alternative_ingredients_link.csv' 
into table alternative_ingredients_link
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r\n' 제외
ignore 1 rows;

select * from alternative_ingredients_link;

drop table alternative_ingredients_link;

-- alternative_ingredients_link Table Create SQL
CREATE TABLE alternative_ingredients_link
(
    `link_code`       INT UNSIGNED    auto_increment NOT NULL    COMMENT '링크 코드', 
    `rcp_code`      INT UNSIGNED    NOT NULL    COMMENT '재료 코드', 
    `alt_ingre_code`  INT UNSIGNED    NOT NULL    COMMENT '대체 식재료 코드', 
     PRIMARY KEY (link_code)
);

ALTER TABLE alternative_ingredients_link COMMENT '재료 정보 링크';

ALTER TABLE alternative_ingredients_link
    ADD CONSTRAINT FK_alternative_ingredients_link_rcp_code_recipe_ingredients_in FOREIGN KEY (rcp_code)
        REFERENCES recipe_basics (rcp_code) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE alternative_ingredients_link
    ADD CONSTRAINT FK_alternative_ingredients_link_alt_ingre_code_alternative_ingre FOREIGN KEY (alt_ingre_code)
        REFERENCES alternative_ingredients (alt_ingre_code) ON DELETE RESTRICT ON UPDATE RESTRICT;




select * from alternative_ingredients_link;
select * from recipe_ingredients;
select * from alternative_ingredients;

-- 통합뷰 
select ri.rcp_code, ri.ingre_name, ai.alter_ingre_name,ai.brief_desc
from alternative_ingredients_link al , recipe_ingredients ri, alternative_ingredients ai
where al.ingre_code = ri.ingre_code and ai.alt_ingre_code = al.alt_ingre_code;

