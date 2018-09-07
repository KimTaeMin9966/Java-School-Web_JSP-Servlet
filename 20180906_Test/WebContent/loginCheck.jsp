<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- jdbc/OracleDB -->
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "SELECT t_pass FROM test_member WHERE t_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString("t_pass").equals(pass)) {
				session.setAttribute("id", id);
				out.print("<script>alert('로그인 성공'); location.href = 'index.jsp';</script>");
			}
		}
		out.print("<script>alert('로그인 실패'); location.href = 'index.jsp';</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'index.jsp';</script>");
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>