<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<c:forEach var="items" items="${items }">
	<c:if test="${productDTO.pname eq items.pname }">
		<script type="text/javascript">
			alert("입력하신 ${productDTO.pname}의 상품명이 존재합니다. 다시 입력해주세요.")
			location.href = "./ProductInsert";
		</script>
	</c:if>
</c:forEach>
</head>
<body>
	<script type="text/javascript">
		alert("입력하신 상품 ${productDTO.pname}을(를) 등록하셨습니다.")
		location.href = "./ProductSelect";
	</script>
</body>
</html>