package kr.smhrd.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.API.DateAPI;
import kr.smhrd.API.KakaoAPI;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;

public class JoinPageController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Boolean success = true;
		NkDAO dao = new NkDAO();
		List<MemberVO> list = dao.Members();

		DateAPI api = new DateAPI();
		String m_id = request.getParameter("m_id");
		String[] date = api.dateNow().split("/");

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getM_id().equals(m_id)) {

				success = false;
			}
		}


		if (success) {
			MemberVO vo = new MemberVO();
			String y = request.getParameter("y");
			int age = Integer.parseInt(date[0]) - Integer.parseInt(y) + 1;
			String m_pwd = request.getParameter("m_pwd");
			String m_name = request.getParameter("m_name");
			String m_gender =request.getParameter("m_gender");
			System.out.println(m_name);
			if(m_gender.equals("³²ÀÚ")) {
				m_gender="m";
			}else {
				m_gender="f";
			}
			vo.setAdmin_yn("n");
			vo.setM_id(m_id);
			vo.setM_pwd(m_pwd);
			vo.setM_age(age);
			vo.setM_name(m_name);
			vo.setM_gender(m_gender);
			dao.InsertMemberVO(vo);
			Boolean check =true;
			
			request.setAttribute("check", check);
			return "Login";
		} else {
			request.setAttribute("joinsucc", success);
			return "Join";
		}
	}

}
