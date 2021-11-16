package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeBasicsVO {

	private int rcp_code;
	private String rcp_name;
	private String rcp_desc;
	private int rcp_t_code;
	private String rcp_cooking_time;
	private String rcp_t;
	private String rcp_calory;
	private String rcp_size;
	private int rcp_level;
	private String rcp_pic1;
	private Date reg_date;
	private String m_id;
	

}
	