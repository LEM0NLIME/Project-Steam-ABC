<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/join.css"/>

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

<br>
<br>

<div style="text-align: center; margin: auto; width: 1200px; height: 200px; margin-top: 80px;">

	<c:choose>
	
	<c:when test="${searchResult eq 'available'}">
	
	<div>
	
	<div>
	회원님의 아이디는 &nbsp;<font style="color: blue;">${memberDTO.mid}</font>&nbsp; 입니다.
	</div>
	
	<br>
	<br>
	
	<form action="./MemberLogInAsSearch" method="POST">
	
	<div>
	<input type="hidden" name="mid" value="${memberDTO.mid}">
	<button class="default-btn" type="submit" style="cursor: pointer;">로그인</button>
	<button class="default-btn" type="button" style="cursor: pointer;" onclick="location.href='./MemberPwSearch'">비밀번호 찾기</button>
	</div>
	
	</form>
	
	</div>
	
	</c:when>
	
	<c:otherwise>
	
	<script type="text/javascript">
	
	alert("존재하지 않는 회원입니다. 다시 입력해주세요.");
	history.back();
	
	</script>
	
	</c:otherwise>
	
	</c:choose>
	
</div>

<br>

	<br>

	<footer class="bottom">
	</footer>

</body>
</html>