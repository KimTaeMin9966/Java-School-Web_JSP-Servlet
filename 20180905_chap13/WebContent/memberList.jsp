<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	Boolean connect = false;
	
	Statement stmt = null; //스테이트먼트
	ResultSet rs = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
		connect = true;
		
		stmt = conn.createStatement();
		String sql = "SELECT * FROM member ORDER BY num DESC";
		
		rs = stmt.executeQuery(sql);
		out.print("<h3>검색 완료</h3>");
	} catch(Exception e) {
		connect = false;
		out.print("<h3>검색 실패</h3>");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="center" colspan=3>회원정보</td>
		</tr>
		<tr>
			<td align="center">번호</td>
			<td align="center">이름</td>
			<td align="center">주소</td>
		</tr>
		<%
		while(rs.next()) {
			int num = rs.getInt(1);
			String name = rs.getString(2);
			String addr = rs.getString(3);
		%>
			<tr>
				<td><%=num %></td>
				<td><%=name %></td>
				<td><%=addr %></td>
			</tr>
		<%} %>
		<%
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</body>
</html>