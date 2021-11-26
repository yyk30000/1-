package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;
import kr.smhrd.model.RecipeCookingVO;
import kr.smhrd.model.RecipeIngredientsVO;
import kr.smhrd.model.RecipeTipsVO;


public class RecipeKategorieCotroller implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		NkDAO dao = new NkDAO();

		HttpSession session = request.getSession();
		
		//세션에 마지막 검색을 기록
	      String name;
	      name = request.getParameter("RecipeList");
	      if(session.getAttribute("RecipeList") == null) {
	    	  name = request.getParameter("RecipeList");
	    	  session.setAttribute("RecipeList",name);
	      }
	      else {
	    	  if(request.getParameter("RecipeList") == null) {
	    		  name = null;
	    		  
	    	  }else {
	    		  name = request.getParameter("RecipeList");
		    	  session.setAttribute("RecipeList",name);
	    	  }
	      }
		
		
		//회원정보 확인 마이레시픽
		if(session.getAttribute("succ")!=null ) {
			MemberVO a = (MemberVO)session.getAttribute("succ");
			String b = a.getM_id();
			List<RecipeBasicsVO> L_vo = dao.MyRecipeList(b);
			request.setAttribute("name", L_vo);
		}else {
			request.setAttribute("name", null);
		}
		
		int key = Integer.parseInt(request.getParameter("key"));
		List<RecipeBasicsVO> list = null;
		
		
		if(key == 0) {
			list =dao.RecipeBasicsAll();
		}else if(key == 1) {
			list =dao.RecipeBasicsKorean();
		}else if(key == 2) {
			list =dao.RecipeBasicsAsia();
		}else if(key == 3) {
			list =dao.RecipeBasicsWestern();
		}else if(key == 4) {
			list =dao.RecipeBasicsFusion();
		}
		
		request.setAttribute("List", list);
		
		
		return "RecipeList";

	
	
	}
	
}
		
		
	
