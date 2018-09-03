<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="css/loginPage.css" />
<article>
	<form id="loginPage" method="GET" action="index.jsp">
		<table id="loginPage_M">
			<tr>
				<td></td>
				<td>
					<img alt="" src="imgs/logo.png">
					<h3>로그인</h3>
				</td>
			</tr>
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" id="logId" /></td>
				<td><input type="button" value="로그인" id="log" /></td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="password" id="logPw" /></td>
			</tr>
		</table>
	</form>
</article>
<script src="js/loginPage.js"></script>
<jsp:include page="footer.jsp"/>