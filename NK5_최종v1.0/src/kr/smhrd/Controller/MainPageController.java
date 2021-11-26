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
		// ���������� ��õ������ ����Ʈ�� Main��ü�� ����ִ´�.
		request.setAttribute("Main", Main);
		// �����͸� ���ٴ�.
		
		
//		System.out.println("����Ȯ�ο�");
		
		
		
		return "MainPage";
	}

}
