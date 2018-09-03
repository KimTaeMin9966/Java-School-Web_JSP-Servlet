<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My HOMAGE</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}
	html {
		height: 100%;
	}
	body {
		font-size: 0.75em;
		color: #333;
		line-height: 1.2em;
		background: #E8E8E8;
		height: 100%;
	}
	#wrap {
		margin: 0 auto;
		background: #FFF;
		width: 944px;
		min-height: 100%;
	}
	a {
		text-decoration: none;
		color: #333;
	}
	a:hover {
		color: #39F;
	}
	#logo {
		float: left;
		background: url("imgs/logo.png") no-repeat left top;
		margin: 42px 0 0 15px;
		text-indent: -999px;
	}
	#logo a {
		width: 167px;
		height: 67px;
		display: block;
	}
	#hlink, nav {
		float: right;
	}
	#hlink ul, nav ul {
		list-style: none;
	}
	#hlink ul li, nav ul li {
		float: left;
	}
	#hlink {
		margin: 11px 28px 0 0;
	}
	#hlink ul li a {
		padding: 0 10px;
	}
	#hlink ul li {
		background: url("imgs/div_line.png") no-repeat center right;
	}
	#hlink ul li:last-child {
		background: none;
	}
	nav {
		margin: 42px 38px 0 0;
		height: 20px;
		clear: right;
		text-indent: -90000px;
		width: 480px;
	}
	nav ul li {
		background: url("imgs/div_line.png") no-repeat center right;
	}
	nav ul li:last-child {
		background: none;
	}
	nav ul li a {
		padding: 0;
		display: block;
		width: 118px;
		height: 20px;
	}
	nav ul li.n1 a {
		background: url("imgs/m1.png") no-repeat center top;
		transition: all 0.2s ease-in-out;
	}
	nav ul li.n2 a {
		background: url("imgs/m2.png") no-repeat center top;
		transition: all 0.2s ease-in-out;
	}
	nav ul li.n3 a {
		background: url("imgs/m3.png") no-repeat center top;
		transition: all 0.2s ease-in-out;
	}
	nav ul li.n4 a {
		background: url("imgs/m4.png") no-repeat center top;
		transition: all 0.2s ease-in-out;
	}
	nav ul li.n1 a:hover {
		background: url("imgs/m1.png") no-repeat center -23px;
	}
	nav ul li.n2 a:hover {
		background: url("imgs/m2.png") no-repeat center -23px;
	}
	nav ul li.n3 a:hover {
		background: url("imgs/m3.png") no-repeat center -23px;
	}
	nav ul li.n4 a:hover {
		background: url("imgs/m4.png") no-repeat center -23px;
	}
	.clear {
		clear: both;
	}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<div id="logo"><a href="index.jsp">HOME</a></div>
			<div id="hlink">
				<ul>
					<li><a href="loginPage.jsp">로그인</a></li>
					<li><a href="regPage.jsp">회원가입</a></li>
				</ul>
			</div>
			<nav>
				<ul>
					<li class="n1"><a href="company.jsp">회사소개</a></li>
					<li class="n2"><a href="product.jsp">재품정보</a></li>
					<li class="n3"><a href="community.jsp">커뮤니티</a></li>
					<li class="n4"><a href="customer.jsp">고객지원</a></li>
				</ul>
			</nav>
		</header>
		<div class="clear"></div>