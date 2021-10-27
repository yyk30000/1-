package NK5.smhrd.Model;

import java.sql.Date;

public class MyRecipesVO {

	private int m_rcp_code;
	private int rcp_code;
	private String m_id;
	private Date reg_date;
	private String user_memo;
	
	public int getM_rcp_code() {
		return m_rcp_code;
	}
	public void setM_rcp_code(int m_rcp_code) {
		this.m_rcp_code = m_rcp_code;
	}
	public int getRcp_code() {
		return rcp_code;
	}
	public void setRcp_code(int rcp_code) {
		this.rcp_code = rcp_code;
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
	public String getUser_memo() {
		return user_memo;
	}
	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}
}
