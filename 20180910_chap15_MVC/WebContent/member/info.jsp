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
	<h1>회원정보</h1>
	<table>
		<tr>
			<td>아이디</td>
			<td>${member.id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.name}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${member.addr}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${member.phone}</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" onclick="javascript:location.href='main.bo'" value="메인으로"/>
			</td>
		</tr>
	</table>
</body>
</html>