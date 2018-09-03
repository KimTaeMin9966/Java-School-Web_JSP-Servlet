<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/themes/default/default.css" />
<link rel="stylesheet" href="css/nivo-slider.css" />
	<div id="wrap">
	<jsp:include page="header.jsp" />
		<div class="clear"></div>
		<div class="slider-wrapper theme-default">
			<div id="slider" class="nivoSlider">
				<img src="imgs/slider1.jpg" width="943" height="400" />
				<img src="imgs/slider2.jpg" width="943" height="400" />
				<img src="imgs/slider3.jpg" width="943" height="400" />
				<img src="imgs/slider4.jpg" width="943" height="400" />
			</div>
		</div>
		<style type="text/css">
			#justar {
				margin: 0 0 0 20px;
				float: left;
				width: 200px;
			}
			#justar h3 {
				background: url("imgs/h3_under.jpg") no-repeat left bottom;
				padding: 0 0 8px 5px;
				font-weight: bold;
				font-size: 1.1em;
			}
			#justar figure {
				text-align: center;
				padding: 10px 0 0 0;
			}
		</style>
		<article>
			<div id="justar">
				<h3>Just arrived</h3>
				<figure>
					<img alt="" src="imgs/goods1.jpg" width="161" height="125">
				</figure>
			</div>
			<style>
				#notinews {
					width: 350px;
					float: left;
					margin-left: 80px;
				}
				ul.tabs {
					margin: 0;
					padding: 0;
					flat: left;
					list-style: none;
					height: 24px;
					border-left: 1px solid #999;
					border-bottom: 1px solid #999;
					width: 100%;				
				}
				ul.tabs li {
					float: left;
					margin: 0;
					padding: 0;
					height: 23px;
					line-height: 21px;
					border: 1px solid #999;
					border-left: none;
					background: #F6F6F6;
					overflow: hidden;
					position: relative;
					margin-bottom: -1px;
					outline: none;
				}
				ul.tabs li a {
					text-decoration: none;
					color: #000;
					display: block;
					padding: 0 20px;
				}
				ul.tabs li a:hover {
					background: #CCC;
				}
				.tab_container {
					border-top: none;
					clear: both;
					float: left;
					width: 300px;
					background: #FFF;
				}
				.tab_content {
					padding: 20px 10px;
					font-size: 1.1em;
				}
				.tab_content ul {
					list-style: none;
				}
				.tab_content ul li {
					line-height: 1.7em;
					padding-left: 10px;
					background: url("imgs/bullet.gif") no-repeat left 10px;
				}
				html ul.tabs li.active, html ul.tabs li.active a:hover {
					background: #FFF;
					border-bottom: 1px solid #FFF;
				}
			</style>
			<div id="notinews">
				<div class="conatiner">
					<ul class="tabs">
						<li><a href="#tab1">공지사항</a></li>
						<li><a href="#tab2">뉴스</a></li>
					</ul>
					<div class="tab_container">
						<div id="tab1" class="tab_content">
							<ul>
								<li><a href="#">공지사항입니다.</a></li>
								<li><a href="#">공지사항입니다.</a></li>
								<li><a href="#">공지사항입니다.</a></li>
								<li><a href="#">공지사항입니다.</a></li>
								<li><a href="#">공지사항입니다.</a></li>
							</ul>
						</div>
						<div id="tab2" class="tab_content">
							<ul>
								<li><a href="#">뉴스입니다.</a></li>
								<li><a href="#">뉴스입니다.</a></li>
								<li><a href="#">뉴스입니다.</a></li>
								<li><a href="#">뉴스입니다.</a></li>
								<li><a href="#">뉴스입니다.</a></li>
							</ul>
						</div>
					</div><!-- end tab_container -->
				</div><!-- end container -->
			</div><!-- end notinews -->
			<style type="text/css">
				#social {
					float: left;
					margin-left: 80px;
					width: 180px;
				}
				#social h3 {
					padding: 0 0 15px 0;
					font-weight: normal;
					font-size: 1.1em;
				}
				#social ul {
					list-style: none;
				}
				#social ul li {
					float: left;
					margin: 5px;
				}
				#social ul li img {
					width: 33px;
					height: 32px;
				}
			</style>
			<div id="social">
				<h3>Social Network</h3>
				<ul>
					<li><a href="#"><img src="imgs/icon1.png"/></a></li>
					<li><a href="#"><img src="imgs/icon2.png"/></a></li>
					<li><a href="#"><img src="imgs/icon3.png"/></a></li>
					<li><a href="#"><img src="imgs/icon4.png"/></a></li>
					<li><a href="#"><img src="imgs/icon5.png"/></a></li>
					<li><a href="#"><img src="imgs/icon6.png"/></a></li>
					<li><a href="#"><img src="imgs/icon7.png"/></a></li>
					<li><a href="#"><img src="imgs/icon8.png"/></a></li>
					<li><a href="#"><img src="imgs/icon9.png"/></a></li>
					<li><a href="#"><img src="imgs/icon10.png"/></a></li>
					<li><a href="#"><img src="imgs/icon11.png"/></a></li>
					<li><a href="#"><img src="imgs/icon12.png"/></a></li>
				</ul>
			</div>
		</article>
		<script type="text/javascript" src="scripts/jquery.nivo.slider.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#slider').nivoSlider();
				$('.tab_content').hide();
				$('ul.tabs li:first').addClass('active').show();
				$('.tab_content:first').show();
				$('ul.tabs li').click(function() {
					$('ul.tabs li').removeClass('active');
					$(this).addClass('active');
					$('.tab_content').hide();
					var tab = $(this).find('a').attr('href');
					$(tab).fadeIn();
					return false;
				});
			});
		</script>
		<div class="clear"></div>
		<jsp:include page="footer.jsp" />