package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVO {
	
	private int cmt_code;
	private int article_code;
	private String cmt_content;
	private Date reg_date;
	private String m_id;
	
	
}
