package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import util.Cookies;
import vo.BoardVo;
import vo.MemberVo;
import vo.PageInfo;

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

	public void loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		MemberVo memberVo = new MemberVo();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");

		memberVo.setId(id);
		memberVo.setPass(pass);
		
		MemberDao md = MemberDao.getInstance();
		MemberVo Query = md.loginProsess(memberVo);
		if(Query != null) {
			System.out.println("로그인성공");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);
				response.addCookie(Cookies.createCookie("id", id, 60*60*24*15));
				out.println("alert('로그인성공');");
				out.println("location.href='main.mb'");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);
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
		Cookies cookies = new Cookies(request);
		cookies.removeCookie("id", request, response);
		HttpSession session = request.getSession();
		session.invalidate(); // 쿠키 지우는 작업도 필요함
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃성공');");
		out.println("location.href='main.mb'");
		out.println("</script>");
	}
	
	public static void loginCheck(HttpServletRequest request) throws IOException {
		Cookies cookies = new Cookies(request);
		if(cookies.exists("id")) {
			MemberDao md = MemberDao.getInstance();
			MemberVo member = md.getMemberVo(cookies.getValue("id"));
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
		}
	}

	public void memberList(HttpServletRequest request) {
		int page = 1;
		int count = 9;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		MemberDao md = MemberDao.getInstance();
		ArrayList<MemberVo> memberList = md.getMemberList(page, count);
		request.setAttribute("memberList", memberList);
		
		int listCount = md.getListCount();
		System.out.println("전체 게시물의 갯수 : " + listCount);
		
		int maxPage = (listCount - 1) / 10 + 1;
		System.out.println("전체 Page : " + maxPage);
		
		int startPage = (page - 1) / 10 * 10 + 1;
		System.out.println("start Page : " + startPage);
		
		int endPage = startPage + 9;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println("end Page : " + endPage);
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		request.setAttribute("pageInfo", pageInfo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
	}
}
