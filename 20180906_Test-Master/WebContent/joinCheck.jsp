<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="joinMember" class="vo.MemberVo" />
<jsp:setProperty property="*" name="joinMember" />

<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		String sql = "INSERT INTO test_member VALUES(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		
		int result = pstmt.executeUpdate();
		
		out.print("<script>");
		if (result != 0) {
			out.print("alert('회원가입 성공');");
			out.print("location.href=index.jsp?page=login");
		} else {
			out.print("alert('회원가입 실패');");
			out.print("location.href=index.jsp?page=join");
		}
		out.print("</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>");
		out.print("alert('회원가입 실패');");
		out.print("location.href=index.jsp?page=join");
		out.print("</script>");
	} finally {
		pstmt.close();
		conn.close();
	}
%>
<script>
	alert("회원가입 완료!");
	location.href = "index.jsp?page=login";
</script>