<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("b_num");
	String auth = request.getParameter("b_auth");
	String content = request.getParameter("b_content");
	int num = Integer.parseInt(number);

	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	ResultSet rs = null;
	
	ResultSetMetaData rsmd = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");

		String sql = "UPDATE board SET b_auth = ?, b_context = ? WHERE b_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, auth);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);
		
		int result = pstmt.executeUpdate();

		if(result != 0) {
			out.print("<script>alert('수정완료');location.href='index.jsp';</script");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('수정실패');location.href='index.jsp';</script>");
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