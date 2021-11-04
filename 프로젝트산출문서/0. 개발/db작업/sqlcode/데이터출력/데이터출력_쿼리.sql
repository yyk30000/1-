-- 검색리스트 뷰 (요리명)
select rb.rcp_code,rcp_name,rb.rcp_decs,rb.rcp_t,rb.rcp_calory,rb.rcp_size,rcp_level,rcp_pic1
from recipe_basics rb
where rb.rcp_name like("%비빔밥%");


-- 기본 정보 뷰 rcp_decs 컬럼명 수정후 쿼리문 수정 필요
select rb.rcp_code,rcp_name,rb.rcp_decs,rb.rcp_t,rb.rcp_calory,rb.rcp_size,rcp_level,rcp_pic1
from recipe_basics rb
where rb.rcp_code = 90818;
-- 재료 뷰
select ri.rcp_code ,ri.ingre_name,ri.ingre_weight,ri.ingre_t_name 
from recipe_ingredients ri
where ri.rcp_code = 90818;

-- 조리과정뷰
select rc.rcp_code,rc.cooking_order,rc.cooking_content,rc.cooking_img1,rc.cooking_tip
from recipe_cookings rc
where rc.rcp_code = 1 order by rc.cooking_order;

-- 조리과정별 댓글
select rc.cooking_code,rc.cooking_order,rc.cooking_content,rc.cooking_img1,rc.cooking_tip,rt.user_tip
from recipe_tips rt ,recipe_cookings rc
where rc.cooking_code =rt.cooking_code and rc.rcp_code = 1 order by rc.cooking_order;

-- 통합뷰 -대체식재료
select ri.rcp_code, ri.ingre_name, ai.alter_ingre_name,ai.brief_desc
from alternative_ingredients_link al , recipe_ingredients ri, alternative_ingredients ai
where al.ingre_code = ri.ingre_code and ai.alt_ingre_code = al.alt_ingre_code;
