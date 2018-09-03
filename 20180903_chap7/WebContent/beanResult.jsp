<%@page import="test.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		/* String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		Member2 m = new Member2();
		m.setName(name);
		m.setAddr(addr);
		m.setEmail(email); */
	%>
	<jsp:useBean id="m" class="test.Member2">
		<%-- <jsp:setProperty property="*" name="m" /> --%>
		<%-- <jsp:setProperty property="name" name="m" /> --%>
	</jsp:useBean>
	<%
		m.setName("바보");
		m.setAddr("평양");
		m.setEmail("abc@nate.com");
	%>
	이름 : <%= m.getName()%>
	주소 : <%= m.getAddr()%>
	이메일 : <%= m.getEmail()%>
</body>
</html>