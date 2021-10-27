package NK5.smhrd.Model;

import java.sql.Date;

public class RecipeTipsVO {
	
	private int tip_code;
	private int cooking_order;
	private String m_id;
	private Date reg_date;
	private String user_tip;
	
	public int getTip_code() {
		return tip_code;
	}
	public void setTip_code(int tip_code) {
		this.tip_code = tip_code;
	}
	public int getCooking_order() {
		return cooking_order;
	}
	public void setCooking_order(int cooking_order) {
		this.cooking_order = cooking_order;
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
	public String getUser_tip() {
		return user_tip;
	}
	public void setUser_tip(String user_tip) {
		this.user_tip = user_tip;
	}
	
}	