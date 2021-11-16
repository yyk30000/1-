package kr.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeIngredientsVO {
	
	private int ingre_code;
	private int rcp_code;
	private String ingre_name;
	private String ingre_weight;
	private int ingre_t_code;
	private String ingre_t_name;
	

}