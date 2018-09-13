<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>JSP Web Board</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="header.jsp" />
		<header id="Info">
			<ul>
				<li class="webInfo">
					<a href="#">webInfo</a>
				</li>
				<li class="myInfo">
					<a href="#">myInfo</a>
				</li>
				<li>
					<jsp:include page="meunBar.jsp" />
				</li>
			</ul>
		</header>
		<nav>
			<jsp:include page="aside.jsp" />
			<jsp:include page="webContent.jsp" />
		</nav>
	</div>
</body>
</html>