<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="board/css/board_write.css">
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="../header.jsp" />
		<form action="boardWriteSubmit.bo" method="post">
			<table id="webBoard-datas">
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="board_name" required="required" />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="board_pass" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="board_title" />
					</td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea name="board_content" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr id="button">
					<td colspan="2">
						<input type="submit" value="확인" />
						<input type="reset" value="다시쓰기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>