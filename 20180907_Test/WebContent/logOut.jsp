<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0) {
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				session.setAttribute("id", cookies[i].getValue());
			}
		}
	}
	session.removeAttribute("id");
%>
<script>
	alert('로그아웃 성공');
	location.href='index.jsp?page=default';
</script>