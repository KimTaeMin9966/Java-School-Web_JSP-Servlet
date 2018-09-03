<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<link  rel="stylesheet" href="css/community.css" />
<link rel="stylesheet" href="css/jquery.fancybox.css" />
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
	<article id="gallery">
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic1.jpg" title="포토 1">
				<img src="imgs/photos/pic1.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic2.jpg" title="포토 1">
				<img src="imgs/photos/pic2.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic3.jpg" title="포토 1">
				<img src="imgs/photos/pic3.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic4.jpg" title="포토 1">
				<img src="imgs/photos/pic4.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic5.jpg" title="포토 1">
				<img src="imgs/photos/pic5.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic6.jpg" title="포토 1">
				<img src="imgs/photos/pic6.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic7.jpg" title="포토 1">
				<img src="imgs/photos/pic7.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic8.jpg" title="포토 1">
				<img src="imgs/photos/pic8.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
		<figure>
			<a class="fancybox" data-fancybox-group="gallery" href="imgs/photos/pic9.jpg" title="포토 1">
				<img src="imgs/photos/pic9.jpg" />
				<figcaption>벚꽃과 새</figcaption>
			</a>
		</figure>
	</article>
	<div id="page">
		<ul class="paging">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
		</ul>
	</div>
	<div class="btn">
		<a href="photo_upload.jsp">사진 업로드</a>
	</div>
</article>
<script type="text/javascript" src="scripts/jquery.fancybox.pack.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".fancybox").fancybox({
			openEffect: 'none',
			closeEffect: 'none'
		});	
	});
</script>
<jsp:include page="footer.jsp"/>