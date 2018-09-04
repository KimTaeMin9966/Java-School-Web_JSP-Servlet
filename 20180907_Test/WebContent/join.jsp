<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원가입</h1>
<form action="joinCheck.jsp" method="post">
	<table style="text-align: center;" align="center">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pass" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phoneNumber" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인" /></td>
		</tr>
	</table>
</form>