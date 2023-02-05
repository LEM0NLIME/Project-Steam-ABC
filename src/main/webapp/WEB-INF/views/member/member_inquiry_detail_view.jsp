<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" type="text/css" href="./css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/detail.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/detail.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<c:if test="${sessionID ne 'admin' && sessionID ne memberDTO.mid}">
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

<br>

<div class="cont">

<div>
<h3> 회원 상세정보 </h3>
</div>

<br>

<div>

<table>

<thead>
	<tr>
		<th> 회원 이름 </th> <th> 아이디 </th> <th> 패스워드 </th>
		<th> 성별 </th> <th> 이메일 </th> <th> 휴대전화 번호 </th>
	</tr>
</thead>

<tbody>

		<tr>
			<td>${memberDTO.mname}</td>
			<td>${memberDTO.mid}</td>
			<td>${memberDTO.mpw}</td>
			<td>${memberDTO.mgender}</td>
			<td>${memberDTO.memail}</td>
			<td>${memberDTO.mphonenum}</td>
		</tr>
	
</tbody>

</table>

<br>

<div>

<c:if test="${sessionID eq 'admin'}">
	<div>
	<a href="./MemberUpdate?mid=${memberDTO.mid}"> 회원 수정 </a>
	</div>
	<div>
	<form action="./MemberDelete" id="confirmAsAdmin">
		<input type="hidden" name="mid" value="${memberDTO.mid}">
		<button type="submit" class="delete_btn"><font class="font_btn">회원 삭제</font></button>
	</form>
	</div>
</c:if>

<c:if test="${sessionID eq memberDTO.mid}">
	<div>
		<a href="./MemberUpdate?mid=${memberDTO.mid}"> 내 정보 수정 </a>
	</div>
	<div>
	<form action="./MemberDelete" id="confirmAsMember">
		<input type="hidden" name="mid" value="${memberDTO.mid}">
		<input type="hidden" name="mname" value="asMember">
		<button type="submit" class="delete_btn"><font class="font_btn">회원 탈퇴</font></button>
	</form>
	</div>
</c:if>

</div>


</div>

<br>
<br>

</div>

<footer class="bottom">

</footer>

</body>
</html>