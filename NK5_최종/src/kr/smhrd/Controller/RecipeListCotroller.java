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


public class RecipeListCotroller implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		NkDAO dao = new NkDAO();

		HttpSession session = request.getSession();
		
		//���ǿ� ������ �˻��� ���
	      String name;
	      name = request.getParameter("RecipeList");
	      if(session.getAttribute("RecipeList") == null) {
	    	  name = request.getParameter("RecipeList");
	    	  session.setAttribute("RecipeList",name);
	      }
	      else {
	    	  if(request.getParameter("RecipeList") == null) {
	    		  name = (String)session.getAttribute("RecipeList");
	    		  
	    	  }else {
	    		  name = request.getParameter("RecipeList");
		    	  session.setAttribute("RecipeList",name);
	    	  }
	      }
		
		
		//ȸ������ Ȯ�� ���̷�����
		if(session.getAttribute("succ")!=null ) {
			MemberVO a = (MemberVO)session.getAttribute("succ");
			String b = a.getM_id();
			List<RecipeBasicsVO> L_vo = dao.MyRecipeList(b);
			request.setAttribute("name", L_vo);
		}else {
			request.setAttribute("name", null);
		}
		
		
		
		
		String SelectValue = request.getParameter("SelectValue");
		System.out.println("�˻�����:"+SelectValue);
		
		String type ="";
		if  (SelectValue == null) {
			System.out.println(name);
			type ="�丮�� �˻�";
			List<RecipeBasicsVO> List = dao.RecipeBasics(name);
			if (List.size() == 0) {
				request.setAttribute("name", name);
				request.setAttribute("name", name);
      			return "Error";
			}else {
				request.setAttribute("List", List);
				return "RecipeList";
			
			}
			}else if(SelectValue.equals("recipe")) {
				
				type ="�丮�� ";
				System.out.println(name);
				List<RecipeBasicsVO> List = dao.RecipeBasics(name);
				if (List.size() == 0) {
					request.setAttribute("name", name);
					request.setAttribute("type", type);
	      			return "Error";
				}else {
					request.setAttribute("List", List);
					return "RecipeList";
				
				}
		}else if(SelectValue.equals("ingre")) {
			type ="���� ";
			System.out.println(name);
			List<RecipeBasicsVO> List = dao.RecipeIngredients(name);
			System.out.println("dao�� ���� ����Ʈ"+List);
			if (List.size() == 0) {
				request.setAttribute("name", name);
				request.setAttribute("type", type);
      			return "Error";
			}else {
				request.setAttribute("List", List);
				return "RecipeList";
			}
		}else {
			request.setAttribute("name", name);
			request.setAttribute("type", type);
			return "Error";
		}
		
	}
}