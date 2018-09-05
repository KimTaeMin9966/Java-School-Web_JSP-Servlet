<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joinMember" class="VO.MemberVO" scope="application" />
<jsp:setProperty property="*" name="joinMember" />

id : <jsp:getProperty property="id" name="joinMember" />
pass : <jsp:getProperty property="pass" name="joinMember" />

<script>
	alert('회원가입 성공');
	location.href='login.jsp';
</script>