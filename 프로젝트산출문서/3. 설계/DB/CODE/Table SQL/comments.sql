drop table comments;

insert into comments(cmt_code, article_code, cmt_content, reg_date, m_id)
values(1, 1, "바이염", '2021-11-02', 'test');

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