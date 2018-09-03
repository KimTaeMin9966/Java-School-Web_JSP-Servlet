<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}else{
		id="세션값 없음";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function test(str){
		window.location.href=str;
	}
</script>
</head>
<body>
	<h2><%= id %></h2>
	<h2>test</h2>
	<input type="button" onclick="test('sessionSet.jsp');" value="세션저장"/><br/>
	<input type="button" onclick="test('sessionDel.jsp');" value="세션삭제"/><br/>
	<input type="button" onclick="test('sessionInit.jsp');" value="세션초기화"/><br/>	
</body>
</html>