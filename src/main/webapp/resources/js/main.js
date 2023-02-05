
   $(function() {
	   
	$('.play').hide();
	   
   $('.autoplay').slick({
	   slidesToShow: 2,
	   slidesToScroll: 1,
	   autoplay: true,
	   autoplaySpeed: 2500,
	   prevArrow: $('#arrow-prev'),
	   nextArrow: $('#arrow-next')

	 });
   
   $('.play').click(function() {
	   
	   $('.autoplay').slick('slickPlay');
	   $('.play').hide();
	   $('.stop').show();
   	
   })
   
      $('.stop').click(function() {
	   
	   $('.autoplay').slick('slickPause');
	   $('.stop').hide();
	   $('.play').show();
   	
   })
   
   $('.autoplay2').slick({
	   slidesToShow: 3,
	   slidesToScroll: 1,
	   autoplay: true,
	   autoplaySpeed: 1500,
	   prevArrow: $('#arrrow-prev2'),
	   nextArrow: $('#arrrow-next2')
	   
	 });  
   
   $("confirmAsAdmin").submit(function() {
	   
	   if(confirm("삭제 후 복구가 불가능합니다, 정말로 삭제하시겠습니까?")) {
		   
		   alert("삭제가 완료되었습니다.");
		   return true;

	   }else {
		   
		   alert("삭제가 취소되었습니다.");
		   
		   return false;
		   
	   }
   	
   });
   
   $("confirmAsMember").submit(function() {
	   
	   if(confirm("탈퇴 후 복구가 불가능합니다, 정말로 탈퇴하시겠습니까?")) {
		   
		   alert("회원 탈퇴가 완료되었습니다.");
		   return true;
		   
	   }else {
		   
		   alert("회원 탈퇴가 취소되었습니다.");
		   
		   return false;
		   
	   }
   	
   });
   
   });
