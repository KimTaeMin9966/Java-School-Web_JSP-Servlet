<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	Statement stmt = null; // 스테이트먼트
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	CallableStatement cstmt = null; // 콜에이블 스테이트먼트
	ResultSet rs = null;
	
	ResultSetMetaData rsmd = null;
	
	String num = request.getParameter("t_num");
	int t_num = Integer.parseInt(num);
	
	String t_id = "";
	String t_pass = "";
	String t_name = "";
	String t_addr = "";
	String t_phone = "";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "SELECT * FROM test_member WHERE t_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, t_num);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			t_id = rs.getString("t_id");
			t_pass = rs.getString("t_pass");
			t_name = rs.getString("t_name");
			t_addr = rs.getString("t_addr");
			t_phone = rs.getString("t_phone");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>alert('쿼리 실패'); location.href = 'index.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form action="updateSubmit.jsp" method="post">
		<input type="hidden" name="t_num" value="<%=t_num%>"/>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="t_id" value="<%=t_id %>" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="t_pass" value="<%=t_pass %>" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="t_name" value="<%=t_name %>" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="t_addr" value="<%=t_addr %>" /></td>
			</tr>
			<tr>
				<td>번호</td>
				<td><input type="text" name="t_phone" value="<%=t_phone %>" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정"/>
				</td>
			</tr>
		</table>
	</form>
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