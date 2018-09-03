<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="aaa" class="test.Member" scope="page">
		<%-- <jsp:setProperty property="name" name="aaa" value="손홍민"/> --%>
	</jsp:useBean>
	<h3><%=aaa.getName() %></h3>
</body>
</html>