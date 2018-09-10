<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 목록</h1>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.board_num}</td>
				<td>
					<c:if test="${board.board_re_lev != 0}">
						<c:forEach var="i" begin="1" end="${board.board_re_lev}">&nbsp;&nbsp;&nbsp;</c:forEach>
						▶
					</c:if>
					<a href="boardDetail.bo?board_num=${board.board_num}">${board.board_title}</a>
				</td>
				<td>${board.board_name}</td>
				<td>${board.board_date}</td>
				<td>${board.board_readcount}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>