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
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		session.setAttribute("email", email);		
	%>
	
	<h3><%=application.getAttribute("id") %> email 정보 저장 완료</h3>
	<a href="attrTest3.jsp">확인하러 가기</a>
</body>
</html>






