<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>server정보</title>
</head>
<body>
	서버정보 : <%= application.getServerInfo() %><br/>
	서블릿 규약 상위 : <%= application.getMajorVersion() %><br/>
	서블릿 규약 하위 : <%= application.getMinorVersion() %><br/>
	어플리케이션 절대 경로 : <%= application.getRealPath("/") %><br/>
	getServletInfo : <%= config.getServletName() %><br/>
	경로 패스 <%= request.getContextPath() %><br/>
	현재 패이지 정보 : <%= this.getServletInfo() %>
</body>
</html>