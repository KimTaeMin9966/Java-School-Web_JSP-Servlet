<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0) {
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				session.setAttribute("id", cookies[i].getValue());
			}
		}
	}
	String id = (String) session.getAttribute("id");
	boolean isLogin = false;
	if(id != null) {
		isLogin = true;
	}
%>
<header style="margin: 35px 0;">
		<%if(isLogin) {
		%>
			<a href="index.jsp?page=info"><%=id %></a>님 반갑습니당. &nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="logOut.jsp">로그아웃</a>
		<%	
		} else {
		%>
			<a href="index.jsp?page=login">로그인</a> &nbsp;&nbsp;|&nbsp;&nbsp; 
			<a href="index.jsp?page=join">회원가입</a>
		<%} %>
</header>
<hr/>