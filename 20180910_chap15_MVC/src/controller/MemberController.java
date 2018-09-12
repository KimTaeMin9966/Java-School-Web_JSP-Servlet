package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.mb")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService ms = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberService.loginCheck(request);
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());
		System.out.println(command);
		
		if(command.equals("/info.mb")) { // OK
			System.out.println("나의 정보 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/info.jsp");
			rd.forward(request, response);
		} else if(command.equals("/management.mb")) { // OK
			System.out.println("회원관리 요청");
			ms.memberList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/member/management.jsp");
			rd.forward(request, response);
		} else if(command.equals("/logOut.mb")) { // OK
			System.out.println("로그아웃 요청");
			ms.logOut(request, response);
		} else if(command.equals("/login.mb")) { // OK
			System.out.println("로그인 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/login.jsp");
			rd.forward(request, response);
		} else if(command.equals("/join.mb")) { // OK
			System.out.println("회원가입 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/join.jsp");
			rd.forward(request, response);
		} else if(command.equals("/memberLogin.mb")) { // OK
			System.out.println("로그인 프로세스 요청");
			try { ms.loginCheck(request, response); }
			catch (SQLException e) { e.printStackTrace(); }
		} else if(command.equals("/memberJoin.mb")) { // OK
			System.out.println("회원가입 프로세스 요청");
			ms.joinCheck(request, response);
		} else if(command.equals("/main.mb")) { // OK
			System.out.println("메인페이지 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
			rd.forward(request, response);
		} else if(command.equals("/memberDetail.mb")) { // OK
			System.out.println("회원 상세 정보 요청");
			System.out.println("id : " + request.getParameter("id"));
			ms.getMemberVo(request);
			RequestDispatcher rd = request.getRequestDispatcher("/member/detail.jsp");
			rd.forward(request, response);
		} else if(command.equals("/deleteMember.mb")) { // OK
			System.out.println("회원정보 삭제 요청");
			ms.deleteMember(request, response);
		} else if(command.equals("/update.mb")) { // OK
			System.out.println("회원정보 수정창 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/update.jsp");
			rd.forward(request, response);
		} else if(command.equals("/memberUpdate.mb")) { // OK
			System.out.println("수정 요청");
			ms.memberUpdate(request, response);
		} else if(command.equals("/withdraw.mb")) { // OK
			System.out.println("회원정보 탈퇴 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/withdraw.jsp");
			rd.forward(request, response);
		} else if(command.equals("/withDrawSubmit.mb")) { // OK
			System.out.println("회원 탈퇴 요청");
			ms.withDrawSubmit(request, response);
		}
	}

}
