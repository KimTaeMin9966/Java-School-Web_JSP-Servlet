<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie cookies[] = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				Cookie c = new Cookie("id", "");
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}
	//session.invalidate();
	session.removeAttribute("member");
%>

<script>
	alert("로그아웃 완료");
	location.href = "index.jsp";
</script>


