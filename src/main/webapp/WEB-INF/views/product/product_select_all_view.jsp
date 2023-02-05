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
<link rel="stylesheet" href="./css/product_select_all.css">
<link rel="stylesheet" href="./css/product_common.css">
<link rel="stylesheet" href="./css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/product_select_all.js"></script>
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

	<div class="pbody">
		<div class="products">
			<h3>신발</h3>
			<div class="product-list-main">
				<ul class="product-list">
					<c:forEach var="items" items="${items}">
						<li class="product"
							onclick="location.href='./ProductSelectDetail?pname=${items.pname}'"
							style="cursor: pointer;"><img
							src="${pageContext.request.contextPath}/${items.pthumbimg}">
							<div class="product-name">${items.pname }</div>
							<div class="product-price">${items.pprice } 원</div></li>
					</c:forEach>
				</ul>

			</div>
			<div class="search">
				<ul class="bottom-ul">
					<li class="bottom-li"><select name="searchType"
						class="search-input">
							<option value="t"
								<c:out value="${productSearchCriteria.searchType eq 't' ? 'selected' : ''}"/>>상품명</option>
							<option value="c"
								<c:out value="${productSearchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>브랜드명</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						class="search-input" value="${productSearchCriteria.keyword}" />
						<button id="searchBtn" type="button" class="btn btn-danger btn-xs">검색</button>
					</li>
					<li class="bottom-li1">
						<div class="pagination-con">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="pagination-li"><a
										href="ProductSelect${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a href="ProductSelect${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="ProductSelect${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</li>
					<li class="bottom-li2"><c:if test="${sessionID eq 'admin'}">
							<div class="insert-btn">
								<input type="submit" value="상품 등록" class="btn btn-danger btn-xs"
									onclick="location.href='./ProductInsert'">
							</div>
						</c:if></li>
				</ul>
			</div>
		</div>
	</div>

	<footer class="bottom"> </footer>
</body>
</html>