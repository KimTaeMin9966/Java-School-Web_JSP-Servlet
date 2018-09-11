<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<form action="boardUpdateSubmit.bo" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${boardVo.board_num}" />
		<table>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="board_name" value="${boardVo.board_name}" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="board_pass" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" value="${boardVo.board_title}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="board_content" rows="10" cols="40">${boardVo.board_content}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="text" value="${boardVo.board_file}" readonly/>
					<input type="file" name="board_file" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료"/>
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>