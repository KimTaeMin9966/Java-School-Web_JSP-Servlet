<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 내용 상세보기</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td>${boardVo.board_name}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${boardVo.board_title}</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>${boardVo.board_content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>${boardVo.board_file}</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="boardReplyForm.bo?board_num=${boardVo.board_num}">[답변]</a>
				<a href="boardUpdateForm.bo?board_num=${boardVo.board_num}">[수정]</a>
				<a href="boardDeleteForm.bo?board_num=${boardVo.board_num}">[삭제]</a>
				<a href="boardList.bo">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>