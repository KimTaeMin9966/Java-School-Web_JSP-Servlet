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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%if(isLogin) {
		%>
			<%=id %>님 반갑습니당. &nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="logOut.jsp">로그아웃</a>
		<%	
		} else {
		%>
			<a href="login.jsp">로그인</a> &nbsp;&nbsp;|&nbsp;&nbsp; 
			<a href="join.jsp">회원가입</a>
		<%} %>
	</header>
	<article>
		<h1>메인 페이지 입니다.</h1>
	</article>
	<footer align="center">
		<address>
			copyright &copy; since by 2018
		</address>
	</footer>
</body>
</html>