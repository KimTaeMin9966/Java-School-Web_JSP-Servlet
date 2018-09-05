<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
%>
<%-- <jsp:useBean id="loginMember" class="vo.MemberVo"/> 
<jsp:setProperty property="*" name="loginMember"/> --%>
<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />
<%
	if (id.equals(joinMember.getId()) && pass.equals(joinMember.getPass())) {
		if (login != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(cookie);
		}
		session.setAttribute("id", id);
		out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
	} else {
		out.print("<script>alert('로그인 실패');location.href='index.jsp?page=login';</script>");
	}
%>