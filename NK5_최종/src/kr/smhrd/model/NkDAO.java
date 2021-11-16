package kr.smhrd.model;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class NkDAO {
	private static SqlSessionFactory sqlSessionFactory;
	
	// 초기화 블럭
	static {
		try {
			String resource = "kr/smhrd/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// ---------------------- 검색 VO
	
	public List<RecipeBasicsVO> RecipeBasics() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> a = session.selectList("Main");
		session.close();
		return a;

	}
	public List<RecipeBasicsVO> RecipeBasicsAll() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> ListRB = session.selectList("SelectRecipePageAll");
		System.out.println(ListRB);
		
		session.close();
		return ListRB;
	}
	
	public List<RecipeBasicsVO> RecipeBasicsKorean() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> ListRB = session.selectList("SelectRecipePageKorean");
		System.out.println(ListRB);
		
		session.close();
		return ListRB;
	}
	
	public List<RecipeBasicsVO> RecipeBasicsAsia() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> ListRB = session.selectList("SelectRecipePageAsia");
		System.out.println(ListRB);
		
		session.close();
		return ListRB;
	}
	public List<RecipeBasicsVO> RecipeBasicsWestern() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> ListRB = session.selectList("SelectRecipePageWestern");
		System.out.println(ListRB);
		
		session.close();
		return ListRB;
	}
	public List<RecipeBasicsVO> RecipeBasicsFusion() { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> ListRB = session.selectList("SelectRecipePageFusion");
		System.out.println(ListRB);
		
		session.close();
		return ListRB;
	}
	
	public List<RecipeBasicsVO> RecipeBasics(String name) { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> a = session.selectList("RecipeListRB", name);
		List<RecipeBasicsVO> ListRB = null;
		if (a == null) {
		}else{
			ListRB = session.selectList("RecipeListRB", name);
			System.out.println(ListRB);
		}
		session.close();
		return ListRB;
	}
	public List<RecipeBasicsVO> RecipeIngredients(String name) { // 재료명 검색
		System.out.println("재료명 검색 dao 진입");
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeBasicsVO> list = session.selectList("RecipeListRI", name);
		System.out.println(list);
		
		session.close();
		return list;
	}
	
	//---------------------------------------------------------
	
	
	public RecipeBasicsVO RecipeBasics(int code) { // 선택 레시피 페이지
		SqlSession session = sqlSessionFactory.openSession();
		RecipeBasicsVO RB = session.selectOne("SelectRecipePageRB", code);
		session.close();
		return RB;
	}
	public List<RecipeCookingVO> RecipeCooking(int code) {
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeCookingVO> RC_List = session.selectList("SelectRecipePageRC", code);
		session.close();
		return RC_List;
	}
	public List<RecipeTipsVO> RecipeTips(int code) {
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeTipsVO> RT_List = session.selectList("SelectRecipePageRT", code); 
		session.close();
		return RT_List;
	}
	public List<RecipeIngredientsVO> RecipeIngredients(int code) {
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeIngredientsVO> RI_List = session.selectList("SelectRecipePageRI", code);
		session.close();
		return RI_List;
	}
	//------------------------------------------------------------------ 회원관련 dao
	
	public List<MemberVO> Members() {
		SqlSession session = sqlSessionFactory.openSession();
		List<MemberVO> a = session.selectList("SelectMembers");
		session.close();
		return a;

	}
	public MemberVO Members(String m_id) { 
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO a = session.selectOne("SelectMember",m_id);
		session.close();
		return a;
	}
	public void InsertMemberVO(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("InsertMember", vo); // insert SQL 전송(실행)
		session.commit(); // 완료
		session.close(); // 반납*
		
	}
	public void DeleteRecipeTips(RecipeTipsVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("생성확인:"+vo);
		session.delete("DeleteRecipeTips", vo);
		session.commit(); // 완료
		session.close(); // 반납*
	}
	// -------------------------------------------------------------- 북마크
	public List<RecipeBasicsVO> MyRecipeList(String name){
		SqlSession session = sqlSessionFactory.openSession();
//		List<RecipeBasicsVO> My_Pick = session.selectList("My_Pick");
		List<RecipeBasicsVO> m_id = session.selectList("m_id", name);
		System.out.println(m_id+" asdlkfjasldkjv");
		session.close();
		return m_id;
	}
	public MyRecipesVO MyRecipes (MyRecipesVO vo) { 
		SqlSession session = sqlSessionFactory.openSession();
		MyRecipesVO a = session.selectOne("MyRecipes",vo);
		session.close();
		return a;
	}
	public void InsertMyRecipes (MyRecipesVO vo) { 
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("생성확인:"+vo);
		session.insert("InsertMyRecipses",vo);
		session.commit();
		session.close();
		
	}
	
	public void DeleteMyRecipes (MyRecipesVO vo) { 
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("생성확인:"+vo);
		session.delete("DeleteMyRecipes", vo);
		session.commit(); // 완료
		session.close(); // 반납*
		
	}
	//------------------------------------- 대체재료검색
	public List<AlternativeIngredientsVO> AlternativeIngredients (int code){
		SqlSession session = sqlSessionFactory.openSession();

		List<AlternativeIngredientsVO> list = session.selectList("SelectAlternativeIngredients", code);
		System.out.println("대체재료:"+list);
		System.out.println("대체재료 리턴부");
		session.close();
		return list;
	}
	// -------------------------------------------------------- 레시피 댓글
	public void RecipeCommentIn(RecipeTipsVO vo) { // 요리명 검색
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("Comment", vo); // insert SQL 전송(실행)
		session.commit(); //
		session.close(); //
	}
	//------------------------------------------------ 게시판
		public void boardInsert(BoardListVO vo) { // --------글쓰기
			SqlSession session = sqlSessionFactory.openSession();
			// insert SQL 전송
			session.insert("boardInsert", vo); // Inesrt 실행
			session.commit(); // 완료
			session.close(); // 반납(*)
		}
		public BoardListVO BoardSelect(String code) { // -------- 상세페이지
			SqlSession session = sqlSessionFactory.openSession();
			int img_code =Integer.parseInt(code);
			System.out.println(img_code);
			BoardListVO vo = session.selectOne("BoardContent", img_code);
			session.close();
			return vo;
		}
		public List<BoardListVO> BoardList() { // -------- 리스트
			SqlSession session = sqlSessionFactory.openSession();
			List<BoardListVO> vo = session.selectList("BoardList");
			session.close();
			return vo;
		}
		public void BoardDelete(BoardListVO vo) { // -------- 삭제
			SqlSession session = sqlSessionFactory.openSession();
			session.delete("BoardDelete", vo);
		    session.commit();
			session.close();
		}
		public void boardUpdate(BoardListVO vo) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("BoardUpdate", vo);
			session.commit();
			session.close();
		}
	
}