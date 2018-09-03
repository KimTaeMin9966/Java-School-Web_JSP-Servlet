<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/loginPage.css" />
<article>
	<div class="article_body">
		<form method="get" id="loginform" action="index.jsp" >
			<table class="login_table">
				<tr>
					<th colspan="3"><img src="imgs/logo.png" />로그인</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="user_id" name="user_id"  tabindex="1" /></td>
					<td rowspan=2><input type="button" id="login_submit" value="확인" tabindex="3" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="user_pass" name="user_pass"  tabindex="2" /></td>
				</tr>
			</table>
		</form>
	</div>
</article>
<script src="js/loginPage.js"></script>
<jsp:include page="footer.jsp" />