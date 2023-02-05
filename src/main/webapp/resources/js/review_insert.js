/**
 * 
 */

		$(function() {
			$("#insert").submit(function() {
				
				var imgFile = $('#rvImg').val();
				var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
				var maxSize = 1 * 1024 * 1024;
				var fileSize;

				if ($('#rvImg').val() == "") {
					alert("이미지 파일을 등록해주세요.");
					$("#rvImg").focus();
					return false;
				}

				if (imgFile != "" && imgFile != null) {
					fileSize = document.getElementById("rvImg").files[0].size;
					if (!imgFile.match(fileForm)) {
						alert("이미지 파일만 업로드 가능합니다.");
						return false;
					} else if (fileSize > maxSize) {
						alert("이미지 용량은 1 MB\n파일 사이즈는 1024 * 1024까지 가능");
						return false;
					}
				}
				
				
				if($(":radio[id='rvrating']:checked").length < 1) {
					
					alert("평점을 선택해주세요.");
					$(":radio[id='rvrating']").focus();
					
					return false;
					
				}
				
				if($(":radio[id='rvsize']:checked").length < 1) {
					
					alert("사이즈 만족도를 선택해주세요.");
					$(":radio[id='rvsize']").focus();
					
					return false;
					
				}
				
				if($(":radio[id='rvcolor']:checked").length < 1) {
					
					alert("색상 만족도를 선택해주세요.");
					$(":radio[id='rvcolor']").focus();
					
					return false;
					
				}
				
				if ($("#mysize").val() == "사이즈를 선택해주세요") {
					alert("평소 사이즈를 선택해주세요.")
					$("#mysize").focus();
					return false;
					
				}

		
		var req_rvcontent = /^[A-Za-z가-힣ㄱ-ㅎㅏ-ㅣ0-9/\s~!@#$%^&*()_+|<>?:{}]{10,1000}$/;
		var rvcontent_check = $("textarea[id='rvcontent']").val();
		
		if (!req_rvcontent.test(rvcontent_check)) {
			
			alert("상품 후기는 10자 이상 1000자 이하로 작성 가능하며, 한글 영문자 숫자 및 특수문자로만 작성하실 수 있습니다.");
			$("textarea[id='rvcontent']").focus();
			
			return false;
			
		}
		
		   $("#rvImg").change(function(){
			     if(this.files && this.files[0]) {
			      var reader = new FileReader;
			      reader.onload = function(data) {
			       $(".select_img img").attr("src", data.target.result).width(300);          
			      }
			      reader.readAsDataURL(this.files[0]);
			     
			     } else {
					return false;
				}
			     
			     
			    });
		
		});
	
});