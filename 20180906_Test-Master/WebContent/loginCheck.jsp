<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");

	Connection con = null;
	CallableStatement cs = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		
		String sql = "{call is_login(?, ?, ?)}";
		cs = con.prepareCall(sql);
		cs.setString(1, id);
		cs.setString(2, pass);
		cs.registerOutParameter(3, Types.INTEGER);
		cs.execute();

		if (cs.getInt(3) > 0) {
			sql = "SELECT * FROM test_member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			MemberVo m = new MemberVo();
			while (rs.next()) {
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				m.setPhone(rs.getString("phone"));
			}

			if (login != null) {
				Cookie cookie = new Cookie("id", id);
				cookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cookie);
			}

			session.setAttribute("member", m);
			
			out.print("<script>");
			out.print("alert('로그인 성공');");
			out.print("location.href='index.jsp'");
			out.print("</script>");

			rs.close();
			pstmt.close();
		} else {
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("location.href='index.jsp?page=login'");
			out.print("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<script>");
		out.print("alert('로그인 실패');");
		out.print("location.href='index.jsp?page=login'");
		out.print("</script>");
	} finally {
		cs.close();
		con.close();
	}
%>



