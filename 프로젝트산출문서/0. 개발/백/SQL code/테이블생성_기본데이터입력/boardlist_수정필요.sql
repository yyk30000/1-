

select * from boardlist;

select img_code, title, m_id
from boardlist;

drop table boardlist;


CREATE TABLE boardlist
(
    `img_code`  INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '게시판 코드', 
    `title`     VARCHAR(150)     NOT NULL    COMMENT '글 제목', 
    `m_id`      VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
    `img_1`     VARCHAR(150)     NULL        COMMENT '이미지1', 
    `desc_1`    VARCHAR(2000)    NOT NULL    COMMENT '내용1', 
    `img_2`     VARCHAR(150)     NULL        COMMENT '이미지2', 
    `desc_2`    VARCHAR(2000)    NULL        COMMENT '내용2', 
    `img_3`     VARCHAR(150)     NULL        COMMENT '이미지3', 
    `desc_3`    VARCHAR(2000)    NULL        COMMENT '내용3', 
    `img_4`     VARCHAR(150)     NULL        COMMENT '이미지4', 
    `desc_4`    VARCHAR(2000)    NULL        COMMENT '내용4', 
    `img_5`     VARCHAR(150)     NULL        COMMENT '이미지5', 
    `desc_5`    VARCHAR(2000)    NULL        COMMENT '내용5', 
    `img_6`     VARCHAR(150)     NULL        COMMENT '이미지6', 
    `desc_6`    VARCHAR(2000)    NULL        COMMENT '내용6', 
     PRIMARY KEY (img_code)
);

ALTER TABLE boardlist COMMENT '게시판 정보';

ALTER TABLE boardlist
    ADD CONSTRAINT FK_boardlist_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;