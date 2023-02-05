<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding ="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

Cookie[] cookies = request.getCookies();

if(cookies != null) {
	
	for(Cookie cookie : cookies) {
		
		if(cookie.getName().equals("saveID")) {
			
			String id = cookie.getValue();
			
			session.setAttribute("sessionID", id);
			
		}
	}
}

%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC MART</title>

<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
 
 <script type="text/javascript">

 </script>
 
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

<div id="divMargin">

<div class="autoplay">

<a href="#"> <img class="slider" src="./img/banner-1.png" style="height: 500px" style="width: 1000px"> </a>
<a href="#"> <img class="slider" src="./img/banner-2.png" style="height: 500px" style="width: 1000px"> </a>
<a href="#"> <img class="slider" src="./img/banner-3.png" style="height: 500px" style="width: 1000px"> </a>
<a href="#"> <img class="slider" src="./img/banner-4.png" style="height: 500px" style="width: 1000px"> </a>
<a href="#"> <img class="slider" src="./img/banner-5.png" style="height: 500px" style="width: 1000px"> </a>
<a href="#"> <img class="slider" src="./img/banner-6.png" style="height: 500px" style="width: 1000px"> </a>

</div>

<div class="arrowSlider" id="centre" style="position: relative; right: 7.5px; top: -26px;">

	<span class="prev" id="arrow-prev" style="position: relative; left:12px;"><img src="./img/previous-symbol.png" class="arrows"></span>
	<span class="play" id="play"><img src="./img/start-symbol.png" class="arrows"></span>
	<span class="stop" id="pause"><img src="./img/stop-symbol.png" class="arrows"></span>
	<span class="next" id="arrow-next" style="position: relative; right:12px;"><img src="./img/next-symbol.png" class="arrows" style="float:'left'"></span>

</div>

<div>

<br>
<br>

</div>

<span style="float: left" class="spanMargin">
<a href="#"> <img class="slider" src="./img/merInfo.PNG" style="height: 300px" style="width: 300px"> </a>
</span>

<div class="bodyBlank">

<span class="autoplay2">

<a href="#"> <img class="slider" src="./img/mer-1.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-2.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-3.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-4.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-5.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-6.png" style="height: 300px" style="width: 300px"> </a>
<a href="#"> <img class="slider" src="./img/mer-7.png" style="height: 300px" style="width: 300px"> </a>

</span>

</div>


<br>
<br>
<br>

</div>


<footer class="bottom">

</footer>

  
</body>
</html>