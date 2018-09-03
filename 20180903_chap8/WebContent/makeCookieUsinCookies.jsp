<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.Cookies" %>
<%
	response.addCookie(Cookies.createCookie("name", "닭강정"));
	response.addCookie(Cookies.createCookie("id", "id001",60*60));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="readCookieUsinCookies.jsp">쿠키 확인</a>
</body>
</html>