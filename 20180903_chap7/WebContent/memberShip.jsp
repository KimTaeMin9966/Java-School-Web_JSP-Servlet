<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="member.MemberInfo">
		<jsp:setProperty property="*" name="member" />
	</jsp:useBean>
	아이디 : <jsp:getProperty property="id" name="member"/><br/>
	비밀번호 : <jsp:getProperty property="pass" name="member"/><br/>
	이름 : <jsp:getProperty property="name" name="member"/><br/>
	이메일 : <jsp:getProperty property="email" name="member"/><br/>
</body>
</html>