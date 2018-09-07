<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="loginMember" class="vo.LoginMember" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core</title>
</head>
<body>
	<c:set var="page" value="pageScope에 저장" scope="page" />
	<%-- <%
		String pageABC = "pageScope에 저장";
		pageContext.setAttribute("page", pageABC);
	%> --%>
	<c:set var="request" value="requestScope에 저장" scope="request" />
	<c:set var="session" value="sessionScope에 저장" scope="session" />
	<c:set var="application" value="applicationScope에 저장" scope="application" />
	
	<c:out value="${page}" />
	<c:out value="Hello JSTL" />
	
	<c:set target="${loginMember}" property="id" value="id001" />
	${loginMember.id}<br/>
	
	<c:out value="${loginMember.id}" /><br/>
	<c:out value="${request}" />
	<%-- <c:remove var="request" /><br/> --%>
	<c:out value="${request}" />
	
	<a href="jstlcoreTest2.jsp">두번째로 이동</a>
</body>
</html>