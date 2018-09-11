package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

public class MemberService {
	public void joinCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVo memberVo = new MemberVo();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		
		memberVo.setId(id);
		memberVo.setPass(pass);
		memberVo.setName(name);
		memberVo.setAddr(addr);
		memberVo.setPhone(phone);
		
		MemberDao md = MemberDao.getInstance();
		int Query = md.joinProsess(memberVo);
		if(Query != 0) {
			System.out.println("회원가입성공");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입성공');");
			out.println("location.href='main.mb'");
			out.println("</script>");
			
		}
	}

	public void loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVo memberVo = new MemberVo();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");

		memberVo.setId(id);
		memberVo.setPass(pass);
		
		MemberDao md = MemberDao.getInstance();
		ResultSet Query = md.loginProsess(memberVo);
		if(Query != null) {
			System.out.println("로그인성공");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVo);
				Cookie cookie = new Cookie("id", id);
				cookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cookie);
				out.println("alert('로그인성공');");
				out.println("location.href='main.mb'");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVo);
				out.println("alert('로그인성공');");
				out.println("location.href='main.mb'");
			}
			out.println("</script>");
			response.sendRedirect(request.getContextPath()+"/main.mb");
		} else {
			System.out.println("로그인실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패');");
			out.println("location.href='login.mb'");
			out.println("</script>");
		}
	}

	public void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃성공');");
		out.println("location.href='main.mb'");
		out.println("</script>");
	}
}
