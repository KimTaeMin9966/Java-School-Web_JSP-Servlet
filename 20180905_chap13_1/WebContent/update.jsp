<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!-- jdbc/OracleDB -->
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("b_num");
	int num = Integer.parseInt(number);
	
	Connection conn = null;
	PreparedStatement pstmt = null; // 프리페어드 스테이트먼트
	ResultSet rs = null;
	
	ResultSetMetaData rsmd = null;
	
	String auth = "";
	String content = "";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");

		String sql = "SELECT * FROM board WHERE b_num = ?"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auth = rs.getString("b_auth");
			content = rs.getString("b_context");
		}
	}catch(Exception e){
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
	<form action="updateSubmit.jsp" method="post">
		<input type="hidden" name="b_num" value="<%=num%>"/>
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_auth" value="<%=auth%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="b_content" style="width: 300px; height: 300px;"><%=content%></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정완료" /></td>
			</tr>
		</table>
	</form>
	<%
		try {
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>