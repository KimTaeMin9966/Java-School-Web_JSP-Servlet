<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joinMember" class="VO.VOmember" scope="application" />
<jsp:setProperty property="*" name="joinMember" />

<script>
	alert('회원가입 성공');
	location.href='index.jsp?page=login';
</script>