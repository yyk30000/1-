package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.Controller.Controller;
import kr.smhrd.model.RecipeBasicsVO;

@WebServlet("*.do")
public class NK5Controller extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RecipeBasicsVO vo = new RecipeBasicsVO();
		
		String reqURL = request.getRequestURI();
		String cpath = request.getContextPath();
		System.out.println(cpath);
		String command = reqURL.substring(cpath.length());
		System.out.println(command);
		
		Controller controller = null;
		String view = null;
		
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		view = controller.requestHandler(request, response);
		System.out.println(view);
	      if(view!=null) {
	          if(view.indexOf("redirect:")!=-1) {
	             response.sendRedirect(cpath+view.split(":")[1]);
	          }else {
	             RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeViewUrl(view));
	             rd.forward(request, response);
	          }
	       }
	}
}
