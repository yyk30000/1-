SET FOREIGN_KEY_CHECKS = 1;
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/myrecipes.csv' 
into table myrecipes
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r' 제외
ignore 1 rows;

select * from myrecipes;