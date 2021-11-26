package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.BoardListVO;
import kr.smhrd.model.NkDAO;

public class BoardListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NkDAO dao = new NkDAO();
		List<BoardListVO> vo = dao.BoardList();
		request.setAttribute("BoardList", vo);
		return "BoardList"; // ���� �� ���� jsp���� �̵���ų ��. ���� ���� ���� x - jsp���� ����
	}
	

}
