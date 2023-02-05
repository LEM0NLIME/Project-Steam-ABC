
$(function() {
	
	$("p[id='admissionEmail']").hide();
	$("p[id='eMailConfirmY']").hide();
	$("p[id='eMailConfirmN']").hide();
	$("p[id='admissionPhoneNumbers']").hide();
	$("p[id='phoneConfirmY']").hide();
	$("p[id='phoneConfirmN']").hide();
	
	$("#asPhoneNum").hide();
	
	$("#domain").change(function() {
		
		$("#eMail").val($("#eMail").val() + $("#domain option:selected").val());

	})
	
	$("#change_button").click(function() {
		
		$("#asEMail").show();
		$("#asPhoneNum").hide();
		
	});
	
	$("#change_button2").click(function() {
		
		$("#asPhoneNum").show();
		$("#asEMail").hide();
		
	});
	
	$("button[id='eMailPermissionNumber']").click(function() {
		
		var nEmail = $("input[id='eMailNumber']").val(); 
		var certification = $("#certificationNum").val();
		
		if(nEmail == certification) {
			
			$("p[id='eMailConfirmN']").hide();
			$("p[id='eMailConfirmY']").show();
			
		}else {
			
			
			$("p[id='eMailConfirmY']").hide();
			$("p[id='eMailConfirmN']").show();
			
		}
		
	})
				
	$("button[id='eMailPermission']").click(function() {
		
		var req_eMail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		var eMail_check = $("input[id='eMail']").val();
		
		if(req_eMail.test(eMail_check)) {
			
			$.ajax({

				url : "./MemberMailCertification",
				data : {
					
					memail : $("input[id='eMail']").val()
					
				},
			
			success : function(result) {
				
				var certification = result
				
				$("#certificationNum").val(certification);
				
			}
				
			});
			
		alert("인증번호 전송이 완료되었습니다.");
			
		$("p[id='admissionEmail']").show();
		
	}else {
		
		alert("이메일 형식이 올바르지 않습니다.")
	}
		
	})
	
	$("button[id='phonePermissionNumber']").click(function() {
		
		var nPhone = $("input[id='PhoneNumbers']").val();
		var certification2 = $("#certificationNum2").val();
		
		if(nPhone == certification2) {
			
			$("p[id='phoneConfirmN']").hide();
			$("p[id='phoneConfirmY']").show();
			
		}else {
			
			$("p[id='phoneConfirmY']").hide();
			$("p[id='phoneConfirmN']").show();
			
		}
		
	})
	
	$("button[id='phoneNumberPermissions']").click(function() {
		
		var req_phoneNumber = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		var phoneNumber_check = $("input[id='phoneNumber']").val();
		
		if(req_phoneNumber.test(phoneNumber_check)) {
			
			var phonenum = $("#phoneNumber").val();
			
			$.ajax ({
				
				url : "./MemberPhoneCertification" ,
				data : {
					
					mphonenum : phonenum
					
				} ,
				
				success : function(result2) {
					
					var certification2 = result2
					
					$("#certificationNum2").val(certification2);
					
				}
				
			});
			
		alert("인증번호 전송이 완료되었습니다.");
		$("p[id='admissionPhoneNumbers']").show();
		
	}else {
		
		alert("휴대폰 번호 형식이 올바르지 않습니다.");
	}
		
	});
	
	$("#memberPwSearchAsEMailView").submit(function() {
		
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
		
		if(!$("input[id='mname']").val()) {
			
			alert("이름을 입력해주세요.");
			$("input[id='mname']").focus();
			
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
		
		var nEmail = $("input[id='eMailNumber']").val(); 
		var certification = $("#certificationNum").val();
		
		if(!(nEmail == certification)) {
			
			alert("인증번호가 일치하지 않습니다.");
			$("input[id='eMailNumber']").focus();
			
			return false;
			
		}

	});
	
	$("#eMailNumber").change(function() {
		
		var nEmail = $("input[id='eMailNumber']").val(); 
		var certification = $("#certificationNum").val();
		
		if(nEmail == certification) {
			
			$("p[id='eMailConfirmN']").hide();
			$("p[id='eMailConfirmY']").show();
			
		}else {
			
			
			$("p[id='eMailConfirmY']").hide();
			$("p[id='eMailConfirmN']").show();
			
		}
		
	});
	
	

	$("#memberPwSearchAsPhoneNumView").submit(function() {
		
		if(!$("input[id='eid2']").val()) {
			
			alert("아이디를 입력해주세요.");
			$("input[id='eid2']").focus();
			
			return false;
		}
		
		var req_id = /^[A-Za-z0-9]{3,20}$/;
		var id_check = $("input[id='eid2']").val();
		
		if(!req_id.test(id_check)) {
			
			alert("아이디는 공백 이외의 영문 및 숫자형태로 3~20자만 입력할 수 있습니다.");
			$("input[id='eid2']").focus();
			return false;
			
		}
		
		if(!$("input[id='mname2']").val()) {
			
			alert("이름을 입력해주세요.");
			$("input[id='mname2']").focus();
			
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
		
		var nPhone = $("input[id='PhoneNumbers']").val();
		var certification2 = $("#certificationNum2").val();
		
		if(!(nPhone == certification2)) {
			
			alert("인증번호가 일치하지 않습니다.");
		
				$("input[id='PhoneNumbers']").focus();

			return false;
			
		}
		
		$("button[id='phonePermissionNumber']").click(function() {
			
			var nPhone = $("input[id='PhoneNumbers']").val();
			var certification2 = $("#certificationNum2").val();
			
			if(nPhone == certification2) {
				
				$("p[id='phoneConfirmN']").hide();
				$("p[id='phoneConfirmY']").show();
				
			}else {
				
				$("p[id='phoneConfirmY']").hide();
				$("p[id='phoneConfirmN']").show();
				
			}
			
		})
		
	});
	
});




