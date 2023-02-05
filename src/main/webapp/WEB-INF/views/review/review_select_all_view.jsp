<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

 <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/member.css"/>
<link rel="stylesheet" href="./css/review.css">
		
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

<div class="spaces">
	<header>
		<div>
			<h1>리뷰 전체 조회</h1>
		</div>
	</header>

	<section></section>
	<section>
		<div>
			<h5>리뷰 목록</h5>
		</div>

		<form role="form" method="get">

			<c:choose>
			
			<c:when test="${empty list }">
			
			<table>		
			
			<thead>
			<tr>
				<th></th>
			</tr>
			</thead>
					
			<tbody>
			<tr>
			<td>등록된 리뷰가 없습니다. </td>
			</tr>
			</tbody>	
			
			</table>
				
			</c:when>
			
			<c:otherwise>
			
			<table>
			
			<colgroup>
			<col style="width: 7.5%" />
			<col style="width: 25%" />
			<col style="width: 7.5%" />
			<col style="width: 40%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			</colgroup>
			
			<thead>
			<tr>
				<th>리뷰 번호</th>
				<th>사진</th>
				<th>작성자</th>
				<th>리뷰 내용</th>
				<th>리뷰 작성일</th>
				<th>상세보기</th>
			</tr>
			</thead>
	
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.rvno}</td>
						<td><img src="${pageContext.request.contextPath}/${list.rvthumbimg}" /></td>
						<td>${list.mid}</td>
						<td>${list.rvcontent}</td>
						<td>${list.rvdate}</td>
		
						<td>
						<button type="button" onclick="location.href='./ReviewSelectDetail?rvno=${list.rvno}'">리뷰 상세 보기</button>
						</td>
					</tr>
					
				</c:forEach>
				</tbody>
				
			</table>
				
			</c:otherwise>
			
			</c:choose>
		
		  <div class="search">
    <select name="searchType">
      <option value="content"<c:out value="${searchPaging.searchType eq 'content' ? 'selected' : ''}"/>>내용</option>
      <option value="size"<c:out value="${searchPaging.searchType eq 'size' ? 'selected' : ''}"/>>사이즈</option>
      <option value="color"<c:out value="${searchPaging.searchType eq 'color' ? 'selected' : ''}"/>>색상</option>
      <option value="sizecolor"<c:out value="${searchPaging.searchType eq 'sizecolor' ? 'selected' : ''}"/>>사이즈+색상</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${searchPaging.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "ReviewSelect" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
  
		
		<div>
  <ul>
  
 
		
    <c:if test="${pageMaker.prev}">
    	<li><a href="ReviewSelect${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="ReviewSelect${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="ReviewSelect${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>


		<div>
			<button type="button" onclick="location.href='./ReviewInsert'"> 리뷰 작성 </button>
		</div>
		
		</form>
	</section>

</div>

<br>
<br>

<footer class="bottom">
</footer>

</body>
</html>