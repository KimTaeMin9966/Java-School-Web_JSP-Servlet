<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- jdbc/OracleDB -->

<jsp:useBean id="infoMember" class="vo.MemberVo"/> 
<jsp:setProperty property="*" name="infoMember"/>

<%
	String id = request.getParameter("id");
	
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
		
		String sql = "SELECT * FROM test_member WHERE t_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'index.jsp';</script>");
	}
%>
<h1>Info</h1>
<style>
	table {
		text-align: center;
		margin: 0 auto;
	}
	table tr {
		height: 40px;
	}
</style>
<form action="index.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
			<td colspan=2>비고</td>
		</tr>
		<% while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("t_id") %></td>
				<td><%=rs.getString("t_pass") %></td>
				<td><%=rs.getString("t_name") %></td>
				<td><%=rs.getString("t_addr") %></td>
				<td><%=rs.getString("t_phone") %></td>
				<td><a href="update.jsp?t_num=<%=rs.getInt("t_num")%>">수정</a></td>
				<td><a href="delete.jsp?t_num=<%=rs.getInt("t_num")%>">삭제</a></td>
			</tr>
		<% } %>
	</table>
</form>
