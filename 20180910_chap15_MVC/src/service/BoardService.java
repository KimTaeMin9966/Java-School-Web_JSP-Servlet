package service;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import vo.BoardVo;

public class BoardService {
	public void regArticle(HttpServletRequest request) throws IOException {
		System.out.println("글작성 요청");
		
		String saveDir = "/boardUpload";
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath(saveDir);
		System.out.println(realPath);
		
		BoardVo boardVo = new BoardVo();
		MultipartRequest multi = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		String board_name = multi.getParameter("board_name");
		String board_pass = multi.getParameter("board_pass");
		String board_title = multi.getParameter("board_title");
		String board_content = multi.getParameter("board_content");
		String board_file = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
		boardVo.setBoard_name(board_name);
		boardVo.setBoard_pass(board_pass);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_file(board_file);
		
		BoardDao bd = BoardDao.getInstance();
		bd.insertBoard(boardVo);
		
		
		
		
		
	}
	
}
