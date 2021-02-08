






$(function() {
	$('#btn2').click(function() {
		var idcheck = $('#register_id').val().trim();
		var reg1 = /^[a-z0-9]{4,10}/;
		if (!reg1.test(idcheck)) {
			alert("ID는 소문자와 숫자조합으로 4~10글자 사이로 가능합니다"); 			
			return false;
		}
		
		


		var pwcheck = $('#register_pw').val().trim();
		var pwcheck2 = $('#register_check_pw').val().trim();
		var reg2 = /^[a-zA-Z0-9]{1,10}$/;
		
		if(pwcheck.length!=0 && pwcheck2.length!=0){
			if(pwcheck != pwcheck2){
				alert("비밀번호를 확인해주세요");
				return false;
			}
		}
		
		
		if(!reg2.test(pwcheck)) {
			alert("비밀번호는 최대 10글자까지 가능합니다.");
			return false;
		}
		  

		if(idcheck == pwcheck) {
			alert("아이디와 비밀번호는 같을 수 없습니다");
			return false;
		}
		
		

	});
	
	$('#update_sub').click(function() {
		var idcheck = $('#update_id').val().trim();
		var pwcheck = $('#update_pw').val().trim();
		var pwcheck2 = $('#update_pwch').val().trim();
		if(pwcheck.length!=0 && pwcheck2.length!=0){
			if(pwcheck != pwcheck2){
				alert("비밀번호가 다릅니다. 비밀번호를 확인해주세요");
				return false;
			}
		}

		if(idcheck == pwcheck) {
			alert("아이디와 비밀번호는 같을 수 없습니다");
			return false;
		}

	});
});