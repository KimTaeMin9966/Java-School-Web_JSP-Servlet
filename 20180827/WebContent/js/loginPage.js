$(document).ready(function() {
	$('#user_id').focus();
	var obj = [
		{id : "id001", pass : "12345"},
		{id : "id002", pass : "1234"}		
	];
	$('#login_submit').click(function() {
		var user_id = $('#user_id').val();
		var user_pass = $('#user_pass').val();
		if(user_id == '') {
			alert('아이디 작성 해주세요.');
			$('#user_id').focus();
			return;
		} else if(user_pass == '') {
			alert('비밀번호 작성 해주세요.');
			$('#user_pass').focus();
			return;
		} else {
			var bool = false;
			obj.forEach(function(item) {
				if(item.id == user_id && item.pass == user_pass) {
					bool = true;
				}
			});
			if(!bool) {
				alert("회원정보가 존재하지 않습니다.");
				/*$("#user_id").val("");
				$("#user_pass").val("");
				$("#user_id").focus();*/
				$("#loginform").attr("action", "regPage.jsp").submit();
			} else {
				alert("로그인 성공");
				//window.location.href="index.jsp";
				$("#loginform").attr("action", "index.jsp").submit();
			}
		}
	});
});