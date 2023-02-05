<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./css/eventrare.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./js/deletevalidity.js" type="text/javascript"></script>

<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
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
	<div style="width: 1200px; margin: auto">
		<div class="pt-4" style="text-align: center;">
			<h1>이벤트 정보 상세보기</h1>
		</div>
		<div class="eventcenter">

			<ul class="eventSelect" id="eventSelect">
				<li class="upperLi">
					<div id="contentimg" style="float: left;">

						<img src="${pageContext.request.contextPath}/${eventDTO.eimg}" />

					</div>
					<div style="display: inline-block; margin-left: 100px;">
						<div style="margin-top: 50px">

							<div style="text-align: center;">
								<h5>${eventDTO.eno}</h5>
							</div>

							<div style="text-align: center;">
								<h1>${eventDTO.ename}</h1>
							</div>

							<div style="text-align: center;">
								<h5>${eventDTO.etype}</h5>
							</div>
						</div>


						<div class="detailtable">
							<table class="detailtablee">

								<tr>
									<th>이벤트 종류</th>
									<td>${eventDTO.etype}</td>
								</tr>
								<tr>
									<th>기간</th>
									<td>${eventDTO.eperiod}</td>
								</tr>
								<tr>
									<th>대상 품목</th>
									<td>${eventDTO.etarget}</td>
								</tr>
								<tr>
									<th>할인율</th>
									<td>${eventDTO.edcrate}</td>
								</tr>
								<tr>
									<th>게시일</th>
									<td>${eventDTO.edate}</td>
								</tr>




							</table>
						</div>


					</div>


				</li>




			</ul>

		</div>
		<div>
			<ul>
				<c:if test="${sessionID eq 'admin'}">
				<li class="li">
					<button class="btn-b"
						onclick="location.href='./EventUpdate?eno=${eventDTO.eno}&edate=${eventDTO.edate}'">이벤트
						수정</button>
				</li>
				<li class="li">
					<form action="./EventDelete" method="get" id="eventDelete"
						enctype="application/x-www-form-urlencoded">
						<input class="btn-b" type="submit" value="이벤트 삭제"> <input
							type="hidden" name="eno" value="${eventDTO.eno}">
					</form>
				</li>
					</c:if>
				<li class="li">
					<button class="btn-a" style="margin-left: 300px;"
						onclick="location.href='./EventSelect'">이벤트 목록</button>
				</li>


			</ul>
		</div>




		<br>
		<br>
		<br>
		<br>

	</div>
	<footer class="bottom"> </footer>
</body>
</html>