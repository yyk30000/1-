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

public class DeletMyRecipesController implements Controller{

   @Override
   public String requestHandler(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   
	   
	   int key =Integer.parseInt(request.getParameter("key"));
	   
	   NkDAO dao =new NkDAO();
	   HttpSession session = request.getSession();
	   MemberVO m =(MemberVO)session.getAttribute("succ");
	   int rcp_code = 0;
	
	   rcp_code = Integer.parseInt(request.getParameter("rcp_code"));
	System.out.println("리퀘스트 레시피코드값:"+rcp_code);
	   
	   MyRecipesVO vo = new MyRecipesVO();
	   vo.setM_id(m.getM_id());
	   vo.setRcp_code(rcp_code);
	   System.out.println(" 삭제 생성전:"+vo);
	   dao.DeleteMyRecipes(vo);
	   
	   System.out.println("삭제 완료");
	   
	   
	   
     if(key == 0) {
    	 return "redirect:/SelectRecipePage.do";
    	 
     }else if(key == 1) {
    	 return "redirect:/MyRecipick.do";
     }else if(key == 2){
    	 return "redirect:/RecipeList.do";
     }else {
    	 return "redirect:/MainPage.do";
     }
    	
     
   }

}