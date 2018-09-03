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
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String[] gender = request.getParameterValues("gender");
		String[] hobby = request.getParameterValues("hobby");
		out.append("이름 : " + name);
		out.append(" 성별 : ");
		for(String g : gender) {
			out.append(g);
		}
		out.append(" 취미 : ");
		for(String h : hobby) {
			out.append(h + ", ");
		}
	%>
</body>
</html>