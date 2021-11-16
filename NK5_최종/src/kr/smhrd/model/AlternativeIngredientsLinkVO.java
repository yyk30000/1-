package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlternativeIngredientsLinkVO {
	
	private int link_code;
	private int ingre_code;
	private int alt_ingre_code;
	
	
}
