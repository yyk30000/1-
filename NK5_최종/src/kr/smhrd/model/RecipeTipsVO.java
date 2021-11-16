package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class RecipeTipsVO {
	
	private int tip_code;
	private int cooking_code;
	private String m_id;
	private Date reg_date;
	private String user_tip;
	private int rcp_code;

}	