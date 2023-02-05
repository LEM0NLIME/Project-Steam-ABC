<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" type="text/css" href="./css/login.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/login.js"> </script>

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

	<form id="sub" action="./MemberLogInCheck" 
		method="post" enctype="application/x-www-form-urlencoded">
		<fieldset class="border">

		<div style="margin: auto; width: 800px;">

			<br>

			<div>
				<h1 align="center">로그인</h1>
			</div>

			<div class="div1">
				<br>
				<h2>회원 로그인</h2>
			</div>
			
<c:choose>

<c:when test="${empty joinID}">

<c:choose>

<c:when test="${empty cookie.cookieID.value}">

			<div>
				<p>
					<label for="eid"> 아이디 </label> <input class="custom" type="text"
						id="eid" name="mid" size="110" placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
				</p>
			</div>
			
</c:when>
<c:otherwise>
			
			<div>
				<p>
					<label for="eid"> 아이디 </label> <input class="custom" type="text"
						id="eid" name="mid" size="110" value="${cookie.cookieID.value}"
						placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
				</p>
			</div>
			
</c:otherwise>			
</c:choose>
			
</c:when>
<c:otherwise>
			
			<div>
				<p>
					<label for="eid"> 아이디 </label> <input class="custom" type="text"
						id="eid" name="mid" size="110" value="${joinID}"
						placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
				</p>
			</div>
			
</c:otherwise>			
</c:choose>
			
			<div>
				<p>
					<label for="password"> 비밀번호 </label> <input class="custom"
						type="password" id="password" name="mpw" size="110"
						placeholder="비밀번호를 입력해 주세요.(특수문자를 포함한 영문,숫자  8~20자)">
				</p>
			</div>

			<div>
				<input type="checkbox" id="saveID" name="cookieID" value="cookieID">아이디 저장 
				<input type="checkbox" id="save" name="saveID" value="saveID">로그인 유지 
				<br>
			</div>

			<div style="text-align: center;">
				<br> <br> <input class="cursor" type="submit" value="로그인">
			</div>
			
			<div style="text-align: center; color: gray;">
			
			<br>
			
			<div style="color: lightgray">
			<span><a href="./MemberIdSearch">아이디 찾기</a></span>
			&nbsp;<span> · </span>&nbsp;
			<span><a href="./MemberPwSearch">비밀번호 찾기</a></span>
			&nbsp;<span> · </span>&nbsp;
			<span><a href="./MemberJoin">회원 가입</a></span>
			</div>
			
			</div>
			
			<br>
			
		</div>

		</fieldset>
	</form>

	<br>

	<footer class="bottom">
	</footer>

</body>
</html>