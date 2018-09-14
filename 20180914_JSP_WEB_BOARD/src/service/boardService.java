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

}
