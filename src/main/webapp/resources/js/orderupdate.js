
$(function() {
		
		
		$("#orderupdate").submit(function() {
			
			if(!$("textarea[id='ordaddress']").val()) {
				
				alert("배송지를 입력해주세요.");
				$("textarea[id='ordaddress']").focus();
				
				return false;
			}

		if (confirm("변경 하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	});
});

