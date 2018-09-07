<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- catch -->
	<c:catch var="ex">
		name = 파라미터 <%= request.getParameter("name") %>
		<% if(request.getParameter("name").equals("test")) { %>
			${param.name}은 test입니다.
		<% } %>
	</c:catch>
	
	<p><c:if test="${ex != null}">예외발생</c:if></p>
	
	<c:set var="now" value="<%=new Date() %>" />
	<fmt:formatDate value="${now}" type="date" /><br/>
	<fmt:formatDate value="${now}" type="date" dateStyle="full" /><br/>
	<fmt:formatDate value="${now}" type="date" dateStyle="short" /><br/>
	<fmt:formatDate value="${now}" type="time" /><br/>
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /><br/>
	
	<fmt:bundle basename="bundle">
		<fmt:message key="name" />
	</fmt:bundle>
	
	<c:set var="ko" value="ko_KR"/>
	<c:set var="ko_set" value="kr_bundle" />
	
	<c:set var="en" value="en_US"/>
	<c:set var="en_set" value="en_bundle" />
	
	<fmt:setLocale value="${en}"/>
	<fmt:bundle basename="${en_set}">
		<fmt:message key="name"/>
		<fmt:message key="addr">
			<fmt:param value="동래구"/>
			<fmt:param value="충렬대로 84"/>
		</fmt:message>
		<fmt:message key="phone"/>
	</fmt:bundle>
	
	<c:set var="price" value="10000000"/>
	<br/>
	<fmt:formatNumber value="${price}" type="number" var="numberType"/>
	숫자 : ${numberType}<br/>
	통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="원" /><br/>
	퍼센트 : <fmt:formatNumber value="${price}" type="percent" groupingUsed="false" /><br/>
	패턴 : <fmt:formatNumber value="${price}" pattern="0,0000,000.00" /><br/>
</body>
</html>