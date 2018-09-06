<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!-- jdbc/OracleDB -->

<jsp:useBean id="loginMember" class="vo.PinMemberVO"/>
<jsp:setProperty property="*" name="loginMember"/>

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

		String sql ="SELECT u_pass FROM pin_member WHERE u_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginMember.getU_id());
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			if(rs.getString("u_pass").equals(loginMember.getU_pass())) {
				session.setAttribute("id", loginMember.getU_id());
				out.print("<script>alert('로그인 성공'); location.href = 'index.jsp';</script>");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('로그인 실패'); location.href = 'login.jsp';</script>");
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