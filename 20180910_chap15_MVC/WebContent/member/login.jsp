<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h1>로그인</h1>
	<form action="memberLogin.mb" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="pass" />
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="checkbox" id="login" name="login" />
					<label for="login">로그인 상태 유지</label>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="로그인" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>