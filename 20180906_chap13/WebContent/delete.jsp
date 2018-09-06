<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	if(id == null || !id.equals("admin")) {
		out.print("<script>alert('올바른 접근이 아닙니다.'); location.href = 'index.jsp';</script");
	}

	String num = request.getParameter("u_num");
	int u_num = Integer.parseInt(num);
	
	Connection conn = null;
	Statement stmt = null; // 스테이트먼트
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	CallableStatement cstmt = null; // 콜에이블 스테이트먼트
	ResultSet rs = null;
	
	ResultSetMetaData rsmd = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");
		
		String sql = "DELETE FROM pin_member WHERE u_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, u_num);
		pstmt.executeUpdate();
		
		out.print("<script>alert('회원정보가 삭제되었습니다.'); location.href='memberList.jsp';</script>");
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
			cstmt.close();
			pstmt.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>