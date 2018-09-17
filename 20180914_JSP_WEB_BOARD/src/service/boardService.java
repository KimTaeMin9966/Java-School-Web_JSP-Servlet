package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardDAO;
import vo.boardVO;

public class boardService {
	boardVO bVO = new boardVO();
	
	public void writeProsess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_file = request.getParameter("board_file");
		
		bVO.setBoard_name(board_name);
		bVO.setBoard_pass(board_pass);
		bVO.setBoard_title(board_title);
		bVO.setBoard_content(board_content);
		bVO.setBoard_file(board_file);
		
		boardDAO bDAO = boardDAO.getInstance();
		int Query = bDAO.write(bVO);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		if(Query != 0) {
			System.out.println("작성 성공");
			out.println("alert('작성 성공');");
			out.println("location.href='listShow.bo'");
		} else {
			System.out.println("작성 실패");
			out.println("alert('작성 실패');");
			out.println("location.href='write.bo'");
		}
		out.println("</script>");
	}

	public void getList(HttpServletRequest request) {
		int page = 1;
		int count = 9;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		boardDAO bd = boardDAO.getInstance();
		ArrayList<boardVO> boardList = bd.getBoardList(page, count);
		request.setAttribute("boardList", boardList);
		
		int listCount = bd.getListCount();
		int maxPage = (listCount - 1) / 10 + 1;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		
		if(endPage > maxPage) { endPage = maxPage; }
	}

	public void boardDetail(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		boardVO boardVo = new boardVO();
		
		boardDAO bd = boardDAO.getInstance();
		boardVo = bd.getBoardVo(board_num);
		
		bd.updateReadCount(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}
	
	public void boardreply(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		boardDAO bd = boardDAO.getInstance();
		
		boardVO boardVo = bd.getBoardVo(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}
	
	public void boardReplySubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		
		boardVO boardVo = new boardVO(); 

		boardVo.setBoard_num(board_num);
		boardVo.setBoard_name(board_name);
		boardVo.setBoard_pass(board_pass);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_re_ref(board_re_ref);
		boardVo.setBoard_re_lev(board_re_lev);
		boardVo.setBoard_re_seq(board_re_seq);
		
		boardDAO bd = boardDAO.getInstance();
		bd.boardReplySubmit(boardVo);
		
		response.sendRedirect(request.getContextPath() + "/listShow.bo");
	}
	
	public void boardUpdate(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		boardDAO bd = boardDAO.getInstance();
		boardVO boardVo = bd.getBoardVo(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}

	// 게시물 정보 수정
	public void boardUpdateSubmit(HttpServletRequest request, HttpServletResponse response) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");

		try {
			boardVO boardVo = new boardVO();
			boardVo.setBoard_num(board_num);
			boardVo.setBoard_name(board_name);
			boardVo.setBoard_pass(board_pass);
			boardVo.setBoard_title(board_title);
			boardVo.setBoard_content(board_content);
			
			boardDAO bd = boardDAO.getInstance();
			bd.boardUpdateSubmit(boardVo);
			
			response.sendRedirect(request.getContextPath() + "/boardDetail.bo?board_num=" + board_num);
		} catch (IOException e) { e.printStackTrace(); }
	}

	// 삭제 처리
	public void boardDeleteSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String board_num = request.getParameter("board_num");
		String board_pass = request.getParameter("board_pass");
		
		boardVO boardVo = new boardVO();
		boardVo.setBoard_num(Integer.parseInt(board_num));
		boardVo.setBoard_pass(board_pass);
		
		boardDAO bd = boardDAO.getInstance();
		boolean success = bd.boardDeleteSubmit(boardVo);
		
		if(success) { response.sendRedirect(request.getContextPath() + "/listShow.bo"); }
		else {
			response.sendRedirect(request.getContextPath() + "/boardDeleteForm.bo?board_num=" + boardVo.getBoard_num());
		}
	}
}
