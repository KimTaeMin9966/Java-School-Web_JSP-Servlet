<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!-- jdbc/OracleDB -->

<jsp:useBean id="updateMember" class="vo.PinMemberVO" />
<jsp:setProperty property="*" name="updateMember"/>

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
		
		String sql = "UPDATE pin_member SET u_id = ?, u_pass = ?, u_age = ?, u_gender = ? WHERE u_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, updateMember.getU_id());
		pstmt.setString(2, updateMember.getU_pass());
		pstmt.setInt(3, updateMember.getU_age());
		pstmt.setString(4, updateMember.getU_gender());
		pstmt.setInt(5, updateMember.getU_num());
		
		int result = pstmt.executeUpdate();
		
		if(result != 0) {
			out.print("<script>alert('쿼리 성공'); location.href = 'memberList.jsp';</script");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'memberList.jsp';</script>");
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