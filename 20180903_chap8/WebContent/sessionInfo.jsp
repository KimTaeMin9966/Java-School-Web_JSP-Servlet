<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat();
	%>
	
	세션 ID : <%= session.getId() %>
	세션 시간 : <%= session.getMaxInactiveInterval() %> <br/>
	<% date.setTime(session.getCreationTime()); %>
	세션 생성시간 : <%= sdf.format(date) %>
	<% date.setTime(session.getLastAccessedTime()); %>
	최근 접속 시간 : <%= sdf.format(date) %>
	
</body>
</html>






