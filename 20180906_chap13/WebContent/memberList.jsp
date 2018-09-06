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

		String sql = "SELECT ROWNUM AS r, pin.* FROM (SELECT * FROM pin_member ORDER BY u_num) pin ORDER BY r DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('잘못된 요청입니다.'); location.href = 'index.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원목록</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>나이</td>
			<td>성별</td>
			<td colspan=2>비고</td>
		</tr>
		<% while(rs.next()) { %>
			<tr>
				<td><%=rs.getInt("r") %></td>
				<td><%=rs.getString("u_id") %></td>
				<td><%=rs.getInt("u_age") %></td>
				<td><%=rs.getString("u_gender") %></td>
				<td><a href="update.jsp?u_num=<%=rs.getInt("u_num")%>">수정</a></td>
				<td><a href="delete.jsp?u_num=<%=rs.getInt("u_num")%>">삭제</a></td>
			</tr>
		<% } %>
	</table>
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