<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("name", URLEncoder.encode("최기근", "UTF-8"));
		response.addCookie(cookie);
	%>
	
	쿠키 이름 :
	<%=cookie.getName()%>
	쿠키의 값 :
	<%=cookie.getValue()%>

	<br />
	<a href="viewCookie.jsp"> 쿠키 확인</a>
	<a href="modifyCookie.jsp"> 쿠키 수정</a>
	<a href="deleteCookie.jsp"> 쿠키 삭제</a>
</body>
</html>