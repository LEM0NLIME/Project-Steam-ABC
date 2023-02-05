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
<link rel="stylesheet" href="./css/product_common.css">
<link rel="stylesheet" href="./css/product_detail_common.css">
<link rel="stylesheet" href="./css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/product_update_validation.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionID eq 'admin'}">

			<div class="imgBlank">

				<span class="blank"> <a href="./abc_main.jsp"> <img
						name="ABCMain" src="./img/ABC.png" class="image">
				</a>
				</span> <span class="blank"> <span> <a
						href="./CartSelectDetail?mid=${sessionID}"> <img
							name="cartMain" src="./img/cart-symbol.png" class="icon">
					</a>
				</span> <c:if test="${sessionID eq 'admin'}">


						<span> <a href="./MemberInquiryAll"> <img
								name="Members" src="./img/member-symbol.png" class="icon">
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

							<span> <a href="./MemberLogOut"> <img
									name="LogOutMain" src="./img/logout-symbol.png" class="icon">
							</a>
							</span>

						</c:otherwise>

					</c:choose>

				</span>

			</div>

			<div class="navigator">

				<span class="navBlankLeft"> <span class="navContentL">
						<a href="./ProductSelect" style="color: yellow"> <font
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
				<form method="post" id="insert" name="insert"
					enctype="multipart/form-data">
					<fieldset>
						<h2 class="cont-h2">상품 수정</h2>
						<div class="form-group">
							<label for="pimg" class="text-center">이미지 등록</label> <input
								type="file" name="multipartFile" id="attachedfile">
							<div class="select_img">
								<img
									src="${pageContext.request.contextPath}/${productDTO.pthumbimg}" />
								<input type="hidden" name="pimg" value="${productDTO.pimg}" />
								<input type="hidden" name="pthumbimg"
									value="${productDTO.pthumbimg}" />
							</div>
						</div>
						<div class="product_input_group">
							<label for="pname"> ${productDTO.pname } </label>
						</div>

						<div class="product_input_group">
							<label for="pbrand"> ${productDTO.pbrand } </label>
						</div>
						<div class="product_input_group">
							<label for="pcolor"> 상품 색상 </label> <input type="radio"
								name="pcolor" id="productcolor" value="balck"> 블랙 <input
								type="radio" name="pcolor" id="productcolor" value="wihte">
							화이트 <input type="radio" name="pcolor" id="productcolor"
								value="blue"> 블루
						</div>
						<div class="product_input_group">
							<label for="pprice"> 상품 가격 </label> <input type="text"
								id="pprice" name="pprice">
						</div>
						<div class="product_input_group">
							<label for="psn"> ${productDTO.psn }</label>
						</div>
						<div class="product_input_group">
							<label for="pinfo"> 상품 정보 </label>
							<textarea rows="1" cols="10" name="pinfo"></textarea>
						</div>
						<div class="product_event">
							<input type="reset" id="reset" value="취소"
								class="btn btn-danger btn-xs"> <input type="submit"
								name="product_event" value="전송" class="btn btn-danger btn-xs">
						</div>
					</fieldset>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("권한이 없습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

	<footer class="bottom"> </footer>
</body>
</html>