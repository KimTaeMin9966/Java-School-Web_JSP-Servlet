package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	// 게시물 목록
	public void boardList(HttpServletRequest request) {
		BoardDao bd = BoardDao.getInstance();
		ArrayList<BoardVo> boardList = bd.getBoardList();
		request.setAttribute("boardList", boardList);
	}
	
	// 게시물 상세보기
	public void boardDetail(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardVo boardVo = new BoardVo();
		BoardDao bd = BoardDao.getInstance();
		boardVo = bd.getBoardVo(board_num);
		bd.updateReadCount(board_num);
		request.setAttribute("boardVo", boardVo);
	}
	
	// 답변 작성창 데이터
	public void boardreply(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDao bd = BoardDao.getInstance();
		BoardVo boardVo = bd.getBoardVo(board_num);
		request.setAttribute("boardVo", boardVo);
	}

	// 답변글 작성
	public void boardReplySubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		
		BoardVo boardVo = new BoardVo(); 

		boardVo.setBoard_num(board_num);
		boardVo.setBoard_name(board_name);
		boardVo.setBoard_pass(board_pass);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_re_ref(board_re_ref);
		boardVo.setBoard_re_lev(board_re_lev);
		boardVo.setBoard_re_seq(board_re_seq);
		
		BoardDao bd = BoardDao.getInstance();
		bd.boardReplySubmit(boardVo);
		response.sendRedirect(request.getContextPath() + "/boardList.bo");
	}
	
	// 게시물 정보 수정 화면
	public void boardUpdate(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDao bd = BoardDao.getInstance();
		BoardVo boardVo = bd.getBoardVo(board_num);
		request.setAttribute("boardVo", boardVo);
	}

	// 게시물 정보 수정
	public void boardUpdateSubmit(HttpServletRequest request, HttpServletResponse response) {
		String saveDir = "/boardUpload";
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath(saveDir);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			int board_num = Integer.parseInt(multi.getParameter("board_num"));
			String board_name = multi.getParameter("board_name");
			String board_pass = multi.getParameter("board_pass");
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			String board_file = multi.getOriginalFileName((String)multi.getFileNames().nextElement());

			BoardVo boardVo = new BoardVo();
			boardVo.setBoard_num(board_num);
			boardVo.setBoard_name(board_name);
			boardVo.setBoard_pass(board_pass);
			boardVo.setBoard_title(board_title);
			boardVo.setBoard_content(board_content);
			boardVo.setBoard_file(board_file);
			
			BoardDao bd = BoardDao.getInstance();
			bd.boardUpdateSubmit(boardVo);
			response.sendRedirect(request.getContextPath() + "/boardDetail.bo?board_num=" + board_num);
		} catch (IOException e) { e.printStackTrace(); }
	}
}
