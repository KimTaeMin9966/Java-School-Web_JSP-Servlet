<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>2-1</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<table>
		<tr>
			<th colspan="3">로그인</th>
		</tr>
		<tr>
			<td><label>아이디</label></td>
			<td><input type="text" id="inID" tabindex="1" /></td>
			<td></td>
		</tr>
		<tr>
			<td><label>패스워드</label></td>
			<td><input type="password" id="inPW" tabindex="2" /></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="로그인" id="login" />
				<input type="button" value="회원가입" id="reg" />
			</td>
			<td></td>
		</tr>
	</table>
	<script src="js/index.js"></script>
</body>
</html>