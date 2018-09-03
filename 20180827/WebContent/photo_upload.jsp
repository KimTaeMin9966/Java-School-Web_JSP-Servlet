<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/community.css"/>
<h1 id="community"><div>COMMUNITY</div></h1>

<aside>
	<h3><div>커뮤니티</div></h3>
	<ul>
		<li><a href="community.jsp">포토갤러리</a></li>
		<li><a href="#">자유게시판</a></li>
		<li><a href="#">제품토론장</a></li>
		<li><a href="#">유저사용후기</a></li>
	</ul>
</aside>
<article>
	<h2>포토 갤러리</h2>
	<form id="upphoto" action="" method="post">
		<div id="photoframe">
			<img id="imgBG" src="imgs/upphoto.gif" class="photoplace"/>
		</div>
		<p>
			<label>제목</label>
			<input type="text" />
		</p>
		<p>
			<label>사진설명</label>
			<textarea></textarea>
		</p>
		<input type="submit" value="전송하기" />
	</form>
</article>
<script src="scripts/dnd.js"></script>
<jsp:include page="footer.jsp" />