<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder" %>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			if (cookies[i].getName().equals("name")) {
				Cookie cookie = new Cookie("name", URLEncoder.encode("떡꼬치", "UTF-8"));
				response.addCookie(cookie);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	값 변경 
	<a href="viewCookie.jsp">확인</a>
</body>
</html>