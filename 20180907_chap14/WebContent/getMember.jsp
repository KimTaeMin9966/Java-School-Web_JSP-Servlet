<%-- <%@page import="vo.LoginMember"%>
<%@page import="java.util.ArrayList"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- lists -->
	<%
		/* ArrayList<LoginMember> members = (ArrayList<LoginMember>)request.getAttribute("lists");
		out.print(members.size()); */
	%>
	${lists.size()}
	첫번째 객체 정보 : id = ${lists[0].id}, pass = ${lists[0].pass}<br/>
	두번째 객체 정보 : id = ${lists[1].id}, pass = ${lists[1].pass}
</body>
</html>