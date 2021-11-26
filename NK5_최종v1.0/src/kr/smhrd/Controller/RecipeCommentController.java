package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.API.DateAPI;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeTipsVO;

public class RecipeCommentController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String Comments = request.getParameter("Comment");
		int CookingCode = Integer.parseInt(request.getParameter("CookingCode"));
		NkDAO dao = new NkDAO();
		DateAPI Date = new DateAPI();

		HttpSession session = request.getSession();
		
		MemberVO m =(MemberVO)session.getAttribute("succ");
		int getcode = (int)session.getAttribute("rcp_code");
		RecipeTipsVO vo = new RecipeTipsVO();
//		vo.setReg_date(Date.dateNow());
		vo.setRcp_code(getcode);
		vo.setM_id(m.getM_id());
		vo.setUser_tip(Comments);
		vo.setCooking_code(CookingCode);
		System.out.println(vo + " vovovovovovovo");
		dao.RecipeCommentIn(vo);
		
		return "redirect:/SelectRecipePage.do";
	}

}
