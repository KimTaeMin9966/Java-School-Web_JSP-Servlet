package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.boardService;

/**
 * Servlet implementation class boardController
 */
@WebServlet("*.bo")
public class boardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boardService bs = new boardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProsess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProsess(request, response);
	}
	
	private void doProsess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());
		System.out.println(command);
		
		boolean success = false;
		
		if(command.equals("/main.bo")) {
			System.out.println("메인페이지 호출");
			
			response.sendRedirect("index.jsp");
		} else if(command.equals("/write.bo")) { // 작업 완료
			System.out.println("게시글 작성창 요청");
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_write.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardWriteSubmit.bo")) { // 작업 완료
			System.out.println("게시글 작성 요청");
			
			bs.writeProsess(request, response);
		} else if(command.equals("/listShow.bo")) { // 작업 완료
			System.out.println("게시글 목록창 요청");
			bs.getList(request);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_list.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardDetail.bo")) { // 작업 진행중
			System.out.println("게시글 자세히 보기창 요청");
			bs.boardDetail(request);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_Detail.jsp");
			rd.forward(request, response);
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		} else if(command.equals("")) { // 작업 진행중
			
		}
	}
}
