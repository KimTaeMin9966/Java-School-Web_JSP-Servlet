<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	a {
		text-decoration: none;
	}
</style>
<a href="${link}.do?page=1&searchName=${searchName}&searchValue=${searchValue}">[처음]</a>&nbsp;
<c:choose>
	<c:when test="${pageInfo.page <= 1}">[이전]&nbsp;</c:when>
	<c:otherwise><a href="${link}.do?page=${pageInfo.page - 1}&searchName=${searchName}&searchValue=${searchValue}">[이전]</a></c:otherwise>
</c:choose>

<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	<c:choose>
		<c:when test="${pageInfo.page eq i}">
			<a href="${link}.do?page=${i}&searchName=${searchName}&searchValue=${searchValue}"><span style="color: RED;">[${i}]</span></a>
		</c:when>
		<c:otherwise>
			<a href="${link}.do?page=${i}&searchName=${searchName}&searchValue=${searchValue}"><span style="color: #CCC;">[${i}]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:choose>
	<c:when test="${pageInfo.page >= pageInfo.maxPage}">&nbsp;[다음]</c:when>
	<c:otherwise><a href="${link}.do?page=${pageInfo.page + 1}&searchName=${searchName}&searchValue=${searchValue}">[다음]</a></c:otherwise>
</c:choose>
&nbsp;<a href="${link}.do?page=${pageInfo.maxPage}&searchName=${searchName}&searchValue=${searchValue}">[마지막]</a>