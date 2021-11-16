package kr.smhrd.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.BoardListVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;


public class BoardDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	      HttpSession session = request.getSession();
	      MemberVO vo = (MemberVO)session.getAttribute("succ");
	      int Delete = Integer.parseInt(request.getParameter("Delete"));
	      NkDAO dao = new NkDAO();
	      BoardListVO B_List = new BoardListVO();
	      System.out.println(vo+"아이디값");
	      System.out.println(Delete+"삭제값");
	      B_List.setM_id(vo.getM_id());
	      B_List.setImg_code(Delete);
			dao.BoardDelete(B_List); // 삭제성공

			return "redirect:/BoardList.do";

	
	}

}
