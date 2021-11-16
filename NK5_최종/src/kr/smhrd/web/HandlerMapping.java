package kr.smhrd.web;

import java.util.HashMap;

import kr.smhrd.Controller.BoardDeleteController;
import kr.smhrd.Controller.BoardFormgoController;
import kr.smhrd.Controller.BoardInsertController;
import kr.smhrd.Controller.BoardListController;
import kr.smhrd.Controller.BoardSelectController;
import kr.smhrd.Controller.BoardUpdateController;
import kr.smhrd.Controller.BoardUpdateGoController;
import kr.smhrd.Controller.Controller;
import kr.smhrd.Controller.DeletMyRecipesController;
import kr.smhrd.Controller.DeletTipsController;
import kr.smhrd.Controller.GoJoinController;
import kr.smhrd.Controller.LogInPageController;
import kr.smhrd.Controller.LogOutController;
import kr.smhrd.Controller.GoLoginController;
import kr.smhrd.Controller.InsertMyRecipesController;
import kr.smhrd.Controller.JoinPageController;
import kr.smhrd.Controller.MainPageController;
import kr.smhrd.Controller.MyRecipickController;
import kr.smhrd.Controller.RecipeCommentController;
import kr.smhrd.Controller.RecipeKategorieCotroller;
import kr.smhrd.Controller.RecipeListCotroller;
import kr.smhrd.Controller.RecipeListTest;
import kr.smhrd.Controller.SelectRecipePageController;


public class HandlerMapping {

	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/RecipeList.do", new RecipeListCotroller());
		mappings.put("/SelectRecipePage.do", new SelectRecipePageController());
		mappings.put("/RecipeListTest.do", new RecipeListTest());
		mappings.put("/MainPage.do", new MainPageController());
		mappings.put("/LoginPage.do", new GoLoginController());
		mappings.put("/LoginCheckPage.do", new LogInPageController());
		mappings.put("/Join.do", new GoJoinController());
		mappings.put("/Error.do", new RecipeListCotroller());
		mappings.put("/LogOut.do", new LogOutController());
		mappings.put("/JoinPage.do", new GoJoinController());
		mappings.put("/MemberRegister.do", new JoinPageController());
		mappings.put("/MyRecipick.do", new MyRecipickController());
		mappings.put("/InsertMyRecipes.do", new InsertMyRecipesController());
		mappings.put("/DeletMyRecipes.do", new DeletMyRecipesController());
		mappings.put("/Commnet.do", new RecipeCommentController());
		mappings.put("/DeletRecipeTip.do", new DeletTipsController());
		mappings.put("/RecipesKategorie.do", new RecipeKategorieCotroller());

		mappings.put("/BoardForm.do", new BoardInsertController()); // Insert
		mappings.put("/BoardDelete.do", new BoardDeleteController()); // 글 삭제
		mappings.put("/BoardFormgo.do", new BoardFormgoController()); // 글쓰기 이동
		mappings.put("/BoardContent.do", new BoardSelectController()); // 글 리스트에서 글 눌렀을때 상세 내용
		mappings.put("/BoardList.do", new BoardListController()); // 글 리스트 페이지
		mappings.put("/BoardUpdate.do", new BoardUpdateController()); // 글 리스트 페이지
		mappings.put("/BoardUpdateGo.do", new BoardUpdateGoController()); // 글 리스트 페이지

	}
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
