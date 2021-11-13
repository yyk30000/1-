

select * from boardlist;

select img_code, title, m_id
from boardlist;

drop table boardlist;


CREATE TABLE boardlist
(
    `img_code`      INT UNSIGNED     NOT NULL    auto_increment COMMENT '이미지 코드', 
    `title` 		VARCHAR(50)	     NOT NULL    COMMENT '제목', 
    `m_id`      	VARCHAR(20)      NOT NULL    COMMENT '작성자', 
    `img_1`      	VARCHAR(30)    	 NOT NULL    COMMENT '이미지1',
    `desc_1`        VARCHAR(2000)    NOT NULL    COMMENT '내용1',
    `img_2`      	VARCHAR(30)      NULL    COMMENT '이미지2', 
    `desc_2`        VARCHAR(2000)    NULL    COMMENT '내용2',
	`img_3`      	VARCHAR(30)      NULL    COMMENT '이미지3', 
    `desc_3`        VARCHAR(2000)    NULL    COMMENT '내용3',
    `img_4`      	VARCHAR(30)      NULL    COMMENT '이미지4', 
    `desc_4`        VARCHAR(2000)    NULL    COMMENT '내용4',
	`img_5`      	VARCHAR(30)      NULL    COMMENT '이미지5', 
    `desc_5`        VARCHAR(2000)    NULL    COMMENT '내용5',
    `img_6`      	VARCHAR(30)      NULL    COMMENT '이미지6', 
    `desc_6`        VARCHAR(2000)    NULL    COMMENT '내용6',
     PRIMARY KEY (img_code)
);