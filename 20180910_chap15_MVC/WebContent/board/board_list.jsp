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
	section {
		text-align: center;
	}
	section a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>게시물 목록</h1>
	<a href="boardWrite.bo">게시판 글쓰기</a>
	<table>
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
				<td>
					<c:choose>
						<c:when test="${today == board.board_day_date}">
							${board.board_time_date}
						</c:when>
						<c:otherwise>
							${board.board_day_date}
						</c:otherwise>
					</c:choose>
				</td>
				<td>${board.board_readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<%-- <c:choose>
		<c:when test="${pageInfo.startPage <=1}">
			[이전] &nbsp;
		</c:when>
		<c:otherwise>
			<a href="boardList.bo?page=${pageInfo.startPage - 1}">[이전]</a>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var ="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
		<a href="boarList.bo?page=${i}">[${i}]</a>
	</c:forEach>
	
	<c:choose>
		<c:when test="${pageInfo.endPage >= pageInfo.maxPage}">
			[다음]
		</c:when>
		<c:otherwise>
			<a href="boardList.bo?page=${pageInfo.endPage + 1}">[다음]</a>
		</c:otherwise>
	</c:choose> --%>
	<section>
		<c:choose>
			<c:when test="${pageInfo.page <=1}">
				[이전] &nbsp;
			</c:when>
			<c:otherwise>
				<a href="boardList.bo?page=${pageInfo.page-1}">[이전]</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var ="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
			<c:when test="${pageInfo.page eq i}">
				<a href="boardList.bo?page=${i}"><span style="color:RED;">[${i}]</span></a>	
			</c:when>
			<c:otherwise>
				<a href="boardList.bo?page=${i}"><span style="color:#CCC;">[${i}]</span></a>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageInfo.page >= pageInfo.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="boardList.bo?page=${pageInfo.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>