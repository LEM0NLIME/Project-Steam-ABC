$(function() {
	
	
	$("#edcratetext").hide();
	
	$("input[id='etype']").change(function(){
	
	if($("input[id='etype']:checked").val()=='할인전') {
		
		$("#edcratetext").show();
		
	}
	
	if($("input[id='etype']:checked").val()=='기획전') {

		$("#edcratetext").hide();
	}
	
	});
	
	
	$("#sign_event").submit(function() {
		
		
		if (!$("input[name='ename']").val()) {
			alert("이벤트 이름을 입력하세요.");
			$("input[name='ename']").focus();
			return false;
		}

		if (!$("input[name='eperiod']").val()) {
			alert("이벤트 기간을 입력하세요.");
			$("input[name='eperiod']").focus();
			return false;
		}
		
		if (!$("input[name='etarget']").val()) {
			alert("이벤트 대상을 입력하세요.");
			$("input[name='etarget']").focus();
			return false;
		}
		
		if ($("input[name='etype']:radio:checked").length<1) {
			alert("이벤트 타입을 입력하세요.");
			return false;
		}

		if($("input[id='etype']:checked").val()=='할인전') {
			
			if ($("#edcrate").val()=='') {
				alert("할인율을 선택해주세요.");
				$("select[id='edcrate']").focus();
				return false;
			}
			
		}
		
		var imgFile = $('#eimg`').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/;
		var maxSize = 10 * 1024 * 1024;
		var fileSize;
		
		
		if (imgFile == ""){
			
			alert("이벤트 이미지를 등록해주세요.");
			$("#eimg").focus();
			return false;
		}

		if (imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("eimg").files[0].size;
			if (!imgFile.match(fileForm)) {
				alert("이미지 파일만 업로드 가능합니다.");
				return false;
			} else if (fileSize > maxSize) {
				alert("이미지 용량은 5MB까지 등록 가능합니다.");
				return false;
			}
		}
		

	});
	
});

function history() {
	
	if(confirm("정말로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.")) {
		
		location.href="./EventSelect";
		
	}else {
	
	return false;
	
	}
	
}
	
