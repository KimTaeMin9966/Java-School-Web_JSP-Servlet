<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URL" %>
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
		char[] buff = new char[128];
		int leng = -1;
		URL url = application.getResource(path);
		
		InputStreamReader is = null;
		try {
			is = new InputStreamReader(url.openStream(), "UTF-8");
			while((leng = is.read(buff)) != -1){
				out.print(new String(buff,0,leng));
			}
		} catch(IOException e) {
			out.print("예외 발생 : " + e.getMessage());
		} finally {
			try{ is.close(); } catch(IOException e) {}
		}
		out.print(url);
	%>
</body>
</html>