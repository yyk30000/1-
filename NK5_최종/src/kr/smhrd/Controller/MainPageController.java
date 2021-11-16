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
		String code = request.getParameter("code");
		NkDAO dao = new NkDAO();
		List<RecipeBasicsVO> Main = dao.RecipeBasics();
		request.setAttribute("Main", Main);
		System.out.println("오류확인용");
		System.out.println("code:"+code);
		if(code != null) {
			
			
			KakaoAPI kakao = new KakaoAPI();
			String access_Token = kakao.getAccessToken(code);
			HttpSession session = request.getSession();
			HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
			  if(userInfo.get("email") != null) {
	    			session.setAttribute("userId", userInfo.get("email"));
	    			session.setAttribute("accessToken", access_Token);
	    		}

		    System.out.println("controller access_token : " + access_Token);
		    session.setAttribute("access_Token", access_Token);
		    request.setAttribute("access_Token", access_Token);
		}
		return "MainPage";
	}

}
