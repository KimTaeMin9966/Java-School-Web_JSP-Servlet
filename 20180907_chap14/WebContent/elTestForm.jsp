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
		pageContext.setAttribute("pageContextScope", "pageContext 에 저장");
		request.setAttribute("requestScope", "request 에 저장");
		session.setAttribute("sessionScope", "session 에 저장");
		application.setAttribute("applicationScope", "application 에 저장");
	%>
	pageContext 속성값 : ${pageContextScope}<br/>
	request 속성값 : ${requestScope}<br/>
	session 속성값 : ${sessionScope}<br/>
	application 속성값 : ${applicationScope}<br/>
	
	<% session.setAttribute("test", "bbb"); %>
	
	<form action="elTest.jsp" method="post">
		<input type="text" name="aaa" />
		<input type="submit" value="확인" />
	</form>
</body>
</html>