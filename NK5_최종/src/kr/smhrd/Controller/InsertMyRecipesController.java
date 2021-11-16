package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.MemberVO;
import kr.smhrd.model.MyRecipesVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;
import kr.smhrd.model.RecipeCookingVO;
import kr.smhrd.model.RecipeIngredientsVO;
import kr.smhrd.model.RecipeTipsVO;

public class InsertMyRecipesController implements Controller{

   @Override
   public String requestHandler(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   NkDAO dao =new NkDAO();
	   HttpSession session = request.getSession();
	   MemberVO m =(MemberVO)session.getAttribute("succ");
	   int rcp_code = Integer.parseInt(request.getParameter("rcp_code"));
	   int key =Integer.parseInt(request.getParameter("key"));
	   
	   MyRecipesVO vo = new MyRecipesVO();
	   vo.setM_id(m.getM_id());
	   vo.setRcp_code(rcp_code);
	   System.out.println("»ý¼ºÀü:"+vo);
	   dao.InsertMyRecipes(vo);
	   
	   if(session.getAttribute("succ")!=null ) {
			MemberVO a = (MemberVO)session.getAttribute("succ");
			String b = a.getM_id();
			List<RecipeBasicsVO> L_vo = dao.MyRecipeList(b);
			session.setAttribute("name", L_vo);
		}else {
			session.setAttribute("name", null);
		}
	   
     if(key==0) {
    	 return "redirect:/SelectRecipePage.do";
    	 
     }else if(key==2) {
    	 
    	 return "redirect:/RecipeList.do";
     }else {
    	 return "redirect:/RecipeList.do";
     }
   }

}