<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		pageContext.setAttribute("aaa", "111");
		request.setAttribute("bbb", "222");
	%>
	
	<jsp:forward page="attrResult.jsp">
		<jsp:param value="333" name="ccc"/>	
	</jsp:forward>
</body>
</html>