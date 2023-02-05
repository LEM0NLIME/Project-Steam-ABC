  
$(function() {
	   
   $("#confirmAsAdmin").submit(function() {
	   
	   if(confirm("삭제 후 복구가 불가능합니다, 정말로 삭제하시겠습니까?")) {
		   
		   alert("삭제가 완료되었습니다.");
		   return true;

	   }else {
		   
		   alert("삭제가 취소되었습니다.");
		   
		   return false;
		   
	   }
   	
   });
   
   $("#confirmAsMember").submit(function() {
	   
	   if(confirm("탈퇴 후 복구가 불가능합니다, 정말로 탈퇴하시겠습니까?")) {
		   
		   alert("회원 탈퇴가 완료되었습니다.");
		   return true;
		   
	   }else {
		   
		   alert("회원 탈퇴가 취소되었습니다.");
		   
		   return false;
		   
	   }
   	
   });
   
   });
