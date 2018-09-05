<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	int number = 0;
	if(num != null) {
		number = Integer.parseInt(num);
	}
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
		String sql = "DELETE FROM member WHERE num=" + number;
		
		stmt.executeUpdate(sql);
		out.print("<h3>삭제 완료</h3>");
	} catch(Exception e) {
		connect = false;
		out.print("<h3>삭제 실패</h3>");
		e.printStackTrace();
	} finally {
		try {
			stmt.close();
			conn.close();
			out.print("<script>location.href = 'memberList.jsp';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>