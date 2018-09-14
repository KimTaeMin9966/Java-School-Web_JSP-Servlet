<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/meunBar.css">
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="#">기능 추가중</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="#">기능 추가중</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="#">기능 추가중</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="#">기능 추가중</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="#">기능 추가중</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="listShow.bo">글 목록 보기</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="write.bo">글 쓰기</a>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<c:if test="${member.id eq 'admin'}">
				<a href="management.mb">회원관리</a>
			</c:if>
			<c:if test="${member.id ne 'admin'}">
				<a href="myInfoedit.mb">정보수정</a>
			</c:if>
		</c:when>
		<c:otherwise>
			<a href="#" style="color: RED;">사용불가</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="myInfo.mb">${member.name}</a>
		</c:when>
		<c:otherwise>
			<a href="login.mb">로그인</a>
		</c:otherwise>
	</c:choose>
</div>
<div id="menu-bar">
	<c:choose>
		<c:when test="${!empty member}">
			<a href="logOut.mb">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="join.mb">회원가입</a>
		</c:otherwise>
	</c:choose>
</div>