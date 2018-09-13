<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
		border: 1px soild #CCC;
		width: 500px;
		margin: 50px auto;
	}
	table th, table td {
		border: 1px solid #333;
		text-align: center;
		height: 35px;
	}
	table td:nth-child(2) {
		text-align: left;
		padding-left: 10px;
	}
</style>
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
				<input type="button" onclick="javascript:location.href='main.bo'" value="메인으로" />
				<input type="button" onclick="javascript:location.href='update.mb'" value="정보수정" />
				<input type="button" onclick="javascript:location.href='withdraw.mb'" value="회원탈퇴" />
			</td>
		</tr>
	</table>
</body>
</html>