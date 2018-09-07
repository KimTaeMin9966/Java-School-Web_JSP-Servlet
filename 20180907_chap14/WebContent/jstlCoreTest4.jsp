<%@page import="java.util.ArrayList"%>
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
	<%
		int[] num = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		request.setAttribute("numArray", num);
	%>
	<c:forEach items="${numArray}" var="n">
		<c:out value="${n}"></c:out>
	</c:forEach><br/>
	
	<c:forEach var="result" begin="1" end="10" step="1">
		${result} &nbsp;
	</c:forEach><br/>
	
	<c:set var="data" value="고민성,김태민,김태오,박준현" />
	<c:forTokens var="varData" items="${data}" delims=",">
		${varData} &nbsp;
	</c:forTokens><br/>
	
	<c:set var="data" value="이은영|조정민|전해성|팽찬우" />
	<c:forTokens var="varData" items="${data}" delims="|">
		${varData} &nbsp;
	</c:forTokens><br/>
	
	<%
		ArrayList<String> list = new ArrayList<String>();
		list.add("황재연 일어나라");
		list.add("황재연 밥먹어라");
		list.add("황재연 밥먹지 말고 자라!");
		request.setAttribute("temp", list);
	%>
	<c:forEach var="temp_text" items="${temp}">
		<c:out value="${temp_text}" />&nbsp;
	</c:forEach><br/>
	
	
	
</body>
</html>