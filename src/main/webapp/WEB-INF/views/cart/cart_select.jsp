<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/abc.svg" type="image/x-icon">

<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/product_cart.css"> 
<link rel="stylesheet" href="./css/product_common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/product_cart.js"></script>

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

<c:choose>
		<c:when test="${sessionID eq 'admin'}">
	
					<div class="anchor-content">
						<div class="container">
							<form>
							<!-- 관리자 장바구니 조회 -->
								<fieldset>
									<h3>장바구니 조회 관리자 페이지</h3>
									<br>
									<table class="admintable">
										<colgroup>
											<col style="width: 33.3%" />
											<col style="width: 33.3%" />
											<col style="width: 33.3%" />
										</colgroup>
										<thead class="adminthead">
										<tr>
											<th class="adminth">아이디</th>
											<th class="adminth">상품명</th>
											<th class="adminth">수량</th>
										</tr>
										</thead>
										<tr>
										<c:set var="cartlistcount" value="0" />
										<c:set var="rowtotal" value="0" />
										<c:set var="total" value="0" />
										<c:set var = "total" value = "0" />
											<c:forEach var="cartlistall" items="${cartlistall}">
												<tr class="cart_list">
													<td class="admintd">${cartlistall.mid}</td>
													<td class="admintd">${cartlistall.pname}</td>
													<td class="admintd">${cartlistall.cartcount}</td>
												</tr>
											</c:forEach>
										</tr>
									</table>
								</fieldset>
							</form>
						</div>
					</div>
</c:when>
<c:otherwise>

	<c:choose>
		<c:when test="${sessionID eq mid}">
			<c:choose>

				<c:when test="${size eq '0'}">
				<!-- 관리자 빈 장바구니 -->
					<div class="anchor-content">
						<div class="container">
							<form>
								<fieldset>
									<h3>장바구니</h3>
									
									<br>
									
									<!-- 회원 빈 장바구니 -->
									<table class="table table-bordered" id="tbl-product">
										<colgroup>
											<col style="width: 100%;" />
										</colgroup>
										<tr style="text-align:center;">
											<th>장바구니가 비어있습니다.</th>
										</tr>
									</table>
	
								</fieldset>
							</form>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 회원 장바구니 --> 
					<div class="anchor-content">
						<div class="container">
							<form action="./OrderInsertAsCart" method="post" id="orderInsertAsCart">
								<fieldset>
									<h3>장바구니</h3>
									<table class="table table-bordered" id="tbl-product">
										<colgroup>
											<col style="width: 2%;" />
											<col style="width: 18%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 10%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
										</colgroup>
										<tr style="text-align: center;">
											<th><input id="allCheck"  type="checkbox" name="allCheck" onchange="CalculateValue(); PnameArr();"/></th>
											<th>사진</th>
											<th>상품명</th>
											<th>수량</th>
											<th>판매가</th>
											<th>합계</th>
											<th>색상</th>
											<th>사이즈</th>
										</tr>
										<tr>
										<c:set var="cartlistcount" value="0" />
										<c:set var="rowtotal" value="0" />
										<c:set var="total" value="0" />
										<c:set var = "total" value = "0" />
											<c:forEach var="cartlist" items="${cartlist}">
											<c:set var="cartlistcount" value="${cartlist.cartcount + cartlistcount}"/>
											<c:set var="total" value="${total + cartlist.pprice * cartlist.cartcount}"/>
											<c:set var="rowtotal" value="${cartlist.pprice * cartlist.cartcount}" />
												<tr class="cart_list">
													<td>
													<input name="RowCheck" type="checkbox" value="${cartlist.pcartid}" id="cartCheck" onchange="CalculateValue(); AllCheckOff(); PnameArr();"></td>
													<td><a href="./ProductSelectDetail?pname=${cartlist.pname}"><img src="${pageContext.request.contextPath}/${cartlist.pthumbimg}" class="cartimg"></a></td>
													<td class="cart_list_td" style="padding-top:10%">${cartlist.pname}</td>
													<td class="cart_list_td" style="padding-top:10%">${cartlist.cartcount}</td>
													<td class="cart_list_td" style="padding-top:10%">${cartlist.pprice}원</td>
													<td class="cart_list_td" style="padding-top:10%">${rowtotal}원</td>
													<td class="cart_list_td" style="padding-top:10%">${cartlist.pcolor}</td>
													<td class="cart_list_td" style="padding-top:10%">${cartlist.psize}</td>
												</tr>
												<input name="PnameCheck" type="hidden" value="${cartlist.pname}" id="PnameCheck" >
											</c:forEach>
										</tr>
									</table>
									
									
									<table class="table table-bordered" id="tbl-total">
										<thead>
											<tr>
												<th class="cart_table_th">장바구니 총 수량</th>
												<th>장바구니 총 금액</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<td style="border:none; float:right;" ><input type="hidden" readonly="readonly" name="cart_total"
												id="total-qty" value="${cartlistcount}">${cartlistcount} 개</td>
											<td style="padding-left:52%;" ><c:out value="${total}"/> 원</td>
										</tr>
										</tbody>
									</table>
									
									<div style="text-align: right; margin-bottom: 20px;">
										<input type="button" value="선택 삭제" class="btn btn-danger"
											id="btn-delete" onclick="deleteValue();">
									</div>
									
									<table class="table table-bordered" id="tbl-order"
										style="display: none;">
										<thead>
											<tr>
												<th>상품명</th>
												<th>가격</th>
												<th>수량</th>
												<th>총금액</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
									<table class="table table-bordered" id="tbl-total">
										<thead>
											<tr>
												<th class="cart_table_th">구매 총 수량</th>
												<th>구매 총 금액</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<td>
												<div class="cart_total_box"  >
													<input type="text" readonly="readonly" class="cart_input_box" id="cartQuantity" value="0" style="border: none;">개
												</div>
											</td>
											<td>
												<div class="cart_total_box"  >
												<input type="text" readonly="readonly" class="cart_input_box"  id="cartTotal" value="0" style="border: none;"> 원
												</div>	
											</td>
										</tr>
										</tbody>
									</table>
									<div class="product_sb_event">
									<input type="hidden" name="pname"  id="pnameArr" value="">
									<input type="hidden" name="mid" value="${sessionID}">
									<input type="submit" name="product_sb" value="구매하기" class="btn btn-danger btn-xs" style="float: right;">
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("로그인 해주세요.");
				location.href="./MemberLogIn";	
			</script>
		
		</c:otherwise>
	</c:choose>	
	
</c:otherwise>
</c:choose>
			
<br>
			
<div>
<footer class="bottoms"> </footer>
</div>
			
</body>

</html>