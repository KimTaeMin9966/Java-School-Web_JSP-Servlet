<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="board/css/board_Delete.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="../header.jsp" />
		<form action="boardDeleteSubmit.bo" method="post">
			<input type="hidden" name="board_num" value="${board_num}" />
			비밀번호 : <input type="password" name="board_pass"/><br/>
			<input type="submit" value="삭제"/>
		</form>
		<a href="listShow.bo">목록</a>
	</div>
</body>
</html>