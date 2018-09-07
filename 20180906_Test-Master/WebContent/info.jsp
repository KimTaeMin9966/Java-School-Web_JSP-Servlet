<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.MemberVo"%>
<% MemberVo m = (MemberVo) session.getAttribute("member"); %>
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
			<td><%= m.getId() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= m.getPass() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= m.getName()%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=m.getAddr() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%= m.getPhone() %></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="메인으로" /></td>
		</tr>
	</table>
</form>
