SET FOREIGN_KEY_CHECKS = 1;
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/alternative_ingredients.csv' 
into table alternative_ingredients
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r' 제외
ignore 1 rows;


select * from alternative_ingredients;