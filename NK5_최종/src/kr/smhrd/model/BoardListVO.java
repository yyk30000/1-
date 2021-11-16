package kr.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class BoardListVO {

	private int img_code;
	private String title;
	private String m_id;
	private String img_1;
	private String desc_1;
	private String img_2;
	private String desc_2;
	private String img_3;
	private String desc_3;
	private String img_4;
	private String desc_4;
	private String img_5;
	private String desc_5;
	private String img_6;
	private String desc_6;
	
}