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
	<form action="boardDeleteSubmit.bo" method="post">
		<input type="hidden" name="board_num" value="${board_num}" />
		비밀번호 : <input type="password" name="board_pass"/><br/>
		<input type="submit" value="삭제"/>
	</form>
	<a href="boardList.bo">목록</a>
</body>
</html>