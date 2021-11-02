-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/articles.csv' 
into table articles
-- CHARACTER SET euckr
fields terminated by','
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류시 사용

select * from articles;