
$(function() {
		
		
		$("#applicationinsert").submit(function() {
			
			if(!$("textarea[id='aplreasons']").val()) {
				
				alert("신청 사유를 입력해주세요.");
				$("textarea[id='aplreasons']").focus();
				
				return false;
			}

		if (confirm("신청하시겠습니까?")) {
			return true;
		} else {
			alert("신청 취소 되었습니다.");
			return false;
		}
	});
});

