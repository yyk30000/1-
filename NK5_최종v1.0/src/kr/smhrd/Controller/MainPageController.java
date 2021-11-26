package kr.smhrd.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.API.KakaoAPI;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;

public class MainPageController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response )
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		NkDAO dao = new NkDAO();
		
		List<RecipeBasicsVO> Main = dao.RecipeBasics();
		// 메인페이지 추천레시피 리스트를 Main객체에 집어넣는다.
		request.setAttribute("Main", Main);
		// 데이터를 보넨다.
		
		
//		System.out.println("오류확인용");
		
		
		
		return "MainPage";
	}

}
