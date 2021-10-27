package NK5.smhrd.Model;

import java.sql.Date;

//import java.sql.Date;

public class RecipeCookingVO {
	
	private int cooking_code;
	private int rcp_code;
	private int cooking_order;
	private String cooking_content;
	private String cooking_img1;
	private String cooking_tip;
	private Date reg_date;
	private String m_id;
	
	public int getCooking_code() {
		return cooking_code;
	}
	public void setCooking_code(int cooking_code) {
		this.cooking_code = cooking_code;
	}
	public int getRcp_code() {
		return rcp_code;
	}
	public void setRcp_code(int rcp_code) {
		this.rcp_code = rcp_code;
	}
	public int getCooking_order() {
		return cooking_order;
	}
	public void setCooking_order(int cooking_order) {
		this.cooking_order = cooking_order;
	}
	public String getCooking_content() {
		return cooking_content;
	}
	public void setCooking_content(String cooking_content) {
		this.cooking_content = cooking_content;
	}
	public String getCooking_img1() {
		return cooking_img1;
	}
	public void setCooking_img1(String cooking_img1) {
		this.cooking_img1 = cooking_img1;
	}
	public String getCooking_tip() {
		return cooking_tip;
	}
	public void setCooking_tip(String cooking_tip) {
		this.cooking_tip = cooking_tip;
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
