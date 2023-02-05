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
<script type="text/javascript" src="./js/review_update.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" href="./css/review.css">

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


	<form id="update" name="update" action="./ReviewUpdate" method="post" enctype="multipart/form-data">
	
		<div style="border-bottom: solid 1px lightgray;">
		<h1>리뷰 수정</h1>
		</div>
		<br>
 		  
 		  <div class="inputArea">
  		 <label for="rvImg">이미지</label>
 		 <input type="file" id="rvImg" name="file"  />
 		  <div class="select_img">
 		  
 		  <img src="${pageContext.request.contextPath}/${reviewDTO.rvimg}" />
 		  <input type="hidden" name="rvimg" value="${reviewDTO.rvimg}">
		  <input type="hidden" name="rvthumbimg" value="${reviewDTO.rvthumbimg}">
		  <input type="hidden" name="rvno" value="${reviewDTO.rvno}">
 		  
  		 </div>
		
		<br>작성자 아이디 <input type="text" name="mid" id="mid" style="border: none" readonly="readonly" value="${reviewDTO.mid}"> <br><br>

		평점&nbsp; | &nbsp;
					<c:if test="${reviewDTO.rvrating eq '⭐'}">
						<input type="radio" name="rvrating" value="⭐" id="rvrating"  checked> <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating"> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating"> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating"> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating"> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
					</c:if>
					<c:if test="${reviewDTO.rvrating eq '⭐⭐'}">
						<input type="radio" name="rvrating" value="⭐" id="rvrating" > <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating" checked> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating"> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating"> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating"> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
					</c:if>	
					<c:if test="${reviewDTO.rvrating eq '⭐⭐⭐'}">
						<input type="radio" name="rvrating" value="⭐" id="rvrating" > <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating"> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating" checked> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating"> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating"> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
					</c:if>
					<c:if test="${reviewDTO.rvrating eq '⭐⭐⭐⭐'}">
						<input type="radio" name="rvrating" value="⭐" id="rvrating" > <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating"> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating"> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating" checked> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating"> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
					</c:if>
					<c:if test="${reviewDTO.rvrating eq '⭐⭐⭐⭐⭐'}">
						<input type="radio" name="rvrating" value="⭐" id="rvrating" > <label for="rvrating1">⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐" id="rvrating"> <label for="rvrating2">⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐" id="rvrating"> <label for="rvrating3">⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐" id="rvrating"> <label for="rvrating4">⭐⭐⭐⭐</label> &nbsp;
						<input type="radio" name="rvrating" value="⭐⭐⭐⭐⭐" id="rvrating" checked> <label for="rvrating5">⭐⭐⭐⭐⭐</label> &nbsp;
					</c:if>	
						<br><br>
		
		사이즈 만족도&nbsp; | &nbsp;
			<c:if test="${reviewDTO.rvsize eq '10mm정도 작음'}">
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음" checked>10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음">5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함">적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼">5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼">10mm정도 큼 &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvsize eq '5mm정도 작음'}">
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음">10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음" checked>5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함">적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼">5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼">10mm정도 큼 &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvsize eq '적당함'}">
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음">10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음">5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함" checked>적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼">5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼">10mm정도 큼 &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvsize eq '5mm정도 큼'}">
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음">10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음">5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함">적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼" checked>5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼">10mm정도 큼 &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvsize eq '10mm정도 큼'}">
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 작음">10mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 작음">5mm정도 작음 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="적당함">적당함 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="5mm정도 큼">5mm정도 큼 &nbsp;
						<input type="radio" name="rvsize" id="rvsize" value="10mm정도 큼" checked>10mm정도 큼 &nbsp;
						</c:if>	
						 <br><br>
						 
		색상 만족도&nbsp; | &nbsp;
			<c:if test="${reviewDTO.rvcolor eq '많이 밝음'}">
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음" checked>많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음">조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음">화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움">조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움">많이 어두움  &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvcolor eq '조금 밝음'}">
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음">많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음" checked>조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음">화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움">조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움">많이 어두움  &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvcolor eq '화면과 같음'}">
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음">많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음">조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음" checked>화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움">조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움">많이 어두움  &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvcolor eq '조금 어두움'}">
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음">많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음">조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음">화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움" checked>조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움">많이 어두움  &nbsp;
						</c:if>
					<c:if test="${reviewDTO.rvcolor eq '많이 어두움'}">
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 밝음">많이 밝음 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="조금 밝음">조금 밝음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="화면과 같음">화면과 같음 &nbsp;
						<input type="radio"	name="rvcolor" id="rvcolor" value="조금 어두움">조금 어두움 &nbsp;
						<input type="radio" name="rvcolor" id="rvcolor" value="많이 어두움" checked>많이 어두움  &nbsp;
						</c:if>
						<br><br>

   


			평소 나의 사이즈
			
		
			<select name="mysize" id="mysize" onchange="mysize(this.value)">
		
				<option value="사이즈를 선택해주세요">사이즈를 선택해주세요</option>
				<option value="220mm" <c:if test="${reviewDTO.mysize == '220mm'}">selected="selected"</c:if>>220mm</option>
				<option value="225mm" <c:if test="${reviewDTO.mysize == '225mm'}">selected="selected"</c:if>>225mm</option>
				<option value="230mm" <c:if test="${reviewDTO.mysize == '230mm'}">selected="selected"</c:if>>230mm</option>
				<option value="235mm" <c:if test="${reviewDTO.mysize == '235mm'}">selected="selected"</c:if>>235mm</option>
				<option value="240mm" <c:if test="${reviewDTO.mysize == '240mm'}">selected="selected"</c:if>>240mm</option>
				<option value="245mm" <c:if test="${reviewDTO.mysize == '245mm'}">selected="selected"</c:if>>245mm</option>
				<option value="250mm" <c:if test="${reviewDTO.mysize == '250mm'}">selected="selected"</c:if>>250mm</option>
				<option value="255mm" <c:if test="${reviewDTO.mysize == '255mm'}">selected="selected"</c:if>>255mm</option>
				<option value="260mm" <c:if test="${reviewDTO.mysize == '260mm'}">selected="selected"</c:if>>260mm</option>
				<option value="265mm" <c:if test="${reviewDTO.mysize == '265mm'}">selected="selected"</c:if>>265mm</option>
				<option value="270mm" <c:if test="${reviewDTO.mysize == '270mm'}">selected="selected"</c:if>>270mm</option>
				<option value="275mm" <c:if test="${reviewDTO.mysize == '275mm'}">selected="selected"</c:if>>275mm</option>
				<option value="280mm" <c:if test="${reviewDTO.mysize == '280mm'}">selected="selected"</c:if>>280mm</option>
				<option value="285mm" <c:if test="${reviewDTO.mysize == '285mm'}">selected="selected"</c:if>>285mm</option>
				<option value="290mm" <c:if test="${reviewDTO.mysize == '290mm'}">selected="selected"</c:if>>290mm</option>
				<option value="295mm" <c:if test="${reviewDTO.mysize == '295mm'}">selected="selected"</c:if>>295mm</option>
				<option value="300mm" <c:if test="${reviewDTO.mysize == '300mm'}">selected="selected"</c:if>>300mm</option>
			</select>
			<br>
		
			
			
			
			
			
<!-- 		나의발볼 <input type="text" name="myfootball" id="myfootball"> -->
<!-- 		<br> 나의발등 <input type="text" name="myinstep" id="myinstep"> -->
		</div>
		<br>
		
		리뷰 내용 <br><textarea style="resize: none" name="rvcontent" id="rvcontent" rows="10" cols="50" >${reviewDTO.rvcontent}</textarea> <br>

		<div style="text-align: left;">
		 <input type="submit" value="상품 후기 수정" class="btn-slide">
 		<input type="reset" value="취소" class="btn-slide">
		</div>
		
	</form>

</div>

<br>
<br>

<footer class="bottom">
</footer>

</body>
</html>