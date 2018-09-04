<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="VO.VOmember" />
<jsp:setProperty property="*" name="member" />
<%
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
			<a href="index.jsp?page=logOut">로그아웃</a>
		<%	
		} else {
		%>
			<a href="index.jsp?page=login">로그인</a> &nbsp;&nbsp;|&nbsp;&nbsp; 
			<a href="index.jsp?page=join">회원가입</a>
		<%} %>
</header>
<hr/>