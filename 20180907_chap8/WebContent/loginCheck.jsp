<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="loginMember" class="VO.MemberVO" />
<jsp:setProperty property="*" name="loginMember" />

<jsp:useBean id="joinMember" class="VO.MemberVO" scope="application" />

<%= loginMember.getId() + "   " + loginMember.getPass() %>
<br/>
<br/>
<%= joinMember.getId() + "   " + joinMember.getPass() %>

<%
	if(joinMember.getId().equals(loginMember.getId())
			&& joinMember.getPass().equals(loginMember.getPass())) {
		Cookie cookie = new Cookie("id", loginMember.getId());
		cookie.setMaxAge(60*60*24*30);
		response.addCookie(cookie);
		session.setAttribute("id", loginMember.getId());
		out.print("<script>alert('로그인 성공'); location.href='index.jsp';</script>");
	} else {
		out.print("<script>alert('로그인 실패'); location.href='login.jsp';</script>");
	}
%>