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
	
	String num = request.getParameter("u_num");
	int u_num = Integer.parseInt(num);
	
	String u_id = "";
	String u_pass = "";
	int u_age = 0;
	String u_gender = "";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");
		
		String sql = "SELECT * FROM pin_member WHERE u_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, u_num);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			u_id = rs.getString("u_id");
			u_pass = rs.getString("u_pass");
			u_age = rs.getInt("u_age");
			u_gender = rs.getString("u_gender");
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
		<input type="hidden" name="u_num" value="<%=u_num%>"/>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id" value="<%=u_id %>" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pass" value="<%=u_pass %>" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="u_age" value="<%=u_age %>" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<% if(u_gender.equals("male")) { %>
						<input type="radio" name="u_gender" id="male" value="male" checked />
						<label for="male">남성</label>
						<input type="radio" name="u_gender" id="female" value="female"/>
						<label for="female">여성</label>
					<% } else { %>
						<input type="radio" name="u_gender" id="male" value="male" />
						<label for="male">남성</label>
						<input type="radio" name="u_gender" id="female" value="female" checked />
						<label for="female">여성</label>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입"/> | 
					<input type="button" onclick="directLogin();" value="로그인" />
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