<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	body {
		width: 900px;
		margin: auto;
	}
	header {
		board-bottom: 1px solid #ccc;
		overflow: hidden;
	}
	ul {
		list-style: none;
		float: right;
		height: 50px;
		line-height: 50px;
	}
	ul li {
		float: left;
		padding: 10px;
	}
	ul li a {
		text-decoration: none;
		color: #000;
	}
	ul li a:hover {
		cursor: pointer;
		color: #ccc;
	}
	div {
		overflow: hidden;
	}
</style>
<header>
	<div>
		<ul>
			<c:choose>
				<c:when test="${!empty member}">
					<li><a href="info.mb">${member.name}</a></li>
					<c:if test="${member.id eq 'admin'}"><li><a href="management.mb">회원관리</a></li></c:if>
					<li><a href="logOut.mb">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="login.mb">로그인</a></li>
					<li><a href="join.mb">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div>
		<ul>
			<li>공지사항</li>
			<li><a href="boardList.bo">질문과답변</a></li>
		</ul>
	</div>
</header>
