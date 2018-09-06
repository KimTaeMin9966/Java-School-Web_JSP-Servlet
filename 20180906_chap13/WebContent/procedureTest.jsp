<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");

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
		
		String sql = "{call get_name(?, ?)}";
		cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, 2);
		cstmt.registerOutParameter(2, Types.VARCHAR);
		cstmt.execute();
		
		String name = cstmt.getString(2);
		out.print("<h1>" + name + "</h1>");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('삭제실패');location.href='index.jsp';</script>");
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