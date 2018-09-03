<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>1-3</title>
<link rel="stylesheet" href="css/join.css" />
</head>
<body>
	<table>
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
		<tr id="pa">
			<td><label>아이디</label></td>
			<td><input type="text" id="inID" /></td>
		</tr>
		<tr id="pa">
			<td><label>비밀번호</label></td>
			<td><input type="password" id="inPW" /></td>
		</tr>
		<tr id="pa">
			<td><label>비밀번호 확인</label></td>
			<td><input type="password" id="inPW2" /></td>
		</tr>
		<tr id="pa">
			<td><label>생년월일</label></td>
			<td><input type="text" id="inBR" /></td>
		</tr>
		<tr id="pa">
			<td><label>이름</label></td>
			<td><input type="text" id="inNM" /></td>
		</tr>
		<tr id="pa">
			<td><label>전화번호</label></td>
			<td><input type="text" id="inPN" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="회원가입" id="reg" />
				<input type="button" value="정보수정" id="edit" />
			</td>
		</tr>
	</table>
	<script src="js/join.js"></script>
</body>
</html>