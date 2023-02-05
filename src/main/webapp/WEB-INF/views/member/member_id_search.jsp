<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/login.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/id_search.js"></script>

<title>ABC_MART</title>

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

<form action="./MemberIdSearchView" id="idSearchInspection">

<div style="margin: auto; width: 800px;">

			<br>

			<div>
				<h1 align="center">아이디 찾기</h1>
			</div>

			<div class="div1">
				<br>
				<h2>회원 아이디 찾기</h2>
			</div>

			<div>
				<p>
					<label for="mname"> 회원 이름 </label> <input class="custom" type="text"
						id="mname" name="mname" size="110" placeholder="성함을 입력해주세요">
				</p>
			</div>

			<div>
				<p>
					<label for="mphonenum"> 휴대폰 번호 </label> <input class="custom"
						type="text" id="mphonenum" name="mphonenum" size="110"
						placeholder="휴대폰 번호를 입력해 주세요.">
				</p>
			</div>


			<div style="text-align: center;">
				<br> <br> <input class="cursor" type="submit" value="아이디 찾기">
			</div>
			
			<div style="text-align: center; color: gray;">
			
			<br>

			</div>
			
			<br>
			
		</div>
		
</form>

	<br>

	<footer class="bottom">
	</footer>

</body>
</html>