<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
    
    <!-- errorPage="error.jsp" -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="aaa.jsp">aaa!</a>

	<%
		String s = request.getParameter("error");
		if(s == null){
			//throw new NullPointerException();
			throw new ClassNotFoundException(); // 500에러
		}
	%>
	
	
</body>
</html>