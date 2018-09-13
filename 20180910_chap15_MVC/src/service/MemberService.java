package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import util.Cookies;
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

	public void loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVo memberVo = new MemberVo();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");

		memberVo.setId(id);
		memberVo.setPass(pass);
		
		MemberDao md = MemberDao.getInstance();
		int Query = md.loginProsess(memberVo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(Query != 0) {
			out.print("<script>");
			if(login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);
				
				response.addCookie(Cookies.createCookie("id", id, 60*60*24*15));
				
				out.print("alert('로그인성공');");
				out.print("location.href='main.mb'");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("member", Query);
				
				out.print("alert('로그인성공');");
				out.print("location.href='main.mb'");
			}
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('로그인실패');");
			out.print("location.href='login.mb'");
			out.print("</script>");
		}
	}

	public void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookies cookies = new Cookies(request);
		cookies.removeCookie("id", request, response);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃성공');");
		out.println("location.href='main.mb'");
		out.println("</script>");
	}
	
	public void logOut2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookies cookies = new Cookies(request);
		cookies.removeCookie("id", request, response);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃성공');");
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
		int maxPage = (listCount - 1) / 10 + 1;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		
		if(endPage > maxPage) { endPage = maxPage; }
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		
		request.setAttribute("pageInfo", pageInfo);
	}

	public void getMemberVo(HttpServletRequest request) {
		MemberDao md = MemberDao.getInstance();
		MemberVo memberVo = md.getMemberVo(request.getParameter("id"));
		
		request.setAttribute("detailUser", memberVo);
	}

	public void deleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		out.print("<script>");
		if(id.equals("admin")) {
			out.print("alert('관리자 계정은 삭제할 수 없습니다.');");
			out.print("location.href='management.mb'");
		} else {
			MemberDao md = MemberDao.getInstance();
			md.deleteMember(id);
			out.print("alert('계정 삭제 완료.');");
			out.print("location.href='management.mb'");
		}
		out.print("</script>");
	}

	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDao md = MemberDao.getInstance();
		MemberVo member = new MemberVo();
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setAddr(request.getParameter("addr"));
		member.setPhone(request.getParameter("phone"));
		
		boolean success = md.memberUpdate(member);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		if (success) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			out.print("alert('회원정보 수정 완료');");
		}
		else { out.print("alert('회원정보 수정 실패');"); }
		
		out.print("location.href='update.mb'");
		out.print("</script>");
	}

	public void withDrawSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tempPass = request.getParameter("tempPass");
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		MemberDao md = MemberDao.getInstance();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(member.getPass().equals(tempPass)) {
			md.deleteMember(member.getId());
			logOut2(request, response);
			out.print("<script>");
			out.print("alert('회원탈퇴 완료');");
			out.print("location.href='main.bo'");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('회원탈퇴 실패\n비밀번호가 일치하지 않습니다.');");
			out.print("location.href='withdraw.mb'");
			out.print("</script>");
		}
	}
}
