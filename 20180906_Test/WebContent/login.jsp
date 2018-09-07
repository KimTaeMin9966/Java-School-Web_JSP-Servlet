<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>login</h1>
<style>
	table {
		text-align: center;
		margin: 0 auto;
	}
	table tr {
		height: 30px;
	}
</style>
<form action="loginCheck.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pass" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="checkbox" id="login" name="login" value="login" />
				&nbsp;
				<label for="login">로그인 상태 유지</label>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인" /></td>
		</tr>
	</table>
</form>