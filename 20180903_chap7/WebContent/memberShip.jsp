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
	아이디 : <jsp:getProperty property="id" name="member"/>
	비밀번호 : <jsp:getProperty property="pass" name="member"/>
	이름 : <jsp:getProperty property="name" name="member"/>
	이메일 : <jsp:getProperty property="email" name="member"/>
</body>
</html>