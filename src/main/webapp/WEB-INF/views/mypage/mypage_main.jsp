<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./resources/css/member.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

<c:choose>

<c:when test="${empty sessionID}">


<script type="text/javascript">

alert("로그인이 필요합니다.");
location.href="./MemberLogIn";

</script>



</c:when>
<c:otherwise>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>마이페이지</h1>
				</div>
			</div>
		</div>
	</header>
	
	<br>
	<br>

	<c:if test="${sessionID ne 'admin'}">
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4><a href="MemberInquiryDetail?mid=${sessionID}" style="color: black">내 정보 조회</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:if>
	<br>
	
	<c:choose>
		<c:when test="${sessionID eq 'admin'}">
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4><a href="ApplicationSelectAll" style="color: black">전체 취소/교환/반품/AS 신청목록 조회</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:when>
	<c:otherwise>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4><a href="ApplicationSelectMy?mid=${sessionID}" style="color: black">내 취소/교환/반품/AS 신청목록 조회</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${sessionID eq 'admin'}">
	<br>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4><a href="OrderSelectAll" style="color: black">전체 주문/배송 목록 조회</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:when>
	<c:otherwise>
	<br>
	
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4><a href="OrderSelectMy?mid=${sessionID}" style="color: black">내 주문/배송 목록 조회</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:otherwise>
	</c:choose>
</c:otherwise>

</c:choose>
	<br>
	<br>
	<footer class="bottom">

</footer>
</body>
</html>