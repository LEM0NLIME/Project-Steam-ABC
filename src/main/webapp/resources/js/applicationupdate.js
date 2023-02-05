
$(function() {
		
		
		$("#applicationupdate").submit(function() {
			
			if(!$("textarea[id='aplreasons']").val()) {
				
				alert("신청 사유를 입력해주세요.");
				$("textarea[id='aplreasons']").focus();
				
				return false;
			}

		if (confirm("수정 하시겠습니까?")) {
			return true;
		} else {
			alert("수정이 취소 되었습니다.");
			return false;
		}
	});
});

