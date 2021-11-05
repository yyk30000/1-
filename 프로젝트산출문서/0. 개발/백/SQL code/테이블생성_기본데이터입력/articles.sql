-- 제약조건 해지 or 생성
SET FOREIGN_KEY_CHECKS = 1;

load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/articles.csv' 
into table articles
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r\n' 제외
ignore 1 rows;

select * from articles;

drop table articles;

-- articles Table Create SQL
CREATE TABLE articles
(
    `article_code`     INT UNSIGNED     NOT NULL    COMMENT '게시판 코드', 
    `article_title`    VARCHAR(150)     NOT NULL    COMMENT '글 제목', 
    `article_content`  VARCHAR(2000)    NOT NULL    COMMENT '글 내용', 
    `m_id`             VARCHAR(20)      NOT NULL    COMMENT '회원 아이디', 
    `reg_date`         DATETIME         NOT NULL    COMMENT '작성 일자', 
    `file1`            VARCHAR(150)     NULL        COMMENT '첨부 파일1', 
    `file2`            VARCHAR(150)     NULL        COMMENT '첨부 파일2', 
     PRIMARY KEY (article_code)
);

ALTER TABLE articles COMMENT '게시판 정보';

ALTER TABLE articles
    ADD CONSTRAINT FK_articles_m_id_members_m_id FOREIGN KEY (m_id)
        REFERENCES members (m_id) ON DELETE RESTRICT ON UPDATE RESTRICT;