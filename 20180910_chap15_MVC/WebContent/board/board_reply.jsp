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
	게시물 번호 : ${boardVo.board_num}
	답변 참조 번호 : ${boardVo.board_re_ref}
	답변 레벨 : ${boardVo.board_re_lev}
	답변 순서 : ${boardVo.board_re_seq}
	<h1>게시판 답변 글 작성</h1>
	<form action="boardReplySubmit.bo" method="post">
		<input type="hidden" name="board_num" value="${boardVo.board_num}" />
		<input type="hidden" name="board_re_ref" value="${boardVo.board_re_ref}" />
		<input type="hidden" name="board_re_lev" value="${boardVo.board_re_lev}" />
		<input type="hidden" name="board_re_seq" value="${boardVo.board_re_seq}" />
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_name" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="board_pass" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="board_content" rows="10" cols="40"></textarea></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="수정완료"/>
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>