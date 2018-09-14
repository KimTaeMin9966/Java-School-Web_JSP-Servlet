<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/aside.css">
<div id="webInfo-data">
	<ul id="webInfo-data-Info">
		<li>
			<div class="webInfo-data-memberID">
				<c:choose>
					<c:when test="${!empty member}">
						<a href="#">${member.name}</a>
					</c:when>
					<c:otherwise>
						<a href="#">로그인시 확인 가능</a>
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li>
			<div class="webInfo-data-since">
				since 2018.09.14.
			</div>
			<div class="webInfo-data-board-Info">
				<a href="boardInfo.info">웹보드소개</a>
			</div>
		</li>
		<li id="webInfo-data-add">
			<div id="webInfo-data-add1">
				<a href="#">기능 추가중</a>
			</div>
			<div id="webInfo-data-add2">
				<a href="#">기능 추가중</a>
			</div>
		</li>
	</ul>
</div>