package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	private String m_id;
	private String m_pwd;
	private String m_name;
	private int m_age;
	private String m_gender;
	private Date m_joindate;
	private String admin_yn;
	
	
}
