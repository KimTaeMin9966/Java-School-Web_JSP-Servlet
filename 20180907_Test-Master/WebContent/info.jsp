<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="vo.MemberVo" scope="application" />
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
			<td><jsp:getProperty property="id" name="joinMember" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty property="pass" name="joinMember" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="joinMember" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><jsp:getProperty property="addr" name="joinMember" /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><jsp:getProperty property="phone" name="joinMember" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="메인으로" /></td>
		</tr>
	</table>
</form>
