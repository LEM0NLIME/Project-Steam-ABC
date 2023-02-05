
$(function() {
		
		
		$("#orderinsert").submit(function() {
	            
				
			if(!$("input[id='mname']").val()) {
				
				alert("이름을 입력해주세요.");
				$("input[id='mname']").focus();
				
				return false;
			}
			
			var req_mname = /^[A-Za-z가-힣]{2,10}$/;
			var mname_check = $("input[id='mname']").val();
			
			if(!req_mname.test(mname_check)) {
				
				alert("이름은 공백 이외의 한글 및 영문 형태로 2~10자만 입력할 수 있습니다.");
				$("input[id='mname']").focus();
				return false;
				
			}
			
			if(!$("textarea[id='ordaddress']").val()) {
				
				alert("배송지를 입력해주세요.");
				$("textarea[id='ordaddress']").focus();
				
				return false;
			}

		if (confirm("주문하시겠습니까?")) {
			return true;
		} else {
			alert("주문 취소 되었습니다.");
			return false;
		}
	});
});

