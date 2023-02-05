
$(function() {
	
		$("#sub").submit(function () {
		
		if(!$("input[id='eid']").val()) {
			
			alert("아이디를 입력해주세요.");
			$("input[id='eid']").focus();
			
			return false;
		}
		
		if(!$("input[id='password']").val()) {
				
			alert("비밀번호를 입력해주세요.");
			$("input[id='password']").focus();
				
			return false;
		}
		
	
		});
	});