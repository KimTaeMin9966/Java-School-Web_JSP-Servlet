<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/regPage-.css">
<title>Sign Up</title>
</head>
<body>
	<table width="940">
		<form name="write_form_member" method="post">
			<tr height="2" bgcolor="#ffc8c3"><td></td></tr>
			<tr height="327px">
				<td colspan="2" align="left" valign="top" style="">
					<!---------------------내용시작------------------>
					<table width="780">
						<tr></tr>
						<tr>
							<td>
								<!--테이블 시작 -->
								<table width="940" style="padding: 5px 0 5px 0;">
									<tr>
										<th>이름</th>
										<td><input type="text" name="mbname"></td>
									</tr>
									<tr>
										<th>주민등록번호</th>
										<td>
										<input type="text" name="jumin_1"> - <input type="password" name="jumin_2"></td>
									</tr>
									<tr>
										<th>아이디</th>
										<td><input type="text" name="mbid"><a href='#' style='cursor: pointer'></a> (영문/숫자 10~12자)</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="mbpw"> 영문/숫자포함 6자 이상</td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td><input type="password" name="mbpw_re"></td>
									</tr>
									<tr>
										<th>비밀번호 힌트 답변</th>
										<td><select name='pwhint' size='1' class='select'>
												<option value=''>선택하세요</option>
												<option value='30'>졸업한 초등학교 이름은?</option>
												<option value='31'>제일 친한 친구의 핸드폰 번호는?</option>
												<option value='32'>아버지 성함은?</option>
												<option value='33'>어머니 성함은?</option>
												<option value='34'>어릴 적 내 별명은?</option>
												<option value='35'>가장 아끼는 물건은?</option>
												<option value='36'>좋아하는 동물은?</option>
												<option value='37'>좋아하는 색깔은?</option>
												<option value='38'>좋아하는 음식은?</option>
										</select></td>
									</tr>
									<tr>
										<th>답변</th>
										<td><input type='text' name="pwhintans"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" name="email"> @ <input type="text" name="email_dns">
										<select name="emailaddr">
												<option value="">직접입력</option>
												<option value="daum.net">daum.net</option>
												<option value="empal.com">empal.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="msn.com">msn.com</option>
												<option value="naver.com">naver.com</option>
												<option value="nate.com">nate.com</option>
										</select></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input type="text" name="zip_h_1"> - <input type="text" name="zip_h_2">
											<a href='#' style='cursor: hand;'></a><br/>
											<input type="text" name="addr_h1"><br/>
											<input type="text" name="addr_h1">
										</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>
											<input type="text" name="cel1">
											 - 
											<input type="text" name="cel2_1" title="전화번호">
											 - 
											<input type="text" name="cel2_2">
										</td>
									</tr>
									<tr>
										<th>핸드폰 번호</th>
										<td><input type="text" name="tel_h1">
										 - 
										<input type="text" name="tel_h2_1">
										 - 
										<input type="text" name="tel_h2_2"></td>
									</tr>
									<tr>
										<th>직업</th>
										<td><input tyle='hidden' name='job_attri_val_key'>
											<select name="job" size="1">
												<option value=''>선택하세요</option>
												<option value='39'>학생</option>
												<option value='40'>컴퓨터/인터넷</option>
												<option value='41'>언론</option>
												<option value='42'>공무원</option>
												<option value='43'>군인</option>
												<option value='44'>서비스업</option>
												<option value='45'>교육</option>
												<option value='46'>금융/증권/보험업</option>
												<option value='47'>유통업</option>
												<option value='48'>예술</option>
												<option value='49'>의료</option>
										</select></td>
									</tr>
									<tr>
										<th>메일/SNS 정보수신</th>
										<td class="s">
											<input type="radio" name="chk_mail" checked>수신
											<input type="radio" name="chk_mail" value="4">수신거부
										</td>
									</tr>
									<tr>
										<th>관심분야</th>
										<td><input type="checkbox" name="interest[]" value="17">생두
											<input type="checkbox" name="interest[]" value="18">원두
											<input type="checkbox" name="interest[]" value="19">로스팅
											<input type="checkbox" name="interest[]" value="20">핸드드립
											<input type="checkbox" name="interest[]" value="21">에스프레소
											<input type="checkbox" name="interest[]" value="22">창업
										</td>
									</tr>
									<tr>
										<th>가입경로</th>
										<td><select name="location" size="1">
												<option value="">선택하세요</option>
												<option value="23">네이버검색</option>
												<option value="24">다음검색</option>
												<option value="25">기타검색엔진</option>
												<option value="26">카페or동호회를 통해</option>
												<option value="27">지인의소개</option>
												<option value="28">기타</option>
										</select></td>
									</tr>
									<tr>
										<th>정보공개여부</th>
										<td><select name="chk_open" size='0'>
												<option value="">선택하세요</option>
												<option value="5">모두공개</option>
												<option value="6">비공개</option>
												<option value="7">1단계공개</option>
												<option value="8">2단계공개</option>
										</select></td>
									</tr>
								</table> <!--테이블 끝-->
							</td>
						</tr>
						<tr height="2" bgcolor="#ffc8c3"><td></td></tr>
						<tr>
							<td colspan="2" align="center">
								<div id="member_button">
									<a href="#">가입</a>
									<a href="index.jsp">취소</a>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>