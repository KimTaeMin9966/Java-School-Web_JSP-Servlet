<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- jdbc/OracleDB -->

<jsp:useBean id="testMember" class="vo.MemberVo" />
<jsp:setProperty property="*" name="testMember" />

<%
	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "INSERT INTO test_member VALUES(t_num.nextval, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, testMember.getId());
		pstmt.setString(2, testMember.getPass());
		pstmt.setString(3, testMember.getName());
		pstmt.setString(4, testMember.getAddr());
		pstmt.setString(5, testMember.getPhone());
		pstmt.executeUpdate();
		
		out.print("<script>alert('쿼리 성공'); location.href = 'index.jsp';</script");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'index.jsp?page=join';</script>");
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>