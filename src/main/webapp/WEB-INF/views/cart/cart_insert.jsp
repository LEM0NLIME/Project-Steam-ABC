<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/product_cart.css">
<link rel="stylesheet" href="./css/product_common.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script type="text/javascript">

	
	function confirmed() {
		
		if (confirm("작성한 내용은 저장되지 않습니다. 돌아가시겠습니까?")) {
			location.href="./CartSelectDetail?mid=${sessionID}";
		} else {
			return false;
		}
		
	} 


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

	<div class="anchor-content">
		<div class="container">
			<form action="./OrderInsert" method="post" name="cartinsert" id="cartinsert">
				<fieldset>
					<h3>구매정보 확인</h3>
					<table class="table table-bordered" id="tbl-product">
						<colgroup>
							<col style="width: 24%;" />
							<col style="width: 14%" />
							<col style="width: 10%" />
							<col style="width: 16%" />
							<col style="width: 16%" />
							<col style="width: 13%" />
							<col style="width: 15%" />

						</colgroup>
						<tr style="text-align: center;">
							<th>사진</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매가</th>
							<th>합계</th>
							<th>색상</th>
							<th>사이즈</th>
						</tr>
							<c:set var="pquantity" value="0" />
							<c:set var="rowtotal" value="0" />
							<c:set var="total" value="0" />
							<c:set var="total" value="0" />
							<c:forEach var="list" items="${lists}">
								<c:set var="cartlistcount"
									value="${cartlistcount + list.get(0).pquantity}" />
								<c:set var="total"
									value="${total + list.get(0).pprice * list.get(0).pquantity}" />
								<c:set var="rowtotal"
									value="${list.get(0).pprice * list.get(0).pquantity}" />
								<tr class="cart_list">
									<td><a href="./ProductSelectDetail?pname=${list.get(0).pname}">
									<img src="${pageContext.request.contextPath}/${list.get(0).pimg}" class="cartimg"></a>
									<input type="hidden" name="pimg" value="${list.get(0).pimg}">
									</td>
									<td class="cart_list_td" style="padding-top: 10%">${list.get(0).pname}
									<input type="hidden" name="pname" value="${list.get(0).pname}">
									</td>
										
									<td class="cart_list_td" style="padding-top: 10%">${list.get(0).pquantity}
									<input type="hidden" name="pquantity" value="${list.get(0).pquantity}">
									</td>

									<td class="cart_list_td" style="padding-top: 10%">${list.get(0).pprice}원
									<input type="hidden" name="pprice" value="${list.get(0).pprice}">
									</td>

									<td class="cart_list_td" style="padding-top: 10%">${rowtotal}원
									<input type="hidden" name="ptotal" value="${rowtotal}">
									</td>

									<td class="cart_list_td" style="padding-top: 10%">${list.get(0).pcolor}
									<input type="hidden" name="pcolor" value="${list.get(0).pcolor}">
									</td>

									<td class="cart_list_td" style="padding-top: 10%">${list.get(0).psize}
											<input type="hidden" name="psize" id="psize" value="${list.get(0).psize}">
									</td>
								</tr>
								
								<input type="hidden" name="pbrand" value="${list.get(0).pbrand}">
								
							</c:forEach>
							
					</table>

						<input name="PnameCheck" type="hidden"
									value="${list.get(0).pname}" id="PnameCheck">


					<table class="table table-bordered" id="tbl-total">
						<thead>
							<tr>
								<th class="cart_table_th">구매 총 수량</th>
								<th>구매 총 금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="border: none; float: right;"><input
									type="hidden" readonly="readonly" name="cart_total"
									id="total-qty" value="${cartlistcount}">${cartlistcount}
									개</td>
								<td style="padding-left: 52%;"><c:out value="${total}" />
									원</td>
							</tr>
						</tbody>
					</table>
					
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
									<div>
											<button type="submit" class="btn btn-outline-info">
												주문하기
											</button>
											<button type="reset" id="clear" class="btn btn-outline-info">
												지우기
											</button>
											<button type="button" class="btn btn-outline-info" onclick="confirmed()">
												돌아가기
											</button>
										</div>
				</fieldset>
			</form>
		</div>
	</div>


<div>
	<footer class="bottom"> </footer>
</div>
</body>
</html>