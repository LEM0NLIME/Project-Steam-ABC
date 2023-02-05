<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<link rel="shortcut icon" href="img/abc.svg" type="image/x-icon">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/product_detail.css">
<link rel="stylesheet" href="./css/product_common.css">
<link rel="stylesheet" href="./css/product_detail_common.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div class="imgBlank">

		<span class="blank"> <a href="./abc_main.jsp"> <img
				name="ABCMain" src="./img/ABC.png" class="image">
		</a>
		</span> <span class="blank"> <span> <a
				href="./CartSelectDetail?mid=${sessionID}"> <img name="cartMain"
					src="./img/cart-symbol.png" class="icon">
			</a>
		</span> <c:if test="${sessionID eq 'admin'}">


				<span> <a href="./MemberInquiryAll"> <img name="Members"
						src="./img/member-symbol.png" class="icon">
				</a>
				</span>

			</c:if> <span> <a href="./MemberJoin"> <img name="JoinMain"
					src="./img/join-symbol.png" class="icon">
			</a>
		</span> <c:choose>

				<c:when test="${empty sessionID}">

					<span> <a href="./MemberLogIn"> <img name="LogInMain"
							src="./img/login-symbol.png" class="icon">
					</a>
					</span>

				</c:when>
				<c:otherwise>

					<span> <a href="./MemberLogOut"> <img name="LogOutMain"
							src="./img/logout-symbol.png" class="icon">
					</a>
					</span>

				</c:otherwise>

			</c:choose>

		</span>

	</div>

	<div class="navigator">

		<span class="navBlankLeft"> <span class="navContentL"> <a
				href="./ProductSelect" style="color: yellow"> <font
					class="fontInterval">상품</font>
			</a> <a href="./EventSelect" style="color: yellow"> <font
					class="fontInterval">기획전</font>
			</a> <a href="./ReviewSelect" style="color: yellow"> <font
					class="fontInterval">상품리뷰</font>
			</a>
		</span>
		</span> <span class="navBlankRight"> <span class="navContentR">
				<a href="./MyPageMain" style="color: white"> <font
					class="fontInterval">마이페이지</font>
			</a> <a href="./CartSelectDetail?mid=${sessionID}" style="color: white">
					<font class="fontInterval">장바구니</font>
			</a> <a href="./CustomerListPage" style="color: white"> <font
					class="fontInterval">고객센터</font>
			</a>
		</span>
		</span>

	</div>

	<div class="cont">
		<div id="detail">
			<div class="detail-box">
				<div class="detail-box-left">
					<div class="detail-img"
						style="width: 375px; height: 375px; overflow: hidden; margin: auto;">
						<img src="${pageContext.request.contextPath}/${productDTO.pimg}"
							style="width: 100%; height: 100%; object-fit: fill;">
					</div>
				</div>
				<div class="detail-box-right">
					<div class="productbrand">
						<p>브랜드 : ${productDTO.pbrand }</p>

					</div>
					<div class="productname">
						<p>상품명 : ${productDTO.pname }</p>
					</div>
					<div class="productcolor">
						<div class="productcolor">상품색 : ${productDTO.pcolor}</div>
					</div>
					<div class="productprice">상품 가격 : ${productDTO.pprice}</div>
					<div class="productmodelnumber">
						<div class="productmodelnumber">상품 시리얼 넘버 : ${productDTO.psn }</div>
					</div>
					<div>
						<div>본상품은 브랜드사에서 공식 수입된 정품입니다.</div>
					</div>

					<div>
						<div>
							주문수량 <input type="text" id="quantityvalue" class="quantity_input"
								value="1"> <span>
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</span>
						</div>
					</div>

					<div
						style="height: auto; width: 100%; border-bottom: 1px dotted black;">
						<label for="psize"></label>
						<div>상품 사이즈</div>
						<br>
						<div class="psize">
							<input type="radio" name="psize" id="psize1" value="220" checked>
							220 <input type="radio" name="psize" id="psize2" value="230">
							230 <input type="radio" name="psize" id="psize3" value="240">
							240 <input type="radio" name="psize" id="psize4" value="250">
							250 <input type="radio" name="psize" id="psize5" value="260">
							260 <input type="radio" name="psize" id="psize6" value="270">
							270 <input type="radio" name="psize" id="psize7" value="280">
							280
						</div>
						<br>
					</div>

					<div class="cont-ex">

						<div class="productinfomation">

							<h3>상품 정보</h3>${productDTO.pinfo}
							<br>


						</div>

					</div>

					<br>

					<div class="product_sb_event">

						<c:choose>

							<c:when test="${sessionID eq 'admin'}">
								<input type="submit" value="수정하기" class="btn btn-danger btn-xs"
									onclick="location.href='./ProductUpdate?pname=${productDTO.pname}'">

								<form action="./ProductDelete" id="delete-view">
									<input type="submit" value="삭제하기" class="btn btn-danger btn-xs"
										class="btn btn-danger btn-xs"> <input type="hidden"
										name="pname" value="${productDTO.pname}">
								</form>

								<button type="button" id="cartBtn"
									class="cartBtn btn_cart btn btn-danger btn-xs">장바구니 담기</button>

								<input type="submit" name="product_buy" value="구매하기"
									class="btn btn-danger btn-xs">
							</c:when>

							<c:otherwise>

								<div class="button_set">
									<button type="button" id="cartBtn"
										class="cartBtn btn_cart btn btn-danger btn-xs">장바구니
										담기</button>
								</div>
								<form action="./OrderInsert">
									<input type="hidden" name="pname" value="${productDTO.pname}">
									<input type="hidden" name="pbrand" value="${productDTO.pbrand}">
									<input type="hidden" name="psize" value="${productDTO.psize}">
									<input type="hidden" name="pcolor" value="${productDTO.pcolor}">
									<input type="hidden" name="pprice" value="${productDTO.pprice}">
									<input type="hidden" name="pquantity" value="1"> <input
										type="hidden" name="pimg" value="${productDTO.pimg}">
									<input type="submit" name="product_buy" value="구매하기"
										class="btn btn-danger btn-xs">
								</form>

							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {

			$("#quantityvalue").change(
					function() {

						if (120 < $("#quantityvalue").val()) {

							alert("수량은 120개까지 가능합니다.");
							$("#quantityvalue").val(120);
							$("input[name=pquantity]").val(120);

						} else {

							if ($("#quantityvalue").val() < 1) {

								alert("수량은 1개부터 가능합니다.");
								$("#quantityvalue").val(1);
								$("input[name=pquantity]").val(1);

							} else {

								$("input[name=pquantity]").val(
										$("#quantityvalue").val());

							}
						}
					});

			let quantity = $(".quantity_input").val();
			$(".plus_btn").on("click", function() {
				$(".quantity_input").val(++quantity);
				$("input[name=pquantity]").val($(".quantity_input").val());
			});
			$(".minus_btn").on("click", function() {
				if (quantity > 1) {
					$(".quantity_input").val(--quantity);
					$("input[name=pquantity]").val($(".quantity_input").val());
				}
			});

			$("#cartBtn").on("click", function(e) {
				form.cartcount = $(".quantity_input").val();
				form.psize = $("input[name=psize]:checked").val();

				$.ajax({
					url : './CartInsert',
					type : 'POST',
					data : form,
					success : function(result) {
						cartAlert(result);
					}
				})
			});

			const form = {
				mid : '${sessionID}',
				pname : '${productDTO.pname}',
				cartcount : '',
				psize : ''
			}
			console.log(form);

			function cartAlert(result) {
				if (result == '0') {
					alert("장바구니에 추가를 하지 못하였습니다.");
				} else if (result == '1') {
					if (confirm("장바구니에 추가되었습니다. 이동하시겠습니까?")) {
						location.href = "./CartSelectDetail?mid=${sessionID}";
					} else {
						return false;
					}

				} else if (result == '2') {
					alert("장바구니에 이미 추가되어져 있습니다.");
				} else if (result == '5') {
					alert("로그인이 필요합니다.");
				}
			}

			$("#delete-view").submit(function() {

				if (confirm("삭제 하시겠습니까?")) {

					return true;

				} else {

					return false;

				}

			});

		});
	</script>
	<footer class="bottom"> </footer>
</body>
</html>