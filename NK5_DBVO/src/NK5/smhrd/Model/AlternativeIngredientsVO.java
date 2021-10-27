package NK5.smhrd.Model;

import java.sql.Date;

public class AlternativeIngredientsVO {

	private int alt_ingre_code;
	private String raw_ingre_name;
	private String alt_ingre_name;
	private String brief_desc;
	private Date reg_date;
	private String m_id;
	
	public int getAlt_ingre_code() {
		return alt_ingre_code;
	}
	public void setAlt_ingre_code(int alt_ingre_code) {
		this.alt_ingre_code = alt_ingre_code;
	}
	public String getRaw_ingre_name() {
		return raw_ingre_name;
	}
	public void setRaw_ingre_name(String raw_ingre_name) {
		this.raw_ingre_name = raw_ingre_name;
	}
	public String getAlt_ingre_name() {
		return alt_ingre_name;
	}
	public void setAlt_ingre_name(String alt_ingre_name) {
		this.alt_ingre_name = alt_ingre_name;
	}
	public String getBrief_desc() {
		return brief_desc;
	}
	public void setBrief_desc(String brief_desc) {
		this.brief_desc = brief_desc;
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