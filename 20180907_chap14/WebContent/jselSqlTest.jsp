<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>SQL LIB</h1>
	<sql:setDataSource var="con" driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@localhost:1521:ORCL" user="java" password="java" />
	
	<%-- <sql:update dataSource="${con}">
		INSERT INTO test_member VALUES('id007','pass7','최기근','부산','010444444')
	</sql:update> --%>
	
	<sql:update dataSource="${con}">
		UPDATE test_member SET addr ='서울' WHERE id = 'id007'
	</sql:update>
	
	<sql:query var="rs" dataSource="${con}">
		SELECT * FROM test_member
	</sql:query>
	
	<c:forEach var="data" items="${rs.rows}">
		<c:out value="${data['name']}" />
		<c:out value="${data['addr']}" />
		<c:out value="${data['phone']}" />
	</c:forEach>
</body>
</html>