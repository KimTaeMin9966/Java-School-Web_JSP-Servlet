<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>1-3</title>
</head>
<body>
	<table>
		<tr>
			<th colspan="2">회원정보수정</th>
		</tr>
		<tr>
			<td><label>아이디</label></td>
			<td><input type="text" value="aaa" readonly style="background: #CCC;" /></td>
		</tr>
		<tr>
			<td><label>비밀번호</label></td>
			<td><input type="password" /></td>
		</tr>
		<tr>
			<td><label>비밀번호 확인</label></td>
			<td><input type="password" /></td>
		</tr>
		<tr>
			<td><label>생년월일</label></td>
			<td><input type="text" /></td>
		</tr>
		<tr>
			<td><label>이름</label></td>
			<td><input type="text" /></td>
		</tr>
		<tr>
			<td><label>전화번호</label></td>
			<td><input type="text" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="로그인" />
				<input type="button" value="정보수정" />
			</td>
		</tr>
	</table>
	<script src="js/edit.js"></script>
</body>
</html>