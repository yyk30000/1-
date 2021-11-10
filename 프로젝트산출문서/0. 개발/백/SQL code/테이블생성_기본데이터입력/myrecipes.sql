-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/myrecipes.csv' 
into table myrecipes
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r'\n 제외
ignore 1 rows;

select * from myrecipes;

drop table myrecipes;

-- myrecipes Table Create SQL
CREATE TABLE myrecipes
(
    `m_rcp_code`  INT UNSIGNED    NOT NULL auto_increment    COMMENT '나의 레시피 코드', 
    `rcp_code`    INT UNSIGNED    NOT NULL    COMMENT '레시피 코드', 
    `m_id`        VARCHAR(20)     NOT NULL    COMMENT '회원 아이디', 
    `reg_date`    DATETIME        NOT NULL    COMMENT '작성 일자', 
    `user_memo`   VARCHAR(150)    NULL        COMMENT '회원 메모', 
     PRIMARY KEY (m_rcp_code)
);

ALTER TABLE myrecipes COMMENT '나의 레시피 정보';

ALTER TABLE myrecipes
    ADD CONSTRAINT FK_myrecipes_rcp_code_recipe_basics_rcp_code FOREIGN KEY (rcp_code)
        REFERENCES recipe_basics (rcp_code) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE myrecipes
    ADD CONSTRAINT FK_myrecipes_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;