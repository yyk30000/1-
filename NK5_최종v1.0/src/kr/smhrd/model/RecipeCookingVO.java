package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//import java.sql.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeCookingVO {
	
	private int cooking_code;
	private int rcp_code;
	private int cooking_order;
	private String cooking_content;
	private String cooking_img1;
	private String cooking_tip;
	private Date reg_date;
	private String m_id;
	

}
