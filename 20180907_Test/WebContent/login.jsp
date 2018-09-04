<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>로그인</h1>
<form action="loginCheck.jsp" method="post">
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
			<td></td>
			<td><input type="checkbox" name="isSave" />로그인 상태 유지</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인" /></td>
		</tr>
	</table>
</form>