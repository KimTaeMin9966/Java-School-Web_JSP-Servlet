<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("t_num");
	int t_num = Integer.parseInt(num);
	
	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "DELETE FROM test_member WHERE t_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, t_num);
		pstmt.executeUpdate();
		
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
		session.removeAttribute("id");
		
		out.print("<script>alert('회원정보가 삭제되었습니다.'); location.href='index.jsp';</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'index.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>