
$(function() {
	
	$("#eventDelete").submit(function(){
		
		if(confirm("삭제하시겠습니까?")) {
			
			return true;
			
		}else {
			
			return false;
		}
	
	});
	
})