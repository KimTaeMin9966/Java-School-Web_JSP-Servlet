package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService;

@WebServlet("*.mb")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	memberService ms = new memberService();
	
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

		if(command.equals("/join.mb")) { // 작업 완료
			System.out.println("회원가입 페이지 요청");

			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			rd.forward(request, response);
		} else if(command.equals("/joinSubmit.mb")) { // 작업 완료
			System.out.println("회원가입 요청");
			ms.joinProsess(request, response);
			
		} else if(command.equals("/login.mb")) { // 작업 완료
			System.out.println("로그인 페이지 요청");

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else if(command.equals("/loginSubmit.mb")) { // 작업 완료
			System.out.println("로그인 요청");
			ms.loginProsess(request, response);
			
		} else if(command.equals("/logOut.mb")) { // 작업 완료
			System.out.println("로그아웃 요청");
			ms.logOutProsess(request, response);
			
		} else if(command.equals("/myInfo.mb")) { // 작업 완료
			System.out.println("나의 정보 보기 요청");
			
			RequestDispatcher rd = request.getRequestDispatcher("info.jsp");
			rd.forward(request, response);
		} else if(command.equals("/myInfoedit.mb")) { // 작업 진행중
			System.out.println("나의 정보 수정창 요청");
			
			RequestDispatcher rd = request.getRequestDispatcher("infoEdit.jsp");
			rd.forward(request, response);
		} else if(command.equals("/myInfodelete.mb")) { // 작업 진행중
			System.out.println("나의 정보 삭제 요청");
			ms.myInfoDelete(request, response);
			
			RequestDispatcher rd = request.getRequestDispatcher("infoDelete.jsp");
			rd.forward(request, response);
		} else if(command.equals("/management.mb")) { // 작업 진행중
			
		}
		
	}
	
}
