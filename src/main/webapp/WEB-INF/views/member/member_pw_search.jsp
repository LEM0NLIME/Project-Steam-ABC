<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC_MART</title>

<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="./css/login.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/pw_search.js"></script>

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

<div style="margin: auto; width: 800px;">

			<br>

			<div>
				<h1 align="center">비밀번호 찾기</h1>
			</div>
			
			<br>

			<div>
				<br>
				<span>
					<button type="button" class="custom_btn2"  id="change_button" onclick="document.getElementById('change_button').style.outline = 'solid 3px'; document.getElementById('change_button2').style.outline = 'solid 1px'"><font>이메일 주소로 찾기</font></button>
				</span>
				<span>
					<button type="button" class="custom_btn"   id="change_button2" onclick="document.getElementById('change_button2').style.outline = 'solid 3px'; document.getElementById('change_button').style.outline = 'solid 1px' " style="border-collapse: collapse; float: right;" ><font>휴대폰 번호로 찾기</font></button>
				</span>		
			</div>

			<div style="border-top: solid 2px;" id="asEMail">
			<br>
			
			<form action="./MemberPwSearchAsEMailView" id="memberPwSearchAsEMailView">
			
			<input type="hidden" value="이메일 인증번호"  id="certificationNum" name="certificationNum">
			<div>
				<p>
					<label for="eid">아이디</label>
						<input class="custom" type="text" id="eid" name="mid" maxlength="20" size="110" placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
				</p>
			</div>
			<div>
				<p>
					<label for="mname"> 회원 이름 </label> <input class="custom" type="text"
						id="mname" name="mname" size="110" placeholder="성함을 입력해주세요">
				</p>
			</div>

			<div>
				<p>
					<label for="eMail"> 이메일 주소 </label> 
					<br>
					<input class="custom" type="email" id="eMail" name="memail" placeholder="이메일 주소를 입력해 주세요." size="82.5"> 
						<select name="domain" id="domain">
						<option value="">직접입력
						<option value="@naver.com">naver.com
						<option value="@daum.com">daum.com
						<option value="@google.com">google.com
						<option value="@nate.com">nate.com
					</select>
					<button type="button" id="eMailPermission" class="default-btn">인증번호 요청</button>
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
			
			<div style="text-align: center;">
				<br> <br> <input class="cursor" type="submit" value="비밀번호 찾기">
			</div>
			
			</form>
			
			</div>
			
			<div style="border-top: solid 2px;" id="asPhoneNum">

			<br>
			
			<form action="./MemberPwSearchAsPhoneNumView" id="memberPwSearchAsPhoneNumView">
			
			<input type="hidden" value="휴대폰 인증번호"  id="certificationNum2" name="certificationNum2">
			<div>
			<p>
					<label for="eid2">아이디</label>
						<input class="custom" type="text" id="eid2" name="mid" maxlength="20" size="110" placeholder="아이디를 입력해주세요 (영문,숫자 사용 3~20자)">
			</p>
			</div>
			<div>
				<p>
					<label for="mname2"> 회원 이름 </label> <input class="custom" type="text"
						id="mname2" name="mname" size="110" placeholder="성함을 입력해주세요">
				</p>
			</div>

			<div>
				<p>
					<label for="phoneNumber"> 휴대폰 번호 </label> 
					<br>
					<input class="custom" type="text" id="phoneNumber"
						name="mphonenum" size="96.5" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
					<button type="button" id="phoneNumberPermissions" onclick="phoneNumberAdmission()" class="default-btn">인증번호 요청</button>
					
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
	
			</div>
			
			<div style="text-align: center;">
				<br> <br> <input class="cursor" type="submit" value="비밀번호 찾기">
			</div>
			
			</form>
			
</div>
			
			<br>

		</div>

	<br>

	<footer class="bottom">
	</footer>

</body>
</html>