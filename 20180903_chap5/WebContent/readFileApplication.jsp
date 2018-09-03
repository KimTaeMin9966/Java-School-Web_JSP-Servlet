<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = "/message/notice.txt";	
	%>

자원의 실제 경로 : <%=application.getRealPath(path) %>
------------<%=path %> 의 내용

<%
	char[] buff = new char[128];
	int leng = -1;
	
	try(InputStreamReader is = new InputStreamReader(
			application.getResourceAsStream(path),"UTF-8")){
		while((leng = is.read(buff)) != -1){
			out.print(new String(buff,0,leng));
		}
		
	}catch(IOException e){
		out.print("예외 발생 : " + e.getMessage());		
	}
%>
</body>
</html>








