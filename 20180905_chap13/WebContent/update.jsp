<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String num= request.getParameter("num");
	String name= request.getParameter("name");
	String addr= request.getParameter("addr");
	
	int number = Integer.parseInt(num);
	Connection conn = null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	Boolean connect = false;
	
	Statement stmt = null; //스테이트먼트
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
		connect = true;
		
		stmt = conn.createStatement();
		String sql = "UPDATE member SET name='" + name + "',addr='" + addr + "' WHERE num=" + number;
		
		int result = stmt.executeUpdate(sql);
		if(result != 0) {
			out.print("<h3>수정 완료</h3>");
		}
	} catch(Exception e) {
		connect = false;
		out.print("<h3>수정 실패</h3>");
		e.printStackTrace();
	} finally {
		try {
			stmt.close();
			conn.close();
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