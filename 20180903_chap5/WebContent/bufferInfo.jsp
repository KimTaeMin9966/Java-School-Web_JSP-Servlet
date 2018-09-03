<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	버퍼크기 : <%= out.getBufferSize() %>
	안녕하세요 반가워요!!
	남은 크기 : <%= out.getRemaining() %>
	auto flush : <%= out.isAutoFlush() %>

</body>
</html>