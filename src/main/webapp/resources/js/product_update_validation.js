/**
 * 
 */

$(function() {
	$("#insert").submit(function() {

		if (!$("input[name='pcolor']").is(":checked")) {
			alert("색상을 선택해주세요.");
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

		if (!$("textarea[name='pinfo']").val()) {
			alert("상품 정보를 입력하세요.");
			$("textarea[name='pinfo']").focus();
			return false;
		}
	});
	$("#attachedfile").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src", data.target.result).width(200);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	$("#reset").click(function() {
		if (confirm("상품 화면으로 돌아가시겠습니까? 작성된 정보는 저장되지 않습니다.")) {
			location.href = "./ProductSelect";
		} else {
			return false;
		}
	});
});
