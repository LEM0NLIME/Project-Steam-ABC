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
<script src="./js/orderupdate.js" type="text/javascript"></script>
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
	<section class="py-4 mb-4 bg-light">
	</section>
	<section id="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" align="center">
							<h3>주문 내용 변경</h3>
						</div>
	<div align="center">
		<form action="./OrderUpdate?ordno=${orderDTO.ordno}" method="post" name="orderupdate" id="orderupdate" enctype="application/x-www-form-urlencoded">
			<fieldset>
			<c:if test="${sessionID eq 'admin'}">
			<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="ordno"></label>
										<div>
											번호 : ${orderDTO.ordno}
										</div>
										<br>
									</div>
									</c:if>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pbrand"></label>
										<div>
											<a href="./ProductSelectDetail?pname=${orderDTO.pname}"><img src="${pageContext.request.contextPath}/${orderDTO.pimg}"></a>
										</div>
										<br>
									</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pbrand"></label>
										<div>
											브랜드 : ${orderDTO.pbrand}
										</div>
										<br>
									</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pname"></label>
										<div>
											상품명 : ${orderDTO.pname}
										</div>
										<br>
									</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="psize"></label>
										<div>상품 사이즈</div>
										<br>
										<div class="psize">
										
										<c:choose>
										<c:when test="${orderDTO.psize eq '220'}">
										<input type="radio" name="psize" id="psize" value="220" checked="checked"> 220 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="220"> 220 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '230'}">
										<input type="radio" name="psize" id="psize" value="230" checked="checked"> 230 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="230"> 230 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '240'}">
										<input type="radio" name="psize" id="psize" value="240" checked="checked"> 240 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="240"> 240 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '250'}">
										<input type="radio" name="psize" id="psize" value="250" checked="checked"> 250 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="250"> 250 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '260'}">
										<input type="radio" name="psize" id="psize" value="260" checked="checked"> 260 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="260"> 260 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '270'}">
										<input type="radio" name="psize" id="psize" value="270" checked="checked"> 270 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="270"> 270 &nbsp;
										</c:otherwise>
										</c:choose>
										<c:choose>
										<c:when test="${orderDTO.psize eq '280'}">
										<input type="radio" name="psize" id="psize" value="280" checked="checked"> 280 &nbsp;
										</c:when>
										<c:otherwise>
										<input type="radio" name="psize" id="psize" value="280"> 280 &nbsp;
										</c:otherwise>
										</c:choose>
										</div>
									<br>
									</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pcolor"></label>
										<div>
											색상 : ${orderDTO.pcolor}
										</div>
										<br>
									</div>
				<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pquantity"></label>
										<div>
																						
											수량 : 
											<input type="text" name="pquantity" id="pquantity" value="${orderDTO.pquantity}" style="border:none; width: 40px">
											<input type='button' onclick='count("plus")' value='+'/> 
											<input type='button' onclick='count("minus")' value='-'/>
											
											<script type="text/javascript">
											function count(type)  {
												
												  const quantity = $("#pquantity").val();

												  if(type === 'plus') {

													  $("#pquantity").val(parseInt(quantity) + 1);
													  $("#ptotal").val($("#pquantity").val() * ${orderDTO.pprice});
													
												  }else if(type === 'minus')  {
													  
													  if( $("#pquantity").val() > 0) {
														  
													  $("#pquantity").val(quantity - 1);
													  $("#ptotal").val($("#pquantity").val() * ${orderDTO.pprice});
														  
													  }
													  
												  }
												}
											</script>
											
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="pprice"></label>
										<div>
											가격 : <input type="text" name="pprice" id="pprice" value="${orderDTO.pprice}" readonly style="border:none; width: 70px">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 5px solid black;">
										<label for="ptotal"></label>
										<div>
											총 가격 : <input type="text" name="ptotal" id="ptotal" value="${orderDTO.pprice * orderDTO.pquantity}" readonly style="border:none; width: 80px">
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="mid"></label>
										<div>
											아이디 : ${orderDTO.mid}
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="mname"></label>
										<div>
											이름 : ${orderDTO.mname}
										</div>
										<br>
									</div>
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="ordaddress"></label>
										<div>
											<div>배송지</div>
											<textarea style="resize: none" name="ordaddress" id="ordaddress" rows="5" cols="50">${orderDTO.ordaddress}</textarea>
										</div>
										<br>
									</div>
									<c:choose>
									<c:when test="${sessionID eq 'admin'}">
									<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
										<label for="ordsituation"></label>
										<div>
											<div>주문 상태</div>
											<br>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '입금 대기'}">
											| <input type="radio" name="ordsituation" id="ordsituation" value="입금 대기" checked="checked"> 입금 대기 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="입금 대기"> 입금 대기 |
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '결제 완료'}">
											<input type="radio" name="ordsituation" id="ordsituation" value="결제 완료" checked="checked"> 결제 완료 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="결제 완료"> 결제 완료 |
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '상품 준비중'}">
											<input type="radio" name="ordsituation" id="ordsituation" value="상품 준비중" checked="checked"> 상품 준비중 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="상품 준비중"> 상품 준비중 |
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '픽업 준비 완료'}">
											<input type="radio" name="ordsituation" id="ordsituation" value="픽업 준비 완료" checked="checked"> 픽업 준비 완료 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="픽업 준비 완료"> 픽업 준비 완료 |
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '배송중'}">
											<input type="radio" name="ordsituation" id="ordsituation" value="배송중" checked="checked"> 배송중 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="배송중"> 배송중 |
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${orderDTO.ordsituation eq '배송 완료'}">
											<input type="radio" name="ordsituation" id="ordsituation" value="배송 완료" checked="checked"> 배송 완료 |
											</c:when>
											<c:otherwise>
											<input type="radio" name="ordsituation" id="ordsituation" value="배송 완료"> 배송 완료 |
											</c:otherwise>
											</c:choose>
										</div>
										<br>
									</div>
									</c:when>
									<c:otherwise>
										<div style="height: auto; width: 100%; border-bottom: 1px dotted black;">
											<label for="ordsituation"></label>
											<div>
												<input type="hidden" name="ordsituation" id="ordsituation" value="${orderDTO.ordsituation}">
											</div>
										</div>
									</c:otherwise>
									</c:choose>
									
					<nav>
						<br>
							<div>
								<button type="submit" class="btn btn-outline-info">
									변경 완료
								</button>
								<button type="reset" id="clear" class="btn btn-outline-info">
									지우기
								</button>
								<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderConfirm2?ordno=${orderDTO.ordno}'">
												돌아가기
											</button>
								<c:choose>
			<c:when test="${sessionID eq 'admin'}">
								<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderSelectAll'">
									글 목록
								</button>
					</c:when>
					<c:otherwise>
								<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderSelectMy?mid=${sessionID}'">
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
			
	<footer class="bottom">

</footer>
</body>
</html>