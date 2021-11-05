-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/comments.csv' 
into table comments
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r\n' 제외
ignore 1 rows;

select * from comments;

drop table comments;

CREATE TABLE comments
(
    `cmt_code`      INT UNSIGNED     NOT NULL    COMMENT '댓글 코드', 
    `article_code`  INT UNSIGNED     NOT NULL    COMMENT '게시판 코드', 
    `cmt_content`   VARCHAR(2000)    NOT NULL    COMMENT '댓글 내용', 
    `reg_date`      DATETIME         NOT NULL    COMMENT '작성 일자', 
    `m_id`          VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (cmt_code)
);

ALTER TABLE comments COMMENT '게시판 댓글 정보';

ALTER TABLE comments
    ADD CONSTRAINT FK_comments_article_code_articles_article_code FOREIGN KEY (article_code)
        REFERENCES articles (article_code) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE comments
    ADD CONSTRAINT FK_comments_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;