<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/join.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="header.jsp" />
		<div id="join-from">
			<form action="joinSubmit.mb" method="post">
				<table id="join-from-data">
					<tr>
						<td>아이디 : </td>
						<td><input type="text" name="id" /></td>
					</tr>
					<tr>
						<td>패스워드 : </td>
						<td><input type="password" name="pass1" /></td>
					</tr>
					<tr>
						<td>패스워드 확인 : </td>
						<td><input type="password" name="pass2" /></td>
					</tr>
					<tr>
						<td>이름 : </td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>주소 : </td>
						<td><input type="text" name="addr" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" />
							<input type="reset" value="다시작성" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>