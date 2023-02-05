/**
 * 
 */
$(function() {
	$("#insert").submit(function() {
		var imgFile = $('#attachedfile').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
		var maxSize = 1 * 1024 * 1024;
		var fileSize;

		if ($('#attachedfile').val() == "") {
			alert("이미지 파일을 등록해주세요.");
			$("#attachedfile").focus();
			return false;
		}

		if (imgFile != "" && imgFile != null) {
			fileSize = document.getElementById("attachedfile").files[0].size;
			if (!imgFile.match(fileForm)) {
				alert("이미지 파일만 업로드 가능합니다.");
				return false;
			} else if (fileSize > maxSize) {
				alert("이미지 용량은 1 MB\n파일 사이즈는 1024 * 1024까지 가능");
				return false;
			}
		}
		
	/*	if (!$("input[name='pname']").val()) {
			alert("상품명을 입력하세요.");
			$("input[name='pname']").focus();
			return false;
		}
		var regexp_pname = /[~!@\#$%^&*\()\-=+_'\"]/gi;
		var regexp_pnamelang = /^[A-Za-z가-힣0-9]$/;
		var pname_check = $("input[name='pname']").val();
		if (regexp_pname.test(pname_check) && regexp_pnamelang.test(pname_check)) {
			alert("상품명은 한글 또는 영어와 숫자로만 입력해주세요.")
			$("input[name='pname']").focus();
			return false;
		}*/
		
		
		if(!$("input[id='pname']").val()) {
			
			alert("상품명을 입력해주세요.");
			$("input[id='pname']").focus();
			
			return false;
		}
		
		var req_pname = /^[A-Za-z가-힣0-9]{2,14}$/;
		var pname_check = $("input[id='pname']").val();
		
		if(!req_pname.test(pname_check)) {
			
			alert("상품명은 공백 이외의 한글,숫자 및 영문 형태로 2~14자만 입력할 수 있습니다.");
			$("input[id='pname']").focus();
			return false;
			
		}
		

		if (!$("input[name='pbrand']").val()) {
			alert("상품 브랜드명을 입력하세요.");
			$("input[name='pbrand']").focus();
			return false;
		}

		if (!$("input[name='pcolor']").is(":checked")) {
			alert("색상을 선택해 주세요.");
			$("input[name='pcolor']:eq(0)").focus();
			return false;
		}

		if (!$("input[name='pprice']").val()) {
			alert("상품 가격을 입력하세요.");
			$("input[name='pprice']").focus();
			return false;
		}
		var regexp_pprice = /^[|0-9|]+$/;
		var pprice_check = $("input[name='pprice']").val();
		if (!regexp_pprice.test(pprice_check)) {
			alert("상품 가격은 숫자만 입력해주세요.");
			$("input[name='pprice']").focus();
			return false;
		}

		if (!$("input[name='psn']").val()) {
			alert("상품 모델 번호를 입력하세요.");
			$("input[name='psn']").focus();
			return false;
		}
		var regexp_psn = /[a-zA-Z0-9]/g;
		var psn_check = $("input[name='psn']").val();
		if (!regexp_psn.test(psn_check)) {
			alert("상품 모델 번호는 영문,숫자만 표기 가능합니다.")
			$("input[name='psn']").focus();
			return false;
		}

		if (!$("textarea[name='pinfo']").val()) {
			alert("상품 정보를 입력하세요.");
			$("textarea[name='pinfo']").focus();
			return false;
		}

		if (confirm("상품을 등록 하시겠습니까?")) {
			return true;
		} else {
			alert("상품 등록이 취소 되었습니다.");
			return false;
		}
	});
	
	$("#attachedfile")
	.change(
			function() {
				if (this.files
						&& this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(
							data) {
						$(".select_img img")
								.attr(
										"src",
										data.target.result)
								.width(300);
					}
					reader
							.readAsDataURL(this.files[0]);
				} else {
					return false;
				}
			});
	

	$("#reset").click(function() {
		if (confirm("상품 화면으로 돌아가시겠습니까? 작성된 정보는 저장되지 않습니다.")) {
			location.href="./ProductSelect";
		}else{
			return false;
		}
	});
			
			
});
