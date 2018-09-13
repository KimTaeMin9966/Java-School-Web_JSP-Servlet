<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	a {
		text-decoration: none;
	}
</style>
<a href="notice.do?page=1">[처음]</a>&nbsp;
<c:choose>
	<c:when test="${pageInfo.page <= 1}">[이전] &nbsp;</c:when>
	<c:otherwise><a href="notice.do?page=${pageInfo.page - 1}">[이전]</a></c:otherwise>
</c:choose>

<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	<c:choose>
		<c:when test="${pageInfo.page eq i}">
			<a href="notice.do?page=${i}"><span style="color: RED;">[${i}]</span></a>
		</c:when>
		<c:otherwise>
			<a href="notice.do?page=${i}"><span style="color: #CCC;">[${i}]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:choose>
	<c:when test="${pageInfo.page >= pageInfo.maxPage}">[다음]</c:when>
	<c:otherwise><a href="notice.do?page=${pageInfo.page + 1}">[다음]</a></c:otherwise>
</c:choose>
&nbsp;<a href="notice.do?page=${pageInfo.maxPage}">[마지막]</a>