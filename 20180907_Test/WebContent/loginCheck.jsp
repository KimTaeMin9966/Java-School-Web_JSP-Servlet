<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="loginMember" class="VO.VOmember" />
<jsp:setProperty property="*" name="loginMember" />

<jsp:useBean id="joinMember" class="VO.VOmember" scope="application" />
<% String isSave = request.getParameter("isSave"); %>
<%
	if(joinMember.getId().equals(loginMember.getId())
			&& joinMember.getPass().equals(loginMember.getPass())) {
		if(isSave != null) {
			Cookie cookie = new Cookie("id", loginMember.getId());
			cookie.setMaxAge(60*60*24*30);
			response.addCookie(cookie);
			session.setAttribute("id", loginMember.getId());
			out.print("<script>alert('로그인 성공'); location.href='index.jsp?page=default';</script>");
		} else {
			session.setAttribute("id", loginMember.getId());
			out.print("<script>alert('로그인 성공'); location.href='index.jsp?page=default';</script>");
		}
	} else {
		out.print("<script>alert('로그인 실패'); location.href='index.jsp?page=login';</script>");
	}
%>