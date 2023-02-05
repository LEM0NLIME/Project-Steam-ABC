<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" type="text/css" href="./css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/member.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
 
<c:if test="${sessionID ne 'admin'}">
 <script type="text/javascript">
 alert("권한이 없습니다.");
history.back();
 </script>
 </c:if>
 
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

<div class="cont">
<div>
<h3> 회원 관리 </h3>
</div>

<div>

<table>

<thead>
	<tr>
		<th>회원 이름</th> <th>회원 아이디</th> <th>회원 비밀번호</th> <th>회원 상세정보</th>
	</tr>
</thead>

<tbody>
	<c:forEach var="List" items="${List}">
		<tr>
			<td>${List.mname}</td>
			<td>${List.mid}</td>
			<td>${List.mpw}</td>
	
	<c:choose>
	
	<c:when test="${List.mid eq 'admin'}">
			<td> 
				<font style="color: red"> 상세조회 불가 </font>
			</td>
	</c:when>
	
	<c:otherwise>
			<td> 
				<a href="./MemberInquiryDetail?mid=${List.mid}"> 회원 상세보기 </a>
			</td>
	
	</c:otherwise>
	
	</c:choose>	
	
		</tr>
	</c:forEach>
	
	<c:if test="${empty List}">
		<tr>
			<td> 등록된 회원이 없습니다. </td>
		</tr>
	</c:if>
	
</tbody>

</table>

<br>

<div>
	<a href="./MemberInsert"> 회원 등록 </a>
</div>

	<div style="text-align: center;">		
		<c:if test="${page.pageBegin != 1}">
			<a href="./MemberInquiryAll?nowPage=${page.pageBegin - 1}&countPerPage=${page.countPerPage}">이전</a>
		</c:if>
		<c:forEach begin="${page.pageBegin}" end="${page.pageEnd}" var="paging">
			<c:choose>
				<c:when test="${paging == page.nowPage}">
					<b>${paging}</b>
				</c:when>
				<c:when test="${paging != page.nowPage}">
					<a href="./MemberInquiryAll?nowPage=${paging}&countPerPage=${page.countPerPage}">${paging}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${page.pageEnd != page.lastPage}">
			<a href="./MemberInquiryAll?nowPage=${page.pageEnd + 1}&countPerPage=${page.countPerPage}">다음</a>
		</c:if>
	</div>
</div>

<br>
<br>
<br>

</div>
<footer class="bottom">

</footer>

</body>
</html>