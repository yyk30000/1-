package NK5.smhrd.Model;

import java.sql.Date;

public class MemberVO {
	
	private String m_id;
	private String m_pwd;
	private String m_name;
	private int m_age;
	private String m_gender;
	private Date m_joindate;
	private String admin_yn;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public Date getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
	public String getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}
	
	
	

}
