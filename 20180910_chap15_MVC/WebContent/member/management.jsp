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
	table tr td:hover{
		cursor:	pointer;
	}
</style>
<script type="text/javascript">
	function detail(id) {
		location.href='memberDetail.mb?id='+id;
	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>회원목록</h1>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>
		</tr>
		<c:forEach var="user" items="${memberList}">
			<tr onclick="detail('${user.id}');">
				<td>${user.id}</td>
				<td>${user.name}</td>
				<td>${user.addr}</td>
				<td>${user.phone}</td>
			</tr>
		</c:forEach>
	</table>
	<section>
		<c:choose>
			<c:when test="${pageInfo.page <=1}"></c:when>
			<c:otherwise>
				<a href="management.mb?page=${pageInfo.page - 1}">[이전]</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var ="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
				<c:when test="${pageInfo.page eq i}">
					<a href="management.mb?page=${i}"><span style="color:RED;">[${i}]</span></a>	
				</c:when>
				<c:otherwise>
					<a href="management.mb?page=${i}"><span style="color:#CCC;">[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageInfo.page >= pageInfo.maxPage}"></c:when>
			<c:otherwise>
				<a href="management.mb?page=${pageInfo.page + 1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>