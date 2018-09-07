<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.LoginMember" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		LoginMember l1 = new LoginMember();
		l1.setId("aaa");
		l1.setPass("12345");
		
		LoginMember l2 = new LoginMember();
		l2.setId("bbb");
		l2.setPass("22222");
		
		ArrayList<LoginMember> members = new ArrayList<>();
		members.add(l1);
		members.add(l2);
		
		request.setAttribute("lists", members);
	%>
	<jsp:forward page="getMember.jsp" />
</body>
</html>