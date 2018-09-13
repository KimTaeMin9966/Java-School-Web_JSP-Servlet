<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
		border: 1px soild #CCC;
		width: 500px;
		margin: 50px auto;
	}
	table th, table td {
		border: 1px solid #333;
		text-align: center;
		height: 35px;
	}
	table td:nth-child(2) {
		text-align: left;
		padding-left: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>글 내용 상세보기</h1>
	<table>
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
			<td>첨부파일</td>
			<td>
				<c:if test="${!empty boardVo.board_file}">
					<a href="file_down.bo?board_file=${boardVo.board_file}">${boardVo.board_file}</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="boardReplyForm.bo?board_num=${boardVo.board_num}">[답변]</a>
				<a href="boardUpdateForm.bo?board_num=${boardVo.board_num}">[수정]</a>
				<a href="boardDeleteForm.bo?board_num=${boardVo.board_num}">[삭제]</a>
				<a href="boardList.bo">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>