/**
 * for join.jsp
 * 2018-08-29
 */

/*
 * 정규식  sample
 * var regexTitle = /^[\uac00-\ud7a3a-zA-Z]{2,12}$/;   			한글 영문 포함 2~12자 이내 
 * var regexTitle = /^[\uac00-\ud7a3a-zA-Z\s0-9]{2,16}$/;		한글 영문 포함 2~16자 이내 
 * var regexTitle = /^[*]{2,20}$/; 								모든글자 2~20자 이내 
 * var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 * var regexID = /^[0-9a-zA-Z]{4,12}$/; 						ID 영문숫자 포함 4~12자 이내(특문제외)
 * var regexPhone = /^[0-9]{3,4}[0-9]{4}$/;  					mobile -표시 없이 숫자만
 * var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;  		mobile -표시 없이 숫자만
 * var regexBirth = /^[0-9]{2}[0-9]{2}[0-9]{2}$/;  				생년월일  830207
 * var regexKey = /^[0-9]{5,6}$/;  								인증번호	숫자 5~6
 * var regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;영문,숫자를 혼합하여 6~20자 이내
 * var regexName = /^[\uac00-\ud7a3]{2,6}$/;  					한글 영문 포함 8자 이내 
 * var regexDate = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;  			날짜 -표시 없이 숫자만 ex)19830207
 * var regexDateTime = /^[0-9]{2}:[0-9]{2}~[0-9]{2}:[0-9]{2}$/; 시간  ex)19:08~20:08
 * var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 특수문자 포함 비밀번호
*/


$(document).ready(function() {
	var obj = [
		{email : "chlrlrms@naver.com"},
		{email : "hap0p9y@nate.com"}		
	];
	var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var regexMobile = /^[0-9]{3,4}[0-9]{4}$/;
	var regexName = /^[\uac00-\ud7a3]{2,6}$/;
	var regexBirth = /^[0-9]{2}[0-9]{2}[0-9]{2}$/;
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
	function checkReg(el, tempVal, reg, message) {
		if(reg.test(tempVal) === false){
			showErroMessage(el, message);
			return false;
		} else {
			showSuccessMessage(el, "사용가능합니다.");
			return true;
		}
	}
	
	function showErroMessage(el, message) {
		var html = "<span style='color:red'>";
		html += message;
		html += "</span>";
		$("#" + el).html(html);
	}

	function showSuccessMessage(el, message){
		var html = "<span style='color:green'>";
		html += message;
		html += "</span>";
		$("#" + el).html(html);
	}

	var boolAdmEmail = false;
	var boolAdmPass = false;
	var boolAdmPass2 = false;
	var boolAdmName = false;
	var boolAdmBirth = false;
	var boolAdmPhone = false;
	var boolAdmMobile = false;
	var boolAdmAddress1 = false;
	var boolAdmAddress2 = false;
	var boolAdmAddress3 = false;
	var boolAdmAccept = false;

	$("#select_mail").on("change", function() {
		mail_select();
	});
	
	function mail_select() {
		var mail= $("#select_mail").val();
		var mail2= $("#adm_email_1").val();
		if(mail == '' || mail == null) {
			$("#adm_email_2").focus();
		} else {
			$("#adm_email_2").val(mail);
		}
		var tempVal = mail2 + "@" + mail;
		var el = "adm_email_text";
		var message = "올바른 형식의 email이 아닙니다.";
		var reg = regexEmail;
		for(var i = 0; i < obj.length; i++) {
			var email = obj[i].email;
			if(email == tempVal) {
				reg = regexName;
				message = "이미 존재하는 email입니다.";
				break;
			} else {
				reg = regexEmail;
			}
		}
		var boolenGet = checkReg(el, tempVal, reg, message);
		boolAdmEmail = boolenGet;
	}
	
	$("#adm_email_1").on("input", function() {
		var email1 = $("#adm_email_1").val();
		var email2 = $("#adm_email_2").val();
		var tempVal = email1 + "@" + email2;
		var el = "adm_email_text";
		var message = "올바른 형식의 email이 아닙니다.";
		var reg = regexEmail;
		for(var i = 0; i < obj.length; i++) {
			var email = obj[i].email;
			if(email == tempVal) {
				reg = regexName;
				message = "이미 존재하는 email입니다.";
				break;
			} else {
				reg = regexEmail;
			}
		}
		var boolenGet = checkReg(el, tempVal, reg, message);
		boolAdmEmail = boolenGet;
	});
	
	$("#adm_email_2").on("input", function() {
		var email1 = $("#adm_email_1").val();
		var email2 = $("#adm_email_2").val();
		var tempVal = email1 + "@" + email2;
		var el = "adm_email_text";
		var message = "올바른 형식의 email이 아닙니다.";
		var reg = regexEmail;
		for(var i = 0; i < obj.length; i++) {
			var email = obj[i].email;
			if(email == tempVal) {
				reg = regexName;
				message = "이미 존재하는 email입니다.";
				break;
			} else {
				reg = regexEmail;
			}
		}
		var boolenGet = checkReg(el, tempVal, reg, message);
		boolAdmEmail = boolenGet;
	});
	
	$("#adm_pass").on("input", function() {
		var tempVal = $("#adm_pass").val();
		var el = "adm_pass_text";
		var message = "올바른 비밀번호 형식이 아닙니다.";
		var booleanGet = checkReg(el, tempVal, regexPass, message);
		boolAdmPass = booleanGet;
	});
	
	// adm_pass_text_2
	$("#adm_pass2").on("input", function() {
		var tempVal = $("#adm_pass").val();
		var tempVal2 = $("#adm_pass2").val();
		var el = "adm_pass_text_2";
		var message = "올바른 비밀번호 형식이 아닙니다.";
		if(boolAdmPass && (tempVal === tempVal2)) {
			showSuccessMessage(el, "비밀번호가 일치합니다.");
			boolAdmPass2 = true;
		} else {
			showErroMessage(el, "비밀번호가 일치하지 않습니다.");
			boolAdmPass2 = false;
		}
	});

	/* 성명  유효성 검사 */
	$('#adm_name').on('input', function() {
		var tempVal = $('#adm_name').val();
		var el = "adm_name_text";
		var messageError = "6자이내 한글만 가능합니다.";
		var booleanGet = checkReg(el, tempVal, regexName, messageError); 
		boolAdmName = booleanGet;
	});

	/* 생년월일 유효성 검사 */
	$('#adm_birth').on('input', function() {
		var tempVal = $('#adm_birth').val();
		var el = "adm_birth_text";
		var message = "올바른 형식이 아닙니다. ex : 980101";
		var booleanGet = checkReg(el, tempVal, regexBirth, message); 
		boolAdmBirth = booleanGet;
	});

	/* 전화번호 유효성 검사 */
	$('#adm_mobile_2').on('input', function() {
		var adm_mobile_2 = $('#adm_mobile_2').val();
		var adm_mobile_3 = $('#adm_mobile_3').val();
		var tempVal = adm_mobile_2 + adm_mobile_3;
		var el = "adm_mobile_text";
		var message = "올바른형식이 아닙니다.";
		var booleanGet = checkReg(el, tempVal, regexMobile, message); 
		boolAdmMobile = booleanGet;
	});

	$('#adm_mobile_3').on('input', function() {
		var adm_mobile_2 = $('#adm_mobile_2').val();
		var adm_mobile_3 = $('#adm_mobile_3').val();
		var tempVal = adm_mobile_2 + adm_mobile_3;
		var el = "adm_mobile_text";
		var message = "올바른형식이 아닙니다.";
		var booleanGet = checkReg(el, tempVal, regexMobile, message); 
		boolAdmMobile = booleanGet;
	});

	$('#adm_mobile_1').on('input', function() {
		var adm_mobile_2 = $('#adm_mobile_2').val();
		var adm_mobile_3 = $('#adm_mobile_3').val();
		var tempVal = adm_mobile_2 + adm_mobile_3;
		var el = "adm_mobile_text";
		var message = "올바른형식이 아닙니다.";
		var booleanGet = checkReg(el, tempVal, regexMobile, message); 
		boolAdmMobile = booleanGet;
	});
	
	/* 개인정보이용 동의 유효성 검사*/
	$('#adm_accept').click(function() {
		if($('#adm_accept').is(':checked') == true) {
			boolAdmAccept = true;
		} else {
			boolAdmAccept = false;
		}
	});
	
	$("#adm_submit").click(function() {
		var adm_address_1 = $('#adm_address_1').val().length;
		var adm_address_2 = $('#adm_address_2').val().length;
		var adm_address_3 = $('#adm_address_3').val().length;
		if(adm_address_1 >= 5) {
			boolAdmAddress1 = true;	
		} else {
			boolAdmAddress1 = false;
		}
		if(adm_address_2 >= 10) {
			boolAdmAddress2 = true;
		} else {
			boolAdmAddress2 = false;
		}
		if(adm_address_3 >= 3) {
			boolAdmAddress3 = true;
		} else {
			boolAdmAddress3 = false;
		}
		if(!boolAdmEmail) {
			alert('아이디(e-mail) 을 확인해주세요');
			$('#adm_email_1').focus();
		} else if(!boolAdmPass2) {
			alert('비밀번호를 확인해주세요');
			$('#adm_pass').focus();
		} else if(!boolAdmName) {
			alert('성명을 확인해주세요');
			$('#adm_name').focus();
		} else if(!boolAdmBirth) {
			alert('생년월일을 확인해주세요');
			$('#adm_birth').focus();
		} else if(!boolAdmMobile) {
			alert('연락처를 확인해주세요');
			$('#adm_mobile_2').focus();
		} else if(!boolAdmAddress1) {
			alert('우편번호를 확인해주세요');
			$('#adm_address_1').focus();
		} else if(!boolAdmAddress2) {
			alert('주소를 확인해주세요');
			$('#adm_address_2').focus();
		} else if(!boolAdmAddress3) {
			alert('상세주소를 확인해주세요');
			$('#adm_address_3').focus();
		} else if(!boolAdmAccept) {
			alert('개인정보 수집 및 이용에 동의 해 주세요.');
			$('#adm_accept').focus();
		} else {
			alert("회원가입 성공");
			//window.location.href="index.jsp";
		}
	});
});














