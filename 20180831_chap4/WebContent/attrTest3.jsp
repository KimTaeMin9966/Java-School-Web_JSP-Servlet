<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디는 <%= application.getAttribute("id") %>
	email은 <%= session.getAttribute("email") %>
	<a href="attrTest4.jsp">페이지 컨텍스트</a>
</body>
</html>