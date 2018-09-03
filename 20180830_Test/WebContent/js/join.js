/**
 * 
 */
$(document).ready(function() {
	$('#reg').click(function() {
		var a = $('#inID').val();
		var b = $('#inPW').val();
		var c = $('#inPW2').val();
		var d = $('#inBR').val();
		var e = $('#inNM').val();
		var f = $('#inPN').val();
		var aa = true;
		var bb = true;
		var cc = true;
		var dd = true;
		var ee = true;
		var ff = true;
		if(a == '' || a == null) {
			aa = false;
		} else if(b == '' || b == null) {
			bb = false;
		} else if(c == '' || c == null) {
			cc = false;
		} else if(d == '' || d == null) {
			dd = false;
		} else if(e == '' || e == null) {
			ee = false;
		} else if(f == '' || f == null) {
			ff = false;
		}
		if(!aa) {
			alert('아이디를 확인해주세요');
			$('#inID').focus();
		} else if(!bb) {
			alert('비밀번호를 확인해주세요');
			$('#inPW').focus();
		} else if(!cc) {
			alert('비밀번호 확인을 확인해주세요');
			$('#inPW2').focus();
		} else if(!dd) {
			alert('생년월일을 확인해주세요');
			$('#inBR').focus();
		} else if(!ee) {
			alert('이름를 확인해주세요');
			$('#inNM').focus();
		} else if(!ff) {
			alert('전화번호를 확인해주세요');
			$('#inPN').focus();
		} else {
			alert('회원가입성공');
		}
	});
	$('#edit').click(function() {
		window.location.href = "edit.jsp";
	});
});