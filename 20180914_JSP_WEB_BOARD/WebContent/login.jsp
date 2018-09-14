<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="header.jsp" />
		<div id="login-from">
			<form action="loginSubmit.mb" method="post">
				<table id="login-from-data">
					<tr>
						<td>아이디 : </td>
						<td><input type="text" name="id" /></td>
					</tr>
					<tr>
						<td>패스워드 : </td>
						<td><input type="password" name="pass" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" id="login" name="login" />
							<label for="login">로그인 상태 유지</label><br/>
							<input type="submit" value="로그인" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>