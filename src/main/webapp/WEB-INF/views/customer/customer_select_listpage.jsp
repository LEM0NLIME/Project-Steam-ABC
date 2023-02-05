<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<link rel="stylesheet" type="text/css" href="./css/list.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<script type="text/javascript">

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

<div>

<br>
<br>

</div>
	<div>
		<div class="wrapper">
			<h1>고객 센터</h1>


			<div class="search">
				<div class="right-box">
					<select name="searchType">

						<option value="tc"
							<c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						<option value="t"
							<c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>

					</select> <input type="text" name="keyword" id="keywordInput"
						value="${searchCriteria.keyword}" />

					<button id="searchBtn" type="button">검색</button>
				</div>

				<div>

						<h3>공지 사항</h3>

					<table>
						
						<tr>
							<th>번호</th>
							<th style="width: 1000px; text-align: center;">제목</th>
							<th>작성일</th>

							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.sno}</td>
									<td><a href="./CsSelectDetail?sno=${list.sno}">${list.stitle}</a></td>


									<td><c:set var="sregdate"
											value="<%=new java.util.Date()%>" /> <fmt:formatDate
											value="${list.sregdate}" pattern="yy-MM-dd" /></td>
								</tr>
							</c:forEach>

						</tr>
					</table>


					<script>
						$(function() {
							$('#searchBtn')
									.click(
											function() {
												self.location = "CustomerListPage"
														+ '${pageMaker.makeQuery(1)}'
														+ "&searchType="
														+ $(
																"select option:selected")
																.val()
														+ "&keyword="
														+ encodeURIComponent($(
																'#keywordInput')
																.val());
											});
						});
					</script>
				</div>

				<br>
				
				
				<c:if test="${sessionID eq 'admin'}">
				<div class="right-box">
					<a href="./CsInsert"> 게시글 작성</a>
				</div>
				</c:if>
				
				<br>
			<div >
			
				<div class="center-box" > 
					<div>
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="CustomerListPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="CustomerListPage${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="CustomerListPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
			</div>	
				
			</div>
		</div>
	</div>
				<br> 
				<br>
				<br>
				
				<footer class="bottom">

		</footer>
</body>
</html>