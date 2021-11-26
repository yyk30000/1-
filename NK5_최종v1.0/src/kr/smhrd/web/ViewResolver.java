package kr.smhrd.web;

public class ViewResolver {
	private ViewResolver() {
		
	}
	public static String makeViewUrl(String view) {
		
		return "/WEB-INF/NK5/"+view+".jsp";
		
	}

}
