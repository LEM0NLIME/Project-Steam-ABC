
$(function() {
		
		$("div[id='pwConfirm']").hide();
		$("div[id='pwConfirm2']").hide();
	
		$("#domain").change(function() {
			
			$("#eMail").val($("#eMail").val() + $("#domain option:selected").val());

		});
		
		$("input[id='pw']").focusout(function() {
			
			var nPassword = $("input[id='password']").val(); 
			var cPassword = $("input[id='pw']").val();
			
			if(nPassword == cPassword) {
				
				$("div[id='pwConfirm']").hide();
				$("div[id='pwConfirm2']").show();				
				
			}else {
				
				$("div[id='pwConfirm']").show();
				$("div[id='pwConfirm2']").hide();
			
			}
		})		
		
		$("#inspection").submit(function() {
			
			if(!$("input[id='ename']").val()) {
				
				alert("이름을 입력해주세요.");
				$("input[id='ename']").focus();
				
				return false;
			}
			
			var req_name = /^[A-Za-z가-힣]{2,10}$/;
			var name_check = $("input[id='ename']").val();
			
			if(!req_name.test(name_check)) {
				
				alert("이름은 공백 이외의 한글 및 영문 형태로 2~10자만 입력할 수 있습니다.");
				$("input[id='ename']").focus();
				return false;
				
			}
			
			if(!$("input[id='eid']").val()) {
				
				alert("아이디를 입력해주세요.");
				$("input[id='eid']").focus();
				
				return false;
			}
			
			var req_id = /^[A-Za-z0-9]{3,20}$/;
			var id_check = $("input[id='eid']").val();
			
			if(!req_id.test(id_check)) {
				
				alert("아이디는 공백 이외의 영문 및 숫자형태로 3~20자만 입력할 수 있습니다.");
				$("input[id='eid']").focus();
				return false;
				
			}
			
			if(!$("input[id='password']").val()) {
				
				alert("비밀번호를 입력해주세요.");
				$("input[id='password']").focus();
					
				return false;
			}
			
			var req_password = /^[A-Za-z0-9](?=.*?[#?!@$%^&*-]).{9,20}$/;
			var password_check = $("input[id='password']").val();
			
			if(!req_password.test(password_check)) {
				
				alert("비밀번호는 공백 이외의 영문 및 숫자형태로 10~20자만 입력할 수 있으며, 반드시 특수문자를 포함하여야 합니다.");
				$("input[id='password']").focus();
				return false;
				
			}
			
			
			if(!$("input[id='pw']").val()) {
				
				alert("비밀번호 일치를 확인해주세요.");
				$("input[id='pw']").focus();
					
				return false;
			}		
			
			var nPassword = $("input[id='password']").val(); 
			var cPassword = $("input[id='pw']").val();
			
			if(nPassword != cPassword) {
				
				alert("비밀번호가 일치하지 않습니다. 비밀번호 일치를 확인해주세요.");
				return false;
			}
			
			if($("input[id='gender']:radio:checked").length < 1) {
				
				alert("성별을 체크 해주세요.");
				$("input[id='gender']").focus();
				
				return false;
				
			}
			
			if(!$("input[id='eMail']").val()) {
				
				alert("이메일을 입력해주세요.");
				$("input[id='eMail']").focus();
				
				return false;
			}
			
			var req_eMail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
			var eMail_check = $("input[id='eMail']").val();
			
			if(!req_eMail.test(eMail_check)) {
				
				alert("이메일 형식이 올바르지 않습니다.");
				$("input[id='eMail']").focus();
				return false;
				
			}
			
			if(!$("input[id='phoneNumber']").val()) {
				
				alert("휴대폰 번호를 입력해주세요.");
				$("input[id='phoneNumber']").focus();
				
				return false;
			}
			
			var req_phoneNumber = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			var phoneNumber_check = $("input[id='phoneNumber']").val();
			
			if(!req_phoneNumber.test(phoneNumber_check)) {
				
				alert("휴대폰 번호 형식이 올바르지 않습니다.");
				$("input[id='phoneNumber']").focus();
				return false;
				
			}
			
			
			if(req_name.test(name_check) && req_id.test(id_check) && req_password.test(password_check) && ($("input[id='gender']:radio:checked").length > 0) &&
				 req_eMail.test(eMail_check) && req_phoneNumber.test(phoneNumber_check) && nPassword == cPassword
				 ) {
				
				alert("회원수정이 완료되었습니다.");			
				
			 }else {
				 
				 alert("회원등록 조건이 미 충족 되었습니다.");
				 return false;
				 
			 }
			
		});
		
});

function alerts() {
	
	if(confirm("회원등록을 취소하시겠습니까?")) {
		
		history.back();
		
	}else {
		
		return false;
		
	}
	
}