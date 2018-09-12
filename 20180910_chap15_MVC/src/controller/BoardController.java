package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.MemberService;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService bs = new BoardService();
	
	private void doProsess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		MemberService.loginCheck(request);
		
		System.out.println("요청이 들어옴");
		String requestUri = request.getRequestURI();
		System.out.println(requestUri);
		
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		
		String command = requestUri.substring(contextPath.length());
		System.out.println(command);
		

		if(command.equals("/boardList.bo")) {
			System.out.println("게시물 목록 요청");
			bs.boardList(request);
			//response.sendRedirect(request.getContextPath()+"/board/board_list.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_list.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardWrite.bo")) {
			System.out.println("게시물 작성 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_write.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardWriteSubmit.bo")) {
			System.out.println("게시글 입력 요청");
			bs.regArticle(request);
			RequestDispatcher rd = request.getRequestDispatcher("/boardList.bo");
			rd.forward(request, response);
		} else if(command.equals("/boardDetail.bo")) {
			System.out.println("상세보기 요청");
			System.out.println("board_num : " + request.getParameter("board_num"));
			bs.boardDetail(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_detail.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardReplyForm.bo")) {
			System.out.println("답변 작성 창 요청");
			bs.boardreply(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_reply.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardReplySubmit.bo")) {
			System.out.println("답변 게시물 추가 요청");
			bs.boardReplySubmit(request, response);
		} else if(command.equals("/boardUpdateForm.bo")) {
			System.out.println("수정창 요청");
			bs.boardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_update.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardUpdateSubmit.bo")) {
			System.out.println("게시물 수정 요청");
			bs.boardUpdateSubmit(request, response);
		} else if(command.equals("/boardDeleteForm.bo")) {
			System.out.println("삭제창 요청");
			String board_num = request.getParameter("board_num");
			request.setAttribute("board_num", board_num);
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_delete.jsp");
			rd.forward(request, response);
		} else if(command.equals("/boardDeleteSubmit.bo")) {
			System.out.println("삭제 요청");
			bs.boardDeleteSubmit(request, response);
		} else if(command.equals("/boardSample.bo")) {
			bs.boardSample();
		} else if(command.equals("/file_down.bo")) {
			System.out.println("파일 다운 요청");
			ServletContext context = request.getServletContext();
			bs.fileDown(request, response, context);
		} else if(command.equals("/main.bo")) {
			System.out.println("main 호출");
			RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProsess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProsess(request, response);
	}
}
