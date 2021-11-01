CREATE TABLE members
(
    `m_id`      VARCHAR(20) NOT NULL comment '회원 아이디',
    `m_pwd`     VARCHAR(20) NOT NULL comment '회원 비밀번호',
    `m_name`    VARCHAR(20) NOT NULL comment '회원 이름',
    `m_age`     INT         NOT NULL comment '회원 나이',
    `m_gender`  VARCHAR(1)  NOT NULL comment '회원 성별',
    `m_joindate`DATETIME    NOT NULL comment '가입 일자',
    `admin_yn`  VARCHAR(1)  NOT NULL comment '관리자 여부',
    PRIMARY KEY (m_id)
);

ALTER TABLE members COMMENT '회원 정보';

CREATE TABLE recipe_basics
(
    `rcp_code`      INT UNSIGNED    NOT NULL AUTO_INCREMENT COMMENT '레시피 코드',
    `rcp_name`      VARCHAR(20)     NOT NULL COMMENT '레시피 이름',
    `rcp_desc`      VARCHAR(150)    NOT NULL COMMENT '레시피 간략소개',
    `rcp_t_code`    INT             NOT NULL COMMMET '레시피 유형코드',
    `rcp_cooking_time` VARCHAR(20)  NOT NULL COMMENT '레시피 조리시간',
    `rcp_t`         VARCHAR(20)     NOT NULL COMMENT '레시피 유형분류',
    `rcp_calory`    VARCHAR(20)     NOT NULL COMMENT '레시피 칼로리',
    `rcp_size`      VARCHAR(20)     NOT NULL COMMENT '레시피 분량',
    `rcp_level`     INT             NOT NULL COMMENT '레시피 난이도',
    `rcp_pic1`      VARCHAR(150)    NOT NULL COMMNET '레시피 이미지',
    `reg_date`      VARCHAR(20)     NOT NULL COMMENT '작성일자',
    `m_id`          VARCHAR(20)     NOT NULL COMMENT '회원 아이디',
    PRIMARY KEY (rcp_code)
);

ALTER TABLE recipe_basics COMMENT '레시피 기본 정보';
ALTER TABLE recipe recipe_basics
    ADD CONSTRAINT FK_recipe_basics_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT

-- 게시판 정보
CREATE TABLE articles
(
    `article_code`  INT UNSIGNED    not null atuo_increment comment '게시판 코드',
    `article_title` VARCHAR(150)    not null comment '글 제목',
    `article_content` varchar(2000) not null comment '글 내용',
    `m_id`  varchar(20) not null comment '회원 아이디',
    `reg_date` DATETIME not null comment '작성 일자',
    `file1` varchar(150)    not null comment '첨부파일1',
    `file1` varchar(150)    not null comment '첨부파일2',
    PRIMARY Key (article_code)
);
alter Table articles comment '게시판 정보';

alter table articles
    add constraint FK_articles_m_id_members_id FOREIGN Key(m_id)
        REFERENCES members(m_id) on delete restrict on update restrict;


-- 조리 과정 코드
create table recipe_cookings
(
    `cooking_code`  int UNSIGNED not null atuo_increment '조리 과정 코드',
    `rcp_code`  int UNSIGNED not null comment '레시피 코드',
    `cooking_order` int UNSIGNED not null comment '요리 순서',
    `cooking_content` varchar(200) not null comment '요리설명',
    `cooking_img1`  varchar(150)  null comment '과정 이미지1',
    `cookig_tip` varchar(2000)  null comment '조리 과정 팁',
    `reg_date` DATETIME not null comment '작성일자',
    `m_id`  varchar(20) not null comment '회원 아이디',
    PRIMARY Key (cooking_code)
);

alter table recipe_cookings comment '레시피 조리 과정 정보';

alter table recipe_cookings
    add constraint FK_recipe_cookings_rcp_code_recipe_basics_rcp_code FOREIGN Key(rcp_code)
        REFERENCES recipe_basic (rcp_code) on delete restrict on update restrict;

alter table recipe_cookings
    add constraint FK_recipe_cookings_m_id_members_m_id FOREIGN Key(m_id)
        REFERENCES members(m_id) on delete restrict on update restrict;


-- 레시피 재료 정보
create table recipe_ingredients
(
    `ingre_code` int UNSIGNED not null atuo_increment comment '재료코드',
    `rcp_code` int UNSIGNED not null comment '레시피 코드',
    `ingre_name` varchar(150) comment '재료 명',
    `ingre_weight` int null comment '재료 용량',
    `ingre_t_code` int comment '재료 타입 코드',
    `ingre_t_name` varchar(20)  comment '재료 타입 명',
    Primary Key (ingre_code)


);

alter table recipe_ingredients comment '레시피 재료 정보';
alter table recipe_ingredients
    add constraint FK_recipe_ingredients_rcp_code_recipe_basic_rcp_code FOREIGN Key(rcp_code)
        REFERENCES recipe_basics (rcp_code) on delete restrict on update restrict;

-- 대체 식재료 코드
create table alternative_ingredients
(
    `alt_ingre_code` int UNSIGNED not null atuo_increment comment '대체 식재료 코드',
    `raw_ingre_name` varchar(20)    not null comment '원재료 명',
    `alter_ingre_name` varchar(20)  not null  comment '대체재료 명',
    `brief_desc` varchar(2000)   null comment '요약 설명',
    `reg_date` DATETIME not null comment '작성 일자',
    `m_id` varchar(20)  not null comment '회원 아이디'
);

alter table alternative_ingredients comment '대체 식재료 정보';

alter table alternative_ingredients
    add constraint FK_alternative_ingredients_m_id_member FOREIGN Key (m_id)
        REFERENCES members (m_id) on delete restrict on update restrict;

--- 레시피 팁

create table recipe_tips
(
    `tip_code`  int UNSIGNED not null atuo_increment comment '팁 코드',
    `cooking_code`  int UNSIGNED not null comment '조리 과정 코드',
    `m_id` varchar(20) not null comment '회원 아이디',
    `reg_date` DATETIME not null comment '작성 일자',
    `user_tip` varchar(2000)    not null comment '작성자 과정 팁',
    Primary Key (tip_code)

);

alter table recipe_tips comment '레시피 순서별 팁 정보';

alter table recipe_tips
    add constraint FK_recipe_tips_m_id_members_m_id FOREIGN Key (m_id)
        REFERENCES members (m_id) on delete restrict on update restrict;

alter table recipe_tips
    add constraint FK_recipe_tips_cooking_code_recipe_cookings_cooking_cooking_code FOREIGN Key(cookig_code)
        REFERENCES recipe_cookings (cooking_code) on delete restrict on update restrict;



