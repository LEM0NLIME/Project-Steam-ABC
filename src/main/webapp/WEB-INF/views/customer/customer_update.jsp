<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/list.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/customer_validity.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

</head>

<script type="text/javascript">

if (${sessionID !='admin'}) {
	alert("권한이 없습니다");
	history.back();
}


</script>


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
<br>
<form method="post" action="./CsUpdate" id="customer_check">

<div class="wrapper">

<div class="form-group">




<table>
<tr>
<th style="width: 167px"><label for="sno"> 글 번호</label></th> 
<td><input type="text" name="sno" id="sno" value="${customerDTO.sno}" readonly="readonly" style="border: none; float: left;"> </td>
		</tr>
	</table>
	</div>
	
	<div class="form-group">
<table>
<tr>
<th><label for="stitle" > 제목 </label></th>
<td><input type="text" name="stitle" id="stitle" class="form-control" value="${customerDTO.stitle}" > </td>
</tr>
	</table>
	</div>
		<table>
			<tr>
				<th>내용</th>

				<td><textarea id="scontent" name="scontent" >${customerDTO.scontent}</textarea>
					<script type="text/javascript">
						// 글쓰기 editor 및 사진 업로드 기능
						CKEDITOR.replace('scontent', {
							filebrowserUploadUrl : './CustomerMultiFile',
						});
					</script></td>

			</tr>
		</table>
	
<br>
<br> 

<c:if test="${sessionID eq 'admin'}">
<button type="submit" > 등록 </button>
<button type="reset"  id="Cancellation"> 취소 </button>
<script type="text/javascript">
 				$("#Cancellation").click(function() {
 					if (confirm("취소 하시겠습니까? 작성중인 정보는 저장되지 않습니다.")) {
 						location.href="./CustomerListPage";
					}
 				})
 			</script>
</c:if>


<button type="button" onClick="location.href='./CustomerListPage'"> 글 목록</button>

</div>

</form>

<br>
<br>

<footer class="bottom">

</footer>
</body>
</html>