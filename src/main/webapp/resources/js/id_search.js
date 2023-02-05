
$(function() {
	
	$("#idSearchInspection").submit(function() {

		if(!$("input[id='mname']").val()) {
			
			alert("이름을 입력해주세요.");
			$("input[id='mname']").focus();
			
			return false;
		}
		
		if(!$("input[id='mphonenum']").val()) {
			
			alert("휴대폰 번호를 입력해주세요.");
			$("input[id='mphonenum']").focus();
			
			return false;
		}
		
		var req_phoneNumber = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		var phoneNumber_check = $("input[id='mphonenum']").val();
		
		if(!req_phoneNumber.test(phoneNumber_check)) {
			
			alert("휴대폰 번호 형식이 올바르지 않습니다.");
			$("input[id='mphonenum']").focus();
			return false;
			
		}
		
	});
	
});




