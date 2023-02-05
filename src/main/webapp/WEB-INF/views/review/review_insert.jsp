<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/review_insert.js"></script>

<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" href="./css/product_common.css">
<link rel="stylesheet" href="./css/review.css">

<c:if test="${empty sessionID}">
<script type="text/javascript">

alert("로그인이 필요한 기능입니다. 로그인 해주세요.");
location.href="./MemberLogIn";

</script>
</c:if>

</head>
<body>


<div class="imgBlank">

<span class="blank"> 
<a href="./abc_main.jsp"> <img name="ABCMain" src="./img/ABC.png" class="image"> </a>
</span>

<span class="blank"> 
<span>
	<a href="./CartSelectDetail?mid=${sessionID}"> <img name="cartMain" src="./img/cart-symbol.png" class="icon"> </a>
</span>
 

<c:if test="${sessionID eq 'admin'}">


<span>
	<a href="./MemberInquiryAll"> <img name="Members" src="./img/member-symbol.png" class="icon"> </a>
</span>

</c:if>


<span>
	<a href="./MemberJoin"> <img name="JoinMain" src="./img/join-symbol.png" class="icon"> </a>
</span>

<c:choose>

<c:when test="${empty sessionID}">

<span>
	<a href="./MemberLogIn"> <img name="LogInMain" src="./img/login-symbol.png" class="icon"> </a>
</span>

</c:when>
<c:otherwise>

<span>
	<a href="./MemberLogOut"> <img name="LogOutMain" src="./img/logout-symbol.png" class="icon"> </a>
</span>

</c:otherwise>

</c:choose>

</span>

</div>

<div class="navigator">

<span class="navBlankLeft">
<span class="navContentL">
<a href="./ProductSelect" style="color: yellow"> <font class="fontInterval">상품</font> </a>
<a href="./EventSelect" style="color: yellow"> <font class="fontInterval">기획전</font> </a>
<a href="./ReviewSelect" style="color: yellow"> <font class="fontInterval">상품리뷰</font> </a>
</span>
</span>

<span class="navBlankRight">
<span class="navContentR">
<a href="./MyPageMain" style="color: white"> <font class="fontInterval">마이페이지</font> </a>
<a href="./CartSelectDetail?mid=${sessionID}" style="color: white"> <font class="fontInterval">장바구니</font> </a>
<a href="./CustomerListPage" style="color: white"> <font class="fontInterval">고객센터</font> </a>
</span>
</span>

</div>

<div class="spaces">

	<form id="insert" name="insert" action="./ReviewInsert" method="post" enctype="multipart/form-data">
		
		<div style="border-bottom: solid 1px lightgray;">
		<h1>리뷰 작성</h1>
		</div>
		<br>
		
		<div class="inputArea">
  		 <label for="rvImg">이미지</label>
 		 <input type="file" id="rvImg" name="file"  />
 		  <div class="select_img"><img src="" />
  		 </div>
		
		<br>작성자 아이디 <input type="text" name="mid" id="mid" style="border: none" readonly="readonly" value="${sessionID}"> <br><br>

		평점&nbsp; | &nbsp;
						<input type="radio" name="rvrating" value="⭐" id="rvrating" > <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating"> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating"> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating"> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating"> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
						<br><br>
		
		사이즈 만족도&nbsp; | &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음">10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음">5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함">적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼">5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼">10mm정도 큼 &nbsp;
						 <br><br>
						 
		색상 만족도&nbsp; | &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음">많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음">조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음">화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움">조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움">많이 어두움  &nbsp;
						<br><br>
			
			평소 나의 사이즈
			<select name="mysize" id="mysize" onchange="mysize(this.value)">
				<option value="사이즈를 선택해주세요">사이즈를 선택해주세요</option>
				<option value="220mm">220mm</option>
				<option value="225mm">225mm</option>
				<option value="230mm">230mm</option>
				<option value="235mm">235mm</option>
				<option value="240mm">240mm</option>
				<option value="245mm">245mm</option>
				<option value="250mm">250mm</option>
				<option value="255mm">255mm</option>
				<option value="260mm">260mm</option>
				<option value="265mm">265mm</option>
				<option value="270mm">270mm</option>
				<option value="275mm">275mm</option>
				<option value="280mm">280mm</option>
				<option value="285mm">285mm</option>
				<option value="290mm">290mm</option>
				<option value="295mm">295mm</option>
				<option value="300mm">300mm</option>
			</select>
			<br>
			
			
			
			
			
			
<!-- 		나의발볼 <input type="text" name="myfootball" id="myfootball"> -->
<!-- 		<br> 나의발등 <input type="text" name="myinstep" id="myinstep"> -->
		</div>
		<br>
		
		리뷰 내용 <br><textarea style="resize: none" name="rvcontent" id="rvcontent" rows="10" cols="50" placeholder="10자 이상 / 1000자 이하"></textarea> <br>

		<div style="text-align: left;">
		 <input type="submit" value="상품 후기 등록" class="btn-slide">
 		<input type="reset" value="취소" class="btn-slide">
		</div>
		
		<br>
		<br>
		<br>

		<fieldset>
			상품 후기 작성 <br>
		</fieldset>

	</form>

	<fieldset>


		&nbsp;&nbsp;&nbsp; <strong>상품 후기 작성 안내</strong>
		<ul>

			<li>일반(텍스트) 후기는 500포인트, 포토 후기는 1,000포인트, 동영상 후기는 1,500포인트를
				적립해드립니다. (동영상 후기는 mp4 형식의 파일만 해당됩니다.)</li>
			<li>후기 등록일 이후 최대 3일 이내에 후기 포인트 적립해드립니다. (주말 및 공휴일 제외)</li>
			<li>상품 결제 가격이 2만 원 미만인 경우 후기 포인트가 지급되지 않습니다.</li>
			<li>구매 확정일로부터 30일 이후에 후기를 등록한 경우 후기 포인트가 지급되지 않습니다.</li>
			<li>직접 촬영한 사진 및 동영상이 아닐 경우 포토/동영상 후기에 대한 포인트 지급이 제외됩니다.</li>
			<li>동일한 이미지를 사용하여 여러 번 상품 후기를 등록하시는 경우 포토 후기에 대한 포인트는 한 번만
				지급됩니다.</li>
			<li>허위, 과대광고, 문의 등 후기 내용과 관련 없는 글은 통보 없이 삭제될 수 있습니다.</li>
			<li>포인트는 통합멤버십 회원에게만 지급됩니다.</li>
			<li>상품후기는 A-RT.COM 주문 상품만 작성 가능합니다.</li>
			<li>작성하신 상품후기는 A-RT.COM에 귀속되며, 마케팅 용도로 사용될 수 있습니다.</li>
		</ul>
	</fieldset>

</div>

<br>
<br>

<footer class="bottom"></footer>

</body>
</html>