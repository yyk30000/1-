package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticlesVO {
	
	private int article_code;
	private String article_title;
	private String article_content;
	private String m_id;
	private Date reg_date;
	private String file1;
	private String file2;
	
	
}