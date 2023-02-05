
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./css/eventcommon.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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


	<div class="eventcenter">
		<div class="eventmargin">
			<div style="text-align: center;">
				<h1>이벤트</h1>
			</div>
			<ul class="eventSelectAll" id="eventSelectAll">

				<c:forEach var="list" items="${list}">

					<li>
						<div class="eventcenter">
							<a href="./EventSelectDetail?eno=${list.eno}"> <img
								style="width: 350px; height: 500px;"
								src="${pageContext.request.contextPath}/${list.eimg}" />
							</a>
						</div>
						
						<div class="listcontent">
						<a href="./EventSelectDetail?eno=${list.eno}">
						${list.eno}
						</a>
						</div>
						
						<div class="listcontent">
						<a href="./EventSelectDetail?eno=${list.eno}">
						${list.ename}
						</a>
						</div>
						
						<div class="listcontent">
						<a href="./EventSelectDetail?eno=${list.eno}">
						${list.eperiod}
						</a>
						</div>

					</li>




				</c:forEach>

			</ul>


		</div>
	</div>

	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="EventSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">

				<li><a href="EventSelect${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="EventSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<c:if test="${sessionID eq 'admin'}">
		<div style="margin-bottom: 20px; margin-left: 30px;">

			<button class="btn-c" onclick="location.href='./EventInsert'">이벤트 등록</button>
		</div>
	</c:if>


	<footer class="bottom"> </footer>
</body>
</html>