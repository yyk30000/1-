package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlternativeIngredientsVO {

	private int alt_ingre_code;
	private String raw_ingre_name;
	private String alter_ingre_name;
	
	private String brief_desc;
	private Date reg_date;
	private String m_id;
	
	
	
}