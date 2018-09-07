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
	<c:set var="myCar" value="빨강" />
	<%-- <c:if test="${myCar == '빨강'}"> --%>
	<c:if test="${myCar eq '빨강'}">
		색상은 빨강색
	</c:if>
	
	<c:set var="grade" value="70" />
	<c:choose>
		<c:when test="${grade >= 90}">학점은 A학점</c:when>
		<c:when test="${grade >= 80}">학점은 B학점</c:when>
		<c:when test="${grade >= 70}">학점은 C학점</c:when>
		<c:when test="${grade >= 60}">학점은 D학점</c:when>
		<c:otherwise>학점은 F학점</c:otherwise>
	</c:choose>
</body>
</html>