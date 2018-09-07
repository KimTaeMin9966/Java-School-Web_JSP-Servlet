<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	body {
		width: 900px;
		margin: auto;
	}
	header {
		height: 100px;
		border-bottom: 1px solid #ccc;
	}
	ul {
		list-style: none;
		float: right;
		height: 100px;
		line-height: 100px;
	}
	ul li {
		float: left;
		padding: 10px;
	}
	ul li a {
		text-decoration: none;
		color: #000;
	}
	ul li a:hover {
		color: #ccc;
		cursor: pointer;
	}
</style>
<%
	Cookie cookies[] = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					Context init = new InitialContext();
					DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
					con = ds.getConnection();
					String sql = "SELECT * FROM test_member WHERE id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, cookie.getValue());
					rs = pstmt.executeQuery();

					MemberVo m = new MemberVo();

					while (rs.next()) {
						m.setId(rs.getString("id"));
						m.setPass(rs.getString("pass"));
						m.setName(rs.getString("name"));
						m.setAddr(rs.getString("addr"));
						m.setPhone(rs.getString("phone"));
					}

					session.setAttribute("member", m);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	MemberVo m = (MemberVo) session.getAttribute("member");
%>
<header>
	<ul>
		<% if (m != null) { %>
			<li><a href="index.jsp?page=info"><%=m.getName()%></a>님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
		<% } else { %>
			<li><a href="index.jsp?page=login">로그인</a></li>
			<li><a href="index.jsp?page=join">회원가입</a></li>
		<% } %>
	</ul>
</header>