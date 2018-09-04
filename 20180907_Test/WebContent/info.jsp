<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="VO.VOmember" scope="application" />
<table style="text-align: center;" align="center">
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty property="id" name="joinMember" /></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="joinMember" /></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><jsp:getProperty property="address" name="joinMember" /></td>
	</tr>
	<tr>
		<td>PHONE</td>
		<td><jsp:getProperty property="phoneNumber" name="joinMember" /></td>
	</tr>
</table>