<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals(pass)){
		session.setAttribute("MEMBERUID",id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인에 성공하였습니다.
	<%}else{ %>
<script>
	alert("로그인 실패");
	history.go(-1);
	//history.back();
</script>		
	<%} %>
</body>
</html>