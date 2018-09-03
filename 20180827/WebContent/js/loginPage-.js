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
		{id: 'ktm06069@naver.com', pw: 'ktm06069!@'},
		{id: 'ktm06069@naver.com', pw: 'ktm06069!@#'}
	];
	var boolLogId = false;
	var boolLogPw = false;
	$("#log").click(function() {
		login_check();
		if(!boolLogId) {
			alert('아이디(e-mail) 을 확인해주세요');
			$('#logId').focus();
		} else if(!boolLogPw) {
			alert('비밀번호를 확인해주세요');
			$('#logPw').focus();
		} else {
			alert("로그인 성공");
			window.location.href="index.jsp";
		}
	});
	
	function login_check() {
		var id = $("#logId").val();
		var pw = $("#logPw").val();
		if(id == '' || id == null) {
			$("#logId").focus();
		} else if(pw == '' || pw == null) {
			$("#logPw").focus();
		}
		for(var i = 0; i < obj.length; i++) {
			var loginID = obj[i].id;
			var loginPW = obj[i].pw;
			if(loginID == id) {
				alert('ID가 일치 합니다');
				boolLogId = true;
				if(loginPW == pw) {
					alert('PW가 일치 합니다');
					boolLogPw = true;
				}
			}
			break;
		}
	}
});














