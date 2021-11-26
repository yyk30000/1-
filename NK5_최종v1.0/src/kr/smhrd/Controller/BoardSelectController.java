package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardListVO;
import kr.smhrd.model.NkDAO;

public class BoardSelectController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//			�̰� ��ߴ� !! ���̵� ����
//		HttpSession session = request.getSession();
//		MemberVO m =(MemberVO)session.getAttribute("succ");
		String a = request.getParameter("Img_Code");
		NkDAO dao = new NkDAO();
		BoardListVO vo = dao.BoardSelect(a);
		
		request.setAttribute("select", vo);
		return "BoardContent";
	}

}
