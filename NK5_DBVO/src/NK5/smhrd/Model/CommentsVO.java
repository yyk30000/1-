package NK5.smhrd.Model;

import java.sql.Date;

public class CommentsVO {
	
	private int cmt_code;
	private int article_code;
	private String cmt_content;
	private Date reg_date;
	private String m_id;
	
	public int getCmt_code() {
		return cmt_code;
	}
	public void setCmt_code(int cmt_code) {
		this.cmt_code = cmt_code;
	}
	public int getArticle_code() {
		return article_code;
	}
	public void setArticle_code(int article_code) {
		this.article_code = article_code;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

}
