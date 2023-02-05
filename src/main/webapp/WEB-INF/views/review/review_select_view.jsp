<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/review_detail.css"/>

</head>
<body style="background: #f5f5f5">

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
<br>
<br>

<div style="width: 1200px; margin:  auto; text-align: center;">

<table style="width: 1200px; margin: auto;">

<thead>
	<tr>
		<th> 리뷰 번호 </th> 
		<th> 작성자 아이디 </th>  <th> 평점</th>
		<th> 사이즈 </th> <th> 색상 </th> 
		<th> 평소 사이즈 </th> 
		<th> 작성일시 </th>
		
	</tr>
</thead>

<tbody>

		<tr>
			<td>${reviewDTO.rvno}</td>
			<td>${reviewDTO.mid}</td>
			<td>${reviewDTO.rvrating}</td>
			<td>${reviewDTO.rvsize}</td>
			<td>${reviewDTO.rvcolor}</td>
			<td>${reviewDTO.mysize}</td>
			<td>${reviewDTO.rvdate}</td>
		</tr>
	
</tbody>

</table>

<br>
<br>

<img src="${pageContext.request.contextPath}/${reviewDTO.rvimg}"/>

<br>

<table style="width: 1200px; margin: auto;">

<thead>
	<tr>
		<th> 리뷰 내용 </th>
	</tr>
</thead>

<tbody>

		<tr>
			<td> ${reviewDTO.rvcontent} </td>
		</tr>
	
</tbody>

</table>

<div style="float: left">

<span>
<a href="./ReviewUpdate?rvno=${reviewDTO.rvno}" >
리뷰 수정
</a>
</span>

&nbsp;

<span>
<a href="./ReviewDelete?rvno=${reviewDTO.rvno}" >
리뷰 삭제
</a>
</span>

</div>

</div>

<br>
<br>
<br>

<footer class="bottom">
</footer>

</body>
</html>