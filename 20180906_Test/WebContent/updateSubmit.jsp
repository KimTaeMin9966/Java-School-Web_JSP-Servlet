<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- jdbc/OracleDB -->

<%
	String t_pass = request.getParameter("t_pass");
	String t_name = request.getParameter("t_name");
	String t_addr = request.getParameter("t_addr");
	String t_phone = request.getParameter("t_phone");
	String memberNum = request.getParameter("t_num");
	int num = Integer.parseInt(memberNum);
	
	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	ResultSet rs = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "UPDATE test_member SET t_pass = ?, t_name = ?, t_addr = ?, t_phone = ? WHERE t_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, t_pass);
		pstmt.setString(2, t_name);
		pstmt.setString(3, t_addr);
		pstmt.setString(4, t_phone);
		pstmt.setInt(5, num);
		
		int result = pstmt.executeUpdate();
		
		if(result != 0) {
			out.print("<script>alert('쿼리 성공'); location.href = 'index.jsp';</script");
		}
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
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>