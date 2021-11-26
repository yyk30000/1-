package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyRecipesVO {

	private int m_rcp_code;
	private int rcp_code;
	private String m_id;
	private Date reg_date;
	private String user_memo;
	
}