<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC_MART</title>
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./resources/css/member.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./js/orderinsert.js" type="text/javascript"></script>
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
					<h1>상품 구매</h1>
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
							<h3>주문하기</h3>
						</div>
						<div align="center">
							<form action="./OrderInsert" method="post" name="orderinsert" id="orderinsert" enctype="application/x-www-form-urlencoded">
								<fieldset>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pimg"></label>
										<div class="detail-box-left">
											<a href="./ProductSelectDetail?pname=${orderDTO.pname}"><img src="${pageContext.request.contextPath}/${orderDTO.pimg}"></a>
											<input type="hidden" name="pimg" id="pimg" value="${orderDTO.pimg}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pbrand"></label>
										<div>
											브랜드 : ${orderDTO.pbrand}
										<input type="hidden" name="pbrand" id="pbrand" value="${orderDTO.pbrand}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pname"></label>
										<div>
											상품명 : ${orderDTO.pname}
										<input type="hidden" name="pname" id="pname" value="${orderDTO.pname}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="psize"></label>
										<div>상품 사이즈 : ${orderDTO.psize}</div>
											<input type="hidden" name="psize" id="psize" value="${orderDTO.psize}">
									<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pcolor"></label>
										<div>
											색상 : ${orderDTO.pcolor}
										<input type="hidden" name="pcolor" id="pcolor" value="${orderDTO.pcolor}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pprice"></label>
										<div>
											가격 : ${orderDTO.pprice}
										<input type="hidden" name="pprice" id="pprice" value="${orderDTO.pprice}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pquantity"></label>
										<div>
											수량 : ${orderDTO.pquantity}
										<input type="hidden" name="pquantity" id="pquantity" value="${orderDTO.pquantity}" >
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 5px solid black;">
										<label for="ptotal"></label>
										<div>
										총 가격 : ${orderDTO.pprice * orderDTO.pquantity}
										<input type="hidden" name="ptotal" id="ptotal" value="${orderDTO.pprice * orderDTO.pquantity}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="mid"></label>
										<div>
											아이디 : ${sessionID}
										<input type="hidden" name="mid" id="mid" value="${sessionID}">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="mname"></label>
										<div>
											이름 : <input type="text" name="mname" id="mname">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="ordaddress"></label>
										<div>
											<div>배송지</div>
											<textarea style="resize: none" name="ordaddress" id="ordaddress" rows="5" cols="50"></textarea>
										</div>
										<br>
									</div>
									<div>
										<label for="ordsituation"></label>
										<input type="hidden" name="ordsituation" id="ordsituation" value="입금 대기">
									</div>
									<nav>
										<br>
										<div>
											<button type="submit" class="btn btn-outline-info">
												주문하기
											</button>
											<button type="reset" id="clear" class="btn btn-outline-info">
												지우기
											</button>
											<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderConfirm?pname=${orderDTO.pname}'">
												돌아가기
											</button>
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
	</c:otherwise>
	</c:choose>
	<footer class="bottom">

</footer>
</body>
</html>