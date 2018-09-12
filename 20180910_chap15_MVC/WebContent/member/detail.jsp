<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>회원정보 상세</h1>
	아이디 : ${detailUser.id}
	이 름 : ${detailUser.name}
	주 소 : ${detailUser.addr}
	전화번호 : ${detailUser.phone}
	<a href="deleteMember.mb?id=${detailUser.id}">회원정보 삭제</a>
</body>
</html>