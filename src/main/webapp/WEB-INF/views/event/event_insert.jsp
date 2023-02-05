<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" href="./css/eventcommon.css">
<link rel="stylesheet" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" href="./resources/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./js/eventvalidity.js" type="text/javascript"></script>


</head>

<body>

	<c:choose>

		<c:when test="${sessionID eq 'admin'}">

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
			
				<div class="container">
					<div class="m-5 pb-5">
						<form method="post" id="sign_event" enctype="multipart/form-data">

							<c:set var="ymd" value="<%=new java.util.Date()%>" />

							<fieldset>


								<div class="form-group">
									<label for="ename" class="col-sm-2 control-label">이벤트
										이름</label> <input type="text" name="ename" id="ename"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="eperiod" class="col-sm-2 control-label">이벤트
										기간</label> <input type="text" name="eperiod" id="eperiod"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="edate" class="col-sm-2 control-label">작성일자</label>
									<input type="text" name="edate" id="edate" class="form-control"
										value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>"
										readonly>
								</div>
								<div class="form-group">
									<label for="etarget" class="col-sm-2 control-label">
										이벤트 대상</label> <input type="text" name="etarget" id="etarget"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="etype" class="col-sm-2 control-label">이벤트
										타입</label>
									<div>
										<label class="radio-inline"> <input type="radio"
											name="etype" id="etype" value="기획전">기획전
										</label> <label class="radio-inline"> <input type="radio"
											name="etype" id="etype" value="할인전">할인전
										</label>
									</div>
								</div>

								<div class="form-group" id="edcratetext">
									<label for="edcrate"  class="col-sm-2 control-label">할인율</label>
									<select name="edcrate" id="edcrate" class="form-control">

										<option value="">---할인율 선택---</option>
										<option value="~25%">~25%</option>
										<option value="~50%">~50%</option>
										<option value="~75%">~75%</option>
										<option value="~90%">~90%</option>

									</select>

								</div>

								<div class="inputArea">
									<label for="eimg">사진</label> <input type="file"
										name="multipartFile" id="eimg" accept="image/*">
									<div class="select_img">
										<img src="" />
									</div>

									<script>
										$("#eimg")
												.change(
														function() {
															if (this.files
																	&& this.files[0]) {
																var reader = new FileReader;
																reader.onload = function(
																		data) {
																	$(
																			".select_img img")
																			.attr(
																					"src",
																					data.target.result)
																			.width(
																					300);

																}

																reader
																		.readAsDataURL(this.files[0]);
															}
														});
									</script>


								</div>
								<div class="form-group">
									<button type="submit" class="btn-b">등록</button>
									<button type="reset" class="btn-b">취소</button>
									<button type="button" class="btn-a" style="margin-left: 340px;" onclick="location.href='./EventSelect'">이벤트 목록</button>

								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>

			<footer class="bottom"> </footer>
		</c:when>
		<c:otherwise>

			<script type="text/javascript">
				alert("권한이 없습니다.");
				history.back();
			</script>

		</c:otherwise>


	</c:choose>
</body>
</html>