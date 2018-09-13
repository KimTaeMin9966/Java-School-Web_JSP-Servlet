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
	<jsp:include page="../../common/header.jsp"/>
	<h1>공지사항</h1>
	<c:if test="${member.id eq 'admin'}">
		<a href="noticeWriteForm.do">공지글 작성</a>
	</c:if>
	<table>
		<tr>
			<td colspan="4">
				<form action="noticeSearch.do" method="GET">
					<select name="searchName">
						<option value="author">작성자</option>
						<option value="title">제목</option>
					</select>
					<input type="text" name="searchValue" />
					<input type="submit" value="검색" />
				</form>
			</td>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.notice_num}</td>
				<td>${notice.notice_title}</td>
				<td>${notice.notice_author}</td>
				<td>${notice.notice_date}</td>
			</tr>
		</c:forEach>
	</table>
	<article>
		<%@ include file="../../common/page.jsp" %>
	</article>
</body>
</html>