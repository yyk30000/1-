package kr.smhrd.Controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.model.BoardListVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.NkDAO;

public class BoardInsertController implements Controller{

	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NkDAO dao = new NkDAO();
		BoardListVO vo = new BoardListVO();
//		String path = "C:\\sts-bundle\\workspace\\Board\\WebContent\\img";
		String savePath = request.getRealPath("/img");
		int size = 1024 * 1024 * 20; //20MB
		
		try{
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, size, "utf-8", new DefaultFileRenamePolicy());
			
//			String original_filename = multiRequest.getOriginalFileName("file");
//			String[] file = multiRequest.getParameterValues("file");
			
			String filename1 = multiRequest.getFilesystemName("file1");
			String filename2 = multiRequest.getFilesystemName("file2");
			String filename3 = multiRequest.getFilesystemName("file3");
			String filename4 = multiRequest.getFilesystemName("file4");
			String filename5 = multiRequest.getFilesystemName("file5");
			String filename6 = multiRequest.getFilesystemName("file6");
			String m_fileFullPath1 = "img" + File.separator + filename1;
			String m_fileFullPath2 = "img" + File.separator + filename2;
			String m_fileFullPath3 = "img" + File.separator + filename3;
			String m_fileFullPath4 = "img" + File.separator + filename4;
			String m_fileFullPath5 = "img" + File.separator + filename5;
			String m_fileFullPath6 = "img" + File.separator + filename6;

// 			이거 써야댐 !! 아이디 고정
//			HttpSession session = request.getSession();
//			MemberVO m =(MemberVO)session.getAttribute("succ");
			String t = multiRequest.getParameter("title");
			String m = multiRequest.getParameter("writer");
			
			String c1 = multiRequest.getParameter("text1");
			String c2 = multiRequest.getParameter("text2");
			String c3 = multiRequest.getParameter("text3");
			String c4 = multiRequest.getParameter("text4");
			String c5 = multiRequest.getParameter("text5");
			String c6 = multiRequest.getParameter("text6");
			
			System.out.println(m);
			System.out.println(t);
			System.out.println(c1);
			
			
			if (filename1 != null) {
				vo.setImg_1(m_fileFullPath1);
			}
			if (filename2 != null) {
				vo.setImg_2(m_fileFullPath2);
			}
			if (filename3 != null) {
				vo.setImg_3(m_fileFullPath3);
			}
			if (filename4 != null) {
				vo.setImg_4(m_fileFullPath4);
			}
			if (filename5 != null) {
				vo.setImg_5(m_fileFullPath5);
			}
			if (filename6 != null) {
				vo.setImg_6(m_fileFullPath6);
			}
			
			vo.setM_id(m);
			vo.setTitle(t);
			vo.setDesc_1(c1);
			vo.setDesc_2(c2);
			vo.setDesc_3(c3);
			vo.setDesc_4(c4);
			vo.setDesc_5(c5);
			vo.setDesc_6(c6);
			
			dao.boardInsert(vo);
			
		} catch (Exception e){
			e.printStackTrace();
		}
//		return "BoardWriting";
		return "redirect:/BoardList.do";
	
	}
	
}