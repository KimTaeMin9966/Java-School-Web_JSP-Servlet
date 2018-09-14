package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;
import util.Cookies;
import vo.memberVO;

public class memberService {
	memberVO mVO = new memberVO();
	
	public void joinProsess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");

		mVO.setId(id);
		mVO.setPass1(pass1);
		mVO.setPass2(pass2);
		mVO.setName(name);
		mVO.setAddr(addr);
		
		memberDAO mDAO = memberDAO.getInstance();
		int Query = mDAO.joinCheck(mVO);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		if(Query != 0) {
			System.out.println("회원가입성공");
			out.println("alert('회원가입성공');");
			out.println("location.href='login.mb'");
		} else {
			System.out.println("회원가입실패");
			out.println("alert('회원가입실패');");
			out.println("location.href='join.mb'");
		}
		out.println("</script>");
	}

	public void loginProsess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");
		
		mVO.setId(id);
		mVO.setPass(pass);
		
		memberDAO mDAO = memberDAO.getInstance();
		memberVO Query = mDAO.loginCheck(mVO);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		if(Query != null) {
			if(login != null) {
				System.out.println("로그인성공");
				out.print("alert('로그인성공');");
				
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);
				
				response.addCookie(Cookies.createCookie("id", id, 60*60*24*15));
				
				out.println("location.href='main.bo'");
			} else {
				System.out.println("로그인성공");
				out.print("alert('로그인성공');");
				
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);

				out.println("location.href='main.bo'");
			}
		} else {
			System.out.println("로그인실패");
			out.print("alert('로그인실패');");
			
			out.println("location.href='login.mb'");
		}
		out.println("</script>");
	}

	public void logOutProsess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookies cookies = new Cookies(request);
		cookies.removeCookie("id", request, response);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃성공');");
		out.println("location.href='main.bo'");
		out.println("</script>");
	}
	
	public void myInfoEdit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	public void myInfoDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		out.print("<script>");
		if(id.equals("admin")) {
			out.print("alert('관리자 계정은 삭제할 수 없습니다.');");
			out.print("location.href='main.bo'");
		} else {
			memberDAO md = memberDAO.getInstance();
			int Query = md.deleteMember(id);
			
			if(Query != 0) {
				out.print("alert('계정 삭제 완료.');");
				out.print("location.href='main.bo'");
			} else {
				out.print("alert('계정 삭제 실패.');");
				out.print("location.href='main.bo'");
			}
		}
		out.print("</script>");
	}
	
}
