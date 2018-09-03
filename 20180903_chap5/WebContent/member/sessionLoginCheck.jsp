<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERUID");
	boolean login = (memberId == null) ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(login){
	%>
	아이디 : <%= memberId%>가 로그인 한 상태
	<%}else{ %>
		<script>
			alert("로그인 하지 않은 상태");
			window.location.href="sessionLogin.jsp";
		</script>
	<%} %>
</body>
</html>





