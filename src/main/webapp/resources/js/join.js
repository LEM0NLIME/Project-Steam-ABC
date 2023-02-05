
$(function() {
		
		$("div[id='pwConfirm']").hide();
		$("div[id='pwConfirm2']").hide();
		$("p[id='admissionEmail']").hide();
		$("p[id='eMailConfirmY']").hide();
		$("p[id='eMailConfirmN']").hide();
		$("p[id='admissionPhoneNumbers']").hide();
		$("p[id='phoneConfirmY']").hide();
		$("p[id='phoneConfirmN']").hide();
		
		$("#domain").change(function() {
			
			$("#eMail").val($("#eMail").val() + $("#domain option:selected").val());

		})
		
		var idChecked=false;
		
		$('#confirmIdDup').click(function(e) {
			
			if(!$("input[id='eid']").val()) {
				
				alert("아이디를 입력해주세요.");
				$("input[id='eid']").focus();
				
				return false;
			}

			e.preventDefault();
			
			$.ajax({

				url : "./MemberDupCheck",
				data : {
					
					mid : $("input[id='eid']").val()
					
				},
				
				success : function(result) {
					
					if(result=="available") {
						console.log("아이디 값 - " + result);
						$("#idCheck").val(1);
						alert("사용 가능한 아이디입니다.");
						
					}else if(result=="unavailable"){
						
						alert("이미 등록된 아이디입니다.");
						
					}
					
					
				}
				
			});
			
		});
		
		$("button[id='joinCancel']").click(function() {
			
			if(confirm("정말로 취소하시겠습니까? 작성중인 내용은 저장되지 않습니다.")) {
				
				location.href="./abc_main.jsp";
				
			}else {
				
				return false;
				
			}
			
		});
		
	   $("input[id='eid']").on("change", function(){
		   
		   	$("#idCheck").val(0);
		        
		    });
		
		$("input[id='eMailNumber']").change(function() {
			
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
			
		});
					
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
			
		});
		
		$("input[id='PhoneNumbers']").change(function() {
			
			var nPhone = $("input[id='PhoneNumbers']").val();
			var certification2 = $("#certificationNum2").val();
			
			if(nPhone == certification2) {
				
				$("p[id='phoneConfirmN']").hide();
				$("p[id='phoneConfirmY']").show();
				
			}else {
				
				$("p[id='phoneConfirmY']").hide();
				$("p[id='phoneConfirmN']").show();
				
			}
			
		});
		
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
			
			alert("휴대폰 번호 형식이 올바르지 않습니다.")
		}
			
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
 			
			if(!$("input[id='agreement4']").is(":checked") || !$("input[id='agreement5']").is(":checked") || !$("input[id='agreement6']").is(":checked")) {
				
				alert("필수 동의란을 전부 체크 해주세요.");
				
				if(!$(':input:checkbox[id=agreement4]:checked').val()) {

					$(':input:checkbox[id=agreement4]:eq(0)').focus();
	
				} 
				if(!$(':input:checkbox[id=agreement5]:checked').val()) {

					$(':input:checkbox[id=agreement5]:eq(0)').focus();
	
				} 
				if(!$(':input:checkbox[id=agreement6]:checked').val()) {

					$(':input:checkbox[id=agreement6]:eq(0)').focus();
	
				} 
				
				return false;
				
			}
			
			
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

		     if($("#idCheck").val()==0){
		                
		    	 alert("id 중복체크를 해주세요");
		    	 
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
			
			var nEmail = $("input[id='eMailNumber']").val(); 
			var nPhone = $("input[id='PhoneNumbers']").val();
			var certification = $("#certificationNum").val();
			var certification2 = $("#certificationNum2").val();
			
			if(!((nPhone == certification2) && (nEmail == certification))) {
				
				alert("인증번호가 일치하지 않습니다.");
				
				if(!(nPhone == certification2)) {
					
					$("input[id='PhoneNumbers']").focus();
					
				}
				
				if(!(nEmail == certification)) {
					
				$("input[id='eMailNumber']").focus();
				
				}
				
				return false;
				
			}
			
			if(req_name.test(name_check) && req_id.test(id_check) && req_password.test(password_check) && ($("input[id='gender']:radio:checked").length > 0) &&
					 req_eMail.test(eMail_check) && req_phoneNumber.test(phoneNumber_check) && nPassword == cPassword && $("#idCheck").val() > 0
					 ) {
				
				alert("회원 가입이 완료되었습니다.")
							
					
				 }else {
					 
					 alert("회원가입 조건이 미 충족 되었습니다.");
					 return false;
					 
				 }
			
		});
		
	});