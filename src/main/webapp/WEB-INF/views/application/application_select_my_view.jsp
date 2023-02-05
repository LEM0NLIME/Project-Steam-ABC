<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
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
		<div>
			<h3>
				<i class="fas fa-file-alt mr-sm-1"></i>
				취소/교환/반품/AS 신청 목록
			</h3>
			<p align="right">
			전체 글 : 
			<strong>${aplListCountMy}</strong>
			개
			</p>
		</div>

<c:choose>
<c:when test="${empty myList}">
	<script type="text/javascript">
		alert("신청 내역이 없습니다.");
	</script>
	
	
		<table class="table table-hover">
							<tr class="text-center">
								<td><h5>신청된 목록이 없습니다.</h5></td>
							</tr>
		</table>
</c:when> 
<c:otherwise>

	
		<table class="table table-hover">
					<thead class="thead-light">
						<tr class="text-center">
							<th>아이디</th>
							<th>브랜드</th>
							<th>상품명</th>
							<th>색상</th>
							<th>사이즈</th>
							<th>내용</th>
							<th>사유</th>
							<th>상세 정보</th>
						</tr>
					</thead>
					<c:forEach var="list" items="${myList}">
						<tbody>
							<tr class="text-center">
								<td>${list.mid}</td>
								<td>${list.pbrand}</td>
								<td><a href="./ProductSelectDetail?pname=${list.pname}">${list.pname}</a></td>
								<td>${list.pcolor}</td>
								<td>${list.psize}</td>
								<td>${list.aplcontents}</td>
								<td>${list.aplreasons}</td>
								<td><a href="./ApplicationSelectDetail?aplno=${list.aplno}">상세조회</a></td>
							</tr>
						</tbody>
					</c:forEach>
		</table>
	
	</c:otherwise>
	</c:choose>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a href="ApplicationSelectMy${pageMaker.makeQuery(pageMaker.startPage -1)}">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li><a href="ApplicationSelectMy${pageMaker.makeQuery(idx)}&mid=${sessionID}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="ApplicationSelectMy${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</section>
	<br>
	<br>
	
	<footer class="bottom">

	</footer>
	
</body>
</html>