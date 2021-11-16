package kr.smhrd.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.AlternativeIngredientsVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.MyRecipesVO;
import kr.smhrd.model.NkDAO;
import kr.smhrd.model.RecipeBasicsVO;
import kr.smhrd.model.RecipeCookingVO;
import kr.smhrd.model.RecipeIngredientsVO;
import kr.smhrd.model.RecipeTipsVO;

public class SelectRecipePageController implements Controller{

	   public String requestHandler(HttpServletRequest request, HttpServletResponse response)
		         throws ServletException, IOException {
		      
		      NkDAO dao = new NkDAO();
		      int code;
		      HttpSession session = request.getSession();
		      
		      if(session.getAttribute("rcp_code") == null) {
		    	  code =Integer.parseInt(request.getParameter("code"));
		    	  session.setAttribute("rcp_code",code);
		      }
		      else {
		    	  if(request.getParameter("code") == null) {
		    		  int getcode = (int)session.getAttribute("rcp_code");
		    		  code = getcode;
		    		  
		    	  }else {
		    		  code =Integer.parseInt(request.getParameter("code"));
		        	  session.setAttribute("rcp_code",code);
		    	  }
		      }
		      MemberVO m =(MemberVO)session.getAttribute("succ");
		      String temp = request.getParameter("listnum");
		      int i=0; 
		      if(temp != null) {
		         i=Integer.parseInt(temp);
		         System.out.println(i);
		         System.out.println(code);
		      }
		      RecipeBasicsVO RBvo = dao.RecipeBasics(code);
		      List<RecipeCookingVO> RCvo = dao.RecipeCooking(code);
		      List<RecipeTipsVO> RTvo = dao.RecipeTips(code);
		      List<RecipeIngredientsVO> RIvo = dao.RecipeIngredients(code);
		      List<AlternativeIngredientsVO> ATvo =dao.AlternativeIngredients(code);
		      
		      MyRecipesVO MRvo= new MyRecipesVO(); 
		     
		      if(m == null) {
		    	  MRvo =null;
		    	  System.out.println("회원정보없음");
		    	  System.out.println(m);
		    	  
		      }else {
		    	  MRvo.setM_id(m.getM_id());
		    	  MRvo.setRcp_code(code);
		    	  MRvo = dao.MyRecipes(MRvo);
		    	  System.out.println("마이레시픽:"+MRvo);
		      }
		      System.out.println(RIvo);
		      System.out.println(RTvo);
		      request.setAttribute("RBvo", RBvo);
		      request.setAttribute("RCvo", RCvo);
		      request.setAttribute("RTvo", RTvo);
		      request.setAttribute("RIvo", RIvo);
		      request.setAttribute("listnum", i);
		      request.setAttribute("MRvo", MRvo);
		      request.setAttribute("ATvo", ATvo);
		      
		      
		      return "SelectRecipePage";
   }

}