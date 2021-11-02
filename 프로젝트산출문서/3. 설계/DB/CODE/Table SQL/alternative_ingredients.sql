select * from alternative_ingredients;

insert into alternative_ingredients(alt_ingre_code, raw_ingre_name, alter_ingre_name, brief_desc, reg_date, m_id)
values(1, "사과", "물엿", '사정없이간다', "2021-11-02",'test');

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

