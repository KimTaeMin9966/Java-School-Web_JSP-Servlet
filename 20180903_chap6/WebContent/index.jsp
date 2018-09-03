<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageSelect = request.getParameter("page");
	if(pageSelect == null){pageSelect = "new";}/* else{
		if(pageSelect.equals("newItem")){
			pageSelect = "new";
		}else{
			pageSelect = "best";
		}		
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin:auto;
		width:900px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan=3 height=150>
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="aside.jsp" />
			</td>
			<td colspan =2>
				<jsp:include page='<%=pageSelect+".jsp"%>' />
			</td>
		</tr>
		<tr>
			<td colspan=3 height=150>
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
		
	</table>

</body>
</html>