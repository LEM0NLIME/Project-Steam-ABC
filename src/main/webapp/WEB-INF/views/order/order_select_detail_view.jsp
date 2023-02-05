<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC_MART</title>
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./resources/css/member.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>마이페이지</h1>
				</div>
			</div>
		</div>
	</header>

<section>
	<div align="center">
		<i class="fas fa-sticky-note mr-sm-1"></i><h3>주문 내용</h3>
	</div>
	<br>
	
	<table class="table table-hover">
					<thead class="thead-light">
						<tr class="text-center">
							<th>아이디</th>
							<th>이름</th>
							<th>브랜드</th>
							<th>상품명</th>
							<th>사이즈</th>
							<th>색상</th>
							<th>가격</th>
							<th>수량</th>
							<th>총 가격</th>
							<th>배송지</th>
							<th>주문일</th>
							<th>주문상태현황</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-center">
							<td>${orderDTO.mid}</td>
							<td>${orderDTO.mname}</td>
							<td>${orderDTO.pbrand}</td>
							<td><a href="./ProductSelectDetail?pname=${orderDTO.pname}">${orderDTO.pname}</a></td>
							<td>${orderDTO.psize}</td>
							<td>${orderDTO.pcolor}</td>
							<td>${orderDTO.pprice}</td>
							<td>${orderDTO.pquantity}</td>
							<td>${orderDTO.pprice * orderDTO.pquantity}</td>
							<td>${orderDTO.ordaddress}</td>
							<td><fmt:formatDate value="${orderDTO.orddate}" pattern="yy-MM-dd"/></td>
							<td>${orderDTO.ordsituation}</td>
						</tr>
					</tbody>
		</table>
	
		<nav>
		<br>
			<div align="center">
	<c:choose>
	<c:when test="${sessionID eq 'admin'}">
				<c:if test="${orderDTO.ordsituation ne '배송 완료'}">
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderUpdate?ordno=${orderDTO.ordno}'">
					주문 변경
				</button>
				</c:if>
				<c:choose>
				<c:when test="${orderDTO.ordsituation eq '배송 완료'}">
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderDelete?ordno=${orderDTO.ordno}&ordstate=completed'">
					주문 정보 삭제
				</button>
				</c:when>
				<c:otherwise>
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderDelete?ordno=${orderDTO.ordno}&ordstate=none'">
					주문 취소
				</button>
				</c:otherwise>
				</c:choose>
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderSelectAll'">
					주문 목록
				</button>
			</c:when>
			<c:otherwise>
	
			<c:if test="${orderDTO.ordsituation eq '입금 대기' or orderDTO.ordsituation eq '결제 완료'}">

				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderUpdate?ordno=${orderDTO.ordno}'">
					주문 변경
				</button>
				
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderDelete?ordno=${orderDTO.ordno}&ordstate=none'">
					주문 취소
				</button>
			</c:if>
				<button type="button" class="btn btn-outline-info" onclick="location.href='./OrderSelectMy?mid=${sessionID}'">
					주문 목록
				</button>
	</c:otherwise>
	</c:choose>
	
			</div>
		<br>
	</nav>
	
	<c:if test="${orderDTO.ordsituation eq '배송 완료'}">
	
	<nav>
		<br>
			<div align="center">
			
			<div align="left">
			<form action="./ApplicationInsert">
				<input type="hidden" name="ordno" value="${orderDTO.ordno}">
				<input type="hidden" name="pbrand" value="${orderDTO.pbrand}">
				<input type="hidden" name="pname" value="${orderDTO.pname}">
				<input type="hidden" name="psize" value="${orderDTO.psize}">
				<input type="hidden" name="pcolor" value="${orderDTO.pcolor}">
			
			<input type="submit" name="application" value="취소/교환/반품/AS 신청" class="btn btn-outline-info">
				</form>
				
				<form action="./ReviewInsert">
				
				<input type="hidden" name="ordno" value="${orderDTO.ordno}">
				<input type="hidden" name="pbrand" value="${orderDTO.pbrand}">
				<input type="hidden" name="pname" value="${orderDTO.pname}">
				<input type="hidden" name="psize" value="${orderDTO.psize}">
				<input type="hidden" name="pcolor" value="${orderDTO.pcolor}">
				
				<input type="submit"  value="리뷰 작성" class="btn btn-outline-info">
				
				</form>
				
				</div>
			</div>
		<br>
	</nav>
	
	</c:if>
	
	
</section>

<footer class="bottom">

</footer>

</body>
</html>