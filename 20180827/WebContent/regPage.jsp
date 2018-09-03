<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/regPage.css" />
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<article>
	<form id="adm_form" method="GET" action="index.jsp">
		<div class="req_table_wrap">
			<div class="req_table_title">회원가입</div>
			<table class="req_table">
				<tr>
					<td>아이디</td>
					<td class="td_divider"></td>
					<td>
						<input type="text" id="adm_email_1" class="adm_email_1" />
						@
						<input type="text" id="adm_email_2" class="adm_email_2" />
						<select id="select_mail" class="select_mail">
							<option value="" selected="selected">직접입력</option>
							<option value="paran.com">paran.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hitel.net">hitel.net</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="naver.com">naver.com</option>
							<option value="netian.com">netian.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="chollian.net">chollian.net</option>
							<option value="orgio.net">orgio.net</option>
							<option value="korea.com">korea.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="unitel.co.kr">unitel.co.kr</option>
							<option value="nate.com">nate.com</option>
							<option value="empal.com">empal.com</option>
							<option value="nownuri.net">nownuri.net</option>
							<option value="hanafos.com">hanafos.com</option>
							<option value="kornet.net">kornet.net</option>
						</select>
					<div class="adm_result_text" id="adm_email_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td class="td_divider"></td>
					<td>
					<input type="password" id="adm_pass" class="adm_pass" />
					<div id="adm_pass_text" class="adm_result_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td class="td_divider"></td>
					<td>
					<input type="password" id="adm_pass2" class="adm_pass" />
					<div id="adm_pass_text_2" class="adm_result_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>성명</td>
					<td class="td_divider"></td>
					<td>
					<input type="text" id="adm_name" class="adm_name" />
					<div id="adm_name_text" class="adm_result_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td class="td_divider"></td>
					<td>
					<input type="text" id="adm_birth" class="adm_birth" placeholder="ex)890808" />
					<div id="adm_birth_text" class="adm_result_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td class="td_divider"></td>
					<td><input type="radio" name="adm_gender" id="male" value="male" checked />
					<label for="male"><span class="adm_sub_text">남자</span></label>
					<input type="radio" name="adm_gender" id="female" value="female" />
					<label for="female"><span class="adm_sub_text">여자</span></label>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td class="td_divider"></td>
					<td>
						<select id="adm_mobile_1" class="adm_mobile_1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="051">051</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="070">070</option>
						</select>
					<input type="text" id="adm_mobile_2" class="adm_mobile_2" />
					<input type="text" id="adm_mobile_3" class="adm_mobile_3" />
					<div class="adm_result_text" id="adm_mobile_text"></div>
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
				<tr class="address">
					<td>주소</td>
					<td class="td_divider"></td>
					<td>
					<input type="text" class="postcodify_postcode5" id="adm_address_1" placeholder="우편번호" />
					<input type="button" id="postcodify_search_button" class="postcodify_search_button" value="주소검색" />
					<br/>
					<br/>
					<input type="text" class="postcodify_address" id="adm_address_2" placeholder="주소" />
					<input type="text" class="postcodify_extra_info" id="adm_address_3" placeholder="상세주소" />
				</td>
				</tr>
				<tr class="tr_divider">
					<td colspan=3 class="tr_td_divider"></td>
				</tr>
			</table>
		</div>
		<div class="req_table_wrap">
			<table class="req_table">
				<tr>
					<th colspan="2">
						<textarea class="policy-area" readonly>
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
당신의 개인정보 이미 모두 공개되어 있으므로
저희 회사에서는 10원에 판매됩니다.
저희 회사의 이익을 위해 개인정보를 수집하고
이용할 예정입니다.
그래도 이사이트에 가입하시겠습니까?
동의 하시면 체크해 주세요
						</textarea>
					</th>
				</tr>
				<tr>
					<th colspan=2>
						<div class="adm_accept_wrap">
							<input type="checkbox" id="adm_accept" />
							<label for="adm_accept" class="accept_label">&nbsp;개인정보 수집 및 이용에 동의합니다.</label>
						</div>
					</th>
				</tr>
			</table>
		</div>
		<div class="btn_wrap">
			<input type="button" id="adm_submit" class="adm_btn" value="회원가입" />
			<input type="reset" class="adm_btn" value="다시쓰기" />
		</div>
	</form>
</article>
<script src="js/regPage.js"></script>
<jsp:include page="footer.jsp" />