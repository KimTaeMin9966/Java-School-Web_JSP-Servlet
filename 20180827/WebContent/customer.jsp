<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="css/customer.css" />
<h1 id="customer"><div>CUSTOMER CENTER</div></h1>
<aside>
	<h3><div>고객지원센터</div></h3>
	<ul>
		<li><a href="customer.jsp">고객상담게시판</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">새로운 뉴스</a></li>
	</ul>
</aside>
<article>
	<h2>고객상담게시판</h2>
	<article id="list">
		<table id="ALL">
			<tr id="title">
				<td>번호</td>
				<td>제목</td>
				<td>게시일</td>
				<td>게시자</td>
				<td>조회수</td>
			</tr>
			<tr id="pa">
				<td>100</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>101</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>102</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>103</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>104</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>105</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>106</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>107</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>108</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
			<tr id="pa">
				<td>109</td>
				<td><a href="#">qwertyuiop</a></td>
				<td>2018.08.28</td>
				<td>김태민</td>
				<td>100</td>
			</tr>
		</table>
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
		<input type="text" id="IS" />
		<a href="#" id="S">검색</a>
		<a href="#" id="M">문의하기</a>
	</div>
</article>
<jsp:include page="footer.jsp"/>