SET FOREIGN_KEY_CHECKS = 0;
load data 
infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe_ingredients.csv' 
into table recipe_ingredients
-- CHARACTER SET euckr
fields terminated by','
LINES TERMINATED BY '\r\n' -- '\r' 제외
ignore 1 rows;

select * from recipe_ingredients;
