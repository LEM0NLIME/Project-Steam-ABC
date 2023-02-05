<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<link rel="stylesheet" type="text/css" href="./css/join.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/join.js"> </script>

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

	<form id="inspection" name="inspection" action="./MemberInsertAsMember"
		method="post" enctype="application/x-www-form-urlencoded">

		<fieldset class="border">
			<br>
			<div class="div4">
				<h1 align="center">회원 가입</h1>
			</div>

			<div class="div1">
				<h2>약관동의</h2>
			</div>

			<div class="div2">
				<p>
					<label for="agreement4"> 사이트 이용약관에 동의 하십니까? </label> <br> <font
						color="red">[필수]</font>동의 <input type="checkbox" id="agreement4"
						name="agreement4"> <br>
				</p>
			</div>

			<div class="div2">
				<p>
					<label for="agreement5"> 전자상거래 이용약관에 동의 하십니까? </label> <br> <font
						color="red">[필수]</font>동의 <input type="checkbox" id="agreement5"
						name="agreement5"> <br>
				</p>
			</div>
			<div class="div2">
				<p>
				     <label for="agreement6"> 개인정보 수집 및 이용에 동의 하십니까? </label> <br>
					<font color="red">[필수]</font>동의 <input type="checkbox"
					id="agreement6" name="agreement6"> <br> 
				</p>
			</div>
			<div class="div3">
				<font size="2px" color="red">※만 14세 미만은 회원가입이 불가능합니다.</font> <br>
				<br>
			</div>
			<div class="div1">
				<br>
				<h2>회원정보</h2>
			</div>

			<div class="div3">
				<p>
					<label for="ename">이름<font color="red">*</font>
					</label> <input class="custom" type="text" id="ename" name="mname"
						size="167" placeholder="한글,영문만 입력해주세요.">
				</p>
			</div>

			<div class="div3">
				<p>
					<label for="eid">아이디<font color="red">*</font></label>

						<input class="custom" type="text" id="eid" name="mid" maxlength="20" size="75" placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
						
						<button class="btn-certification" type="button" id="confirmIdDup" name="confirmIdDup" >중복 확인</button>
						<input type="hidden" id="idCheck">
				</p>

				
				
			</div>
			<div class="div3">
				<p>
					<label for="password">비밀번호<font color="red">*</font>
					</label> <input class="custom" type="password" id="password"
						name="mpw" size="167"
						placeholder="비밀번호를 입력해 주세요.(특수문자를 포함한 영문,숫자  10~20자)">
				</p>
			</div>
			<div class="div3">
				<p>
					<label for="pw">비밀번호 확인<font color="red">*</font>
					</label> <input class="custom" class="p2" type="password" id="pw" name="pwck"
						size="167" placeholder="비밀번호를 재입력해 주세요.">
				</p>
			</div>
						
			<div class="div3" id="pwConfirm">
				<font size="2px" color="red">※비밀번호가 일치하지 않습니다.</font>
			</div>
			<div class="div3" id="pwConfirm2">
				<font size="2px" color="green">※비밀번호가 일치합니다.</font>
			</div>
			
			<div class="div3" id="gendercheck">
				<label for="gender"> 성별 <font color="red">*</font> &nbsp;
				</label> 남<input class="custom" type="radio" id="gender" name="mgender" value="남">
				여<input class="custom" type="radio" id="gender" name="mgender" value="여">
			</div>

			<input type="hidden" value="이메일 인증번호"  id="certificationNum" name="certificationNum">
			
			<div class="div3">
				<p>
					<label for="eMail">이메일<font color="red">*</font>
					</label> <input class="custom" type="email" id="eMail" name="memail"
						placeholder="이메일 주소를 입력해 주세요." size="60"> 
						<select name="domain" id="domain">
						<option value="">직접입력
						<option value="@naver.com">naver.com
						<option value="@daum.com">daum.com
						<option value="@google.com">google.com
						<option value="@nate.com">nate.com
					</select>
					<button type="button" id="eMailPermission" class="btn-certification">인증번호 요청</button>
				</p>
				<p id="admissionEmail">
					<input class="custom" type="text" id="eMailNumber" name="eMailNumber"
						placeholder="인증번호를 입력해주세요." size="60">
					<button type="button" id="eMailPermissionNumber">확인</button>
				</p>
				<p id="eMailConfirmY">
					<font size="2px" color="green">※인증되었습니다.</font>
				</p>
				<p id="eMailConfirmN">
					<font size="2px" color="red">※인증번호가 불일치합니다.</font>
				</p>
			</div>
			
			<input type="hidden" value="휴대폰 인증번호"  id="certificationNum2" name="certificationNum2">

			<div class="div3">
				<p>
					<label for="phoneNumber">휴대폰 번호<font color="red">*</font>
					</label> <input class="custom" type="text" id="phoneNumber"
						name="mphonenum" size="68" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
					<button type="button" id="phoneNumberPermissions" onclick="phoneNumberAdmission()" class="btn-certification">인증번호 요청</button>
					
				</p>
				
				<p id="admissionPhoneNumbers">
					<input class="custom" type="text" id="PhoneNumbers" 
						placeholder="인증번호를 입력해주세요." size="60">
					<button type="button" id="phonePermissionNumber">확인</button>
				</p>
				<p id="phoneConfirmY">
					<font size="2px" color="green">※인증되었습니다.</font>
				</p>
				<p id="phoneConfirmN">
					<font size="2px" color="red">※인증번호가 불일치합니다.</font>
				</p>
				
					<br>
			</div>

			<div class="div1">
				<br>
				<h2>마케팅 활용 동의</h2>
			</div>

			<div class="div1" style="line-height: 1px;">
				<h4>&nbsp;&nbsp;&nbsp;www.a-rt.com, www.onthespot.co.kr,
					m.a-rt.com, m.onthespot.co.kr 사이트에 대한 마케팅 활용 동의입니다.</h4>
				<h4>&nbsp;&nbsp;&nbsp;상품과 쇼핑관련 정보(특가상품, 이벤트, 할인쿠폰, 기념일 알림)의 안내를
					받으시겠습니까?</h4>
			</div>

			<div class="div2">
				<p>
					<font color="blue">[선택]</font> 개인정보 수집 및 이용 동의 <input
						type="checkbox" id="agreement1" name="agreement1">
				</p>
			</div>
			<div class="div2">
				<p>
					<font color="blue">[선택]</font> 마케팅 정보 수신 동의 <input type="checkbox"
						id="agreement2" name="agreement2"> <br>
				</p>
			</div>
			<div class="div2">
				<p>
					<font color="blue">[선택]</font> 야간 마케팅 수신 동의 (21시~08시) <input
						type="checkbox" id="agreement3" name="agreement3"> <br>
				</p>
			</div>
			<div>

				<div class="find-btn">

					<br> <br> <br> <br>
					 
					<input class="esa" style="cursor: pointer;" type="submit"
						value="회원가입">
					<button class="reset" type="button" style="cursor: pointer;"
						id="joinCancel">취소</button>
				</div>
			</div>

		</fieldset>
	</form>

		<br> <br>
		
		<footer class="bottom">

		</footer>

</body>
</html>