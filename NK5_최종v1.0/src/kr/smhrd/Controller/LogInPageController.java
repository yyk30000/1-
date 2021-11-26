package kr.smhrd.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.API.KakaoAPI;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;


public class LogInPageController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("m_id");
		String password = request.getParameter("m_pwd");
		Boolean check = false;
		NkDAO dao = new NkDAO();
		List<MemberVO> mlist = dao.Members();
		System.out.println(mlist);
		
		
		
		for(int i = 0; i<mlist.size();i++) {
			
			if(!(mlist.get(i).getAdmin_yn().equals("k"))) {
				if(mlist.get(i).getM_id().equals(id)) {
					if(mlist.get(i).getM_pwd().equals(password)) {
						check =true;
					}
				}
			}
			
		}
		
		request.setAttribute("check", check);
		System.out.println(check);
		if(check) {
			System.out.println("메인페이지로");
			MemberVO vo = dao.Members(id);
			List<RecipeBasicsVO> rblist =dao.RecipeBasics();
			request.setAttribute("Main", rblist);	
			HttpSession session = request.getSession();
			session.setAttribute("succ",vo);
			
			if(session.getAttribute("succ")!=null ) {
				MemberVO a = (MemberVO)session.getAttribute("succ");
				String b = a.getM_id();
				List<RecipeBasicsVO> L_vo = dao.MyRecipeList(b);
				session.setAttribute("name", L_vo);
			}else {
				session.setAttribute("name", null);
			}
			
			return "redirect:/MainPage.do";
			}else {
				System.out.println("로그인으로");
			return "Login";
		}
	}


}
