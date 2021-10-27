package NK5.smhrd.Model;

import java.sql.Date;

public class ArticlesVO {
	
	private int article_code;
	private String article_title;
	private String article_content;
	private String m_id;
	private Date reg_date;
	private String file1;
	private String file2;
	
	public int getArticle_code() {
		return article_code;
	}
	public void setArticle_code(int article_code) {
		this.article_code = article_code;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	
}