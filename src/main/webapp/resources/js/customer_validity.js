$(function() {
	
   $("#customer_check").submit(function() {
	   var editor = CKEDITOR.replace( 'scontent' );
	   
		if($("input[name=stitle]").val() == ""){
		    alert("제목을 입력해 주세요.");
		    $("#stitle").focus();
		    return false;
		}
		
		if(CKEDITOR.instances.scontent.getData() =='' || CKEDITOR.instances.scontent.getData().length ==0){
			alert("내용을 입력해주세요.");
			$("#scontent").focus();
			return false;
		}
		  
		
   });
});