<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Calendar" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%! String s = "test";
	String getStr(String str){
		s = s+str;
		return s;
	}	
%>

<%= getStr("바보바보멍청이!멍청이!") %>

<%
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int minute = cal.get(Calendar.MINUTE);
	int second = cal.get(Calendar.SECOND);
%>
</head>
<body>
현재시간 <%=hour %>시 <%=minute %>분 <%=second %>초 
</body>
</html>