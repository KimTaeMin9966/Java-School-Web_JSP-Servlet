<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/info.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="header.jsp" />
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
				<td colspan=2>
					<input type="button" onclick="javascript:location.href='main.bo'" value="메인으로" />
					<input type="button" onclick="javascript:location.href='myInfoedit.mb'" value="정보수정" />
					<input type="button" onclick="javascript:location.href='myInfodelete.mb'" value="회원탈퇴" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>