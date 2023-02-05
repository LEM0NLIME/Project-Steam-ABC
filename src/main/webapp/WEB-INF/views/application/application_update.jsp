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
<script src="./js/applicationupdate.js" type="text/javascript"></script>
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

<div class="navigator">

<span class="navBlankLeft">
<span class="navContentL">
<a href="./ProductSelect" style="color: yellow"> <font class="fontInterval">상품</font> </a>
<a href="./EventSelect" style="color: yellow"> <font class="fontInterval">기획전</font> </a>
<a href="#" style="color: yellow"> <font class="fontInterval">상품리뷰</font> </a>
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
<c:when test="${sessionID eq applicationDTO.mid or sessionID eq 'admin'}">
	
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>마이페이지</h1>
				</div>
			</div>
		</div>
	</header>
	<section class="py-4 mb-4 bg-light">
	</section>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" align="center">
							<h3>취소/교환/반품/AS 신청 수정</h3>
						</div>
	<div align="center">
		<form action="./ApplicationUpdate?aplno=${applicationDTO.aplno}" method="post" id="applicationupdate" enctype="application/x-www-form-urlencoded">
			<fieldset>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
					<label for="aplno"></label>
						<div>
							글 번호 : ${applicationDTO.aplno}
						</div>
					<br>
				</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
						<label for="mid"></label>
						<div>
							아이디 : ${applicationDTO.mid}
						</div>
						<br>
					</div>
					<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
						<label for="pname"></label>
						<div>
							상품명 : ${applicationDTO.pname}
						</div>
					<br>
					</div>
					<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
						<label for="aplcontents"></label>
						<div>
							| <input type="radio" name="aplcontents" id="aplcontents" value="취소 신청" checked="checked"> 취소 신청 |
							<input type="radio" name="aplcontents" id="aplcontents" value="교환 신청"> 교환 신청 |
							<input type="radio" name="aplcontents" id="aplcontents" value="반품 신청"> 반품 신청 |
							<input type="radio" name="aplcontents" id="aplcontents" value="AS 신청"> AS 신청 |
						</div>
						<br>
					</div>
					
					<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
									<label for="psize"></label>
										<div>
										(기존 주문 사이즈 : ${applicationDTO.psize})
										</div>
										<br>
										</div>
					
					<script type="text/javascript">
										
											$(function() {
												
												$("#changeApl").hide();
												
												$("input[id='aplcontents']").change(function () {
											     
													var contentss = $("input[id='aplcontents']:checked").val();
													
													if (contentss == '교환 신청') {
														
														$("#changeApl").show();
														
													}else {
														
														$("#changeApl").hide();
														
													}
													
							 
											});

												
												
											});
										</script>
										
									<div id="changeApl">
									
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<br>
										<label for="psize"> 상품 사이즈 </label>
										<div class="psize">
										
										<c:choose>
										<c:when test="${applicationDTO.psize eq '220'}">
										<input type="radio" name="psize" id="psize" value="220" checked="checked"> 220 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="220"> 220 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '230'}">
										<input type="radio" name="psize" id="psize" value="230" checked="checked"> 230 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="230"> 230 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '240'}">
										<input type="radio" name="psize" id="psize" value="240" checked="checked"> 240 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="240"> 240 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '250'}">
										<input type="radio" name="psize" id="psize" value="250" checked="checked"> 250 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="250"> 250 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '260'}">
										<input type="radio" name="psize" id="psize" value="260" checked="checked"> 260 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="260"> 260 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '270'}">
										<input type="radio" name="psize" id="psize" value="270" checked="checked"> 270 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="270"> 270 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${applicationDTO.psize eq '280'}">
										<input type="radio" name="psize" id="psize" value="280" checked="checked"> 280 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="280"> 280 &nbsp;
										</c:otherwise>
										</c:choose>
										</div>
									<br>
									</div>
									
									</div>
					
					<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
						<br>
						<label for="aplreasons">신청 사유</label>
							<div>
								<textarea style="resize: none" name="aplreasons" id="aplreasons" rows="5" cols="50"></textarea>
							</div>
						<br>
						</div>
						<nav>
							<br>
								<div>
									<button type="submit" class="btn btn-outline-info">
										수정 완료
									</button>
									<button type="reset" id="clear" class="btn btn-outline-info">
										지우기
									</button>
									<button type="button" class="btn btn-outline-info" onclick="location.href='./ApplicationConfirm2?aplno=${applicationDTO.aplno}'">
												돌아가기
											</button>
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
						</fieldset>
					</form>
					</div>
				</div>
	
	</div>
	</div>
	</div>
	</section>
</c:when>

<c:otherwise>
 		<script type="text/javascript">
 			alert("수정 권한이 없습니다.");
 			history.back();
			</script>
</c:otherwise>
</c:choose>
	<footer class="bottom">

</footer>
</body>
</html>