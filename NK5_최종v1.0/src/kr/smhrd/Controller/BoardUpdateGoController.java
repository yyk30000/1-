package kr.smhrd.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardListVO;
import kr.smhrd.model.NkDAO;

public class BoardUpdateGoController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String a = request.getParameter("Img_Code");
		System.out.println(a+" a");
//		System.out.println(vo+ " vo");
		NkDAO dao = new NkDAO();
		BoardListVO vo = dao.BoardSelect(a);
		System.out.println(vo+"vo");
		
		if(vo.getImg_1() == null) {
			vo.setImg_1("");
		}
		if(vo.getImg_2() == null) {
			vo.setImg_2("");
		}
		if(vo.getImg_3() == null) {
			vo.setImg_3("");
		}
		if(vo.getImg_4() == null) {
			vo.setImg_4("");
		}
		if(vo.getImg_5() == null) {
			vo.setImg_5("");
		}
		if(vo.getImg_6() == null) {
			vo.setImg_6("");
		}
		request.setAttribute("select", vo);
		
		return "BoardUpdate";
	}

}
