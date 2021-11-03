-- 파일 import
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/myrecipes.csv' 
into table myrecipes
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r' -- '\r' 제외
ignore 1 rows;

-- CHARACTER SET euckr; 인코딩 오류시 사용

select * from myrecipes;