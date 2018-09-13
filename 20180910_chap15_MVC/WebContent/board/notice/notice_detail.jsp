<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:include page="../../common/header.jsp"/>
	<table>
		<tr>
			<td>작성자</td>
			<td>${notice.notice_author}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.notice_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea readonly>${notice.notice_content}</textarea></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${notice.notice_date}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="noticeUpdateForm.do?notice_num=${notice.notice_num}">수정</a>
				<a href="noticeDelete.do?notice_num${notice.notice_num}">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>