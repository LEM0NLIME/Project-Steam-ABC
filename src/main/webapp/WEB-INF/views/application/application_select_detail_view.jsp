<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
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

	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>마이페이지</h1>
				</div>
			</div>
		</div>
	</header>

<section>
	<div align="center">
		<i class="fas fa-sticky-note mr-sm-1"></i><h3>신청 내용</h3>
	</div>
	
	<br>
	
	<div align="center">
	<div>
	
	<table border="1">
	<c:if test="${sessionID eq 'admin'}">
		<tr>
			<th>번호</th>
			<td>${applicationDTO.aplno}</td>
		</tr>
	</c:if>
		<tr>
			<th>아이디</th>
			<td>${applicationDTO.mid}</td>
		</tr>
		<tr>
			<th>브랜드</th>
			<td>${applicationDTO.pbrand}</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><a href="./ProductSelectDetail?pname=${applicationDTO.pname}">${applicationDTO.pname}</a></td>
		</tr>
		<tr>
			<th>색상</th>
			<td>${applicationDTO.pcolor}</td>
		</tr>
		<tr>
			<th>사이즈</th>
			<td>${applicationDTO.psize}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${applicationDTO.aplcontents}</td>
		</tr>
		<tr>
			<th>사유</th>
			<td>${applicationDTO.aplreasons}</td>
		</tr>
	</table>
	</div>
	</div>
	<nav>
	<br>
		<div align="center">
			<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationUpdate?aplno=${applicationDTO.aplno}'">
				내용 수정
			</button>
			
			<c:choose>

			<c:when test="${sessionID eq 'admin'}">
			<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationDelete?aplno=${applicationDTO.aplno}&aplstate=delete'">
				신청 정보 삭제
			</button>
			</c:when>
			
			<c:otherwise>
			<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationDelete?aplno=${applicationDTO.aplno}&aplstate=cancel'">
				신청 취소
			</button>
			</c:otherwise>
			
			</c:choose>
			
			<c:choose>
			<c:when test="${sessionID eq 'admin'}">
			
			<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationSelectAll'">
				글 목록
			</button>
			
			</c:when>
			
			<c:otherwise>
			
			<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationSelectMy?mid=${sessionID}'">
				글 목록
			</button>
			
			</c:otherwise>
			</c:choose>
			
		</div>
		<br>
		</nav>
</section>

<footer class="bottom">

</footer>

</body>
</html>