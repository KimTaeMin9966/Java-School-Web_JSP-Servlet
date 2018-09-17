<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="board/css/board_Detail.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="../header.jsp" />
		<table id="webBoard-datas">
			<tr>
				<td>작성자</td>
				<td>${boardVo.board_name}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${boardVo.board_title}</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>${boardVo.board_content}</td>
			</tr>
			<tr>
				<td colspan=2>
					<a href="boardReplyForm.bo?board_num=${boardVo.board_num}">[답변]</a>
					<a href="boardUpdateForm.bo?board_num=${boardVo.board_num}">[수정]</a>
					<a href="boardDeleteForm.bo?board_num=${boardVo.board_num}">[삭제]</a>
					<a href="listShow.bo">[목록]</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>