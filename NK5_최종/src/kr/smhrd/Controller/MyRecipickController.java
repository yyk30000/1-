package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import kr.smhrd.model.MemberVO;
import kr.smhrd.model.MyRecipesVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;

public class MyRecipickController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NkDAO dao = new NkDAO();		
		HttpSession session = request.getSession();
		
		MemberVO a = (MemberVO)session.getAttribute("succ");
		
		System.out.println("id:"+a);
		
		String b = a.getM_id();
		
		List<RecipeBasicsVO> L_vo = dao.MyRecipeList(b);
		request.setAttribute("name", L_vo);
		System.out.println(a + "  l_vo");
		
		
		return "MyRecipick";
	}

}
