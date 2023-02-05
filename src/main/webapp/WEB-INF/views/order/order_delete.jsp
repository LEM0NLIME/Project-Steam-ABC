<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
</head>
<body>
	
	<c:choose>
	<c:when test="${ordstate eq 'none'}">

	<script type="text/javascript">
		if (confirm("주문을 취소 하시겠습니까?")) {
			location.href="./OrderDeleteView?ordno=${orderDTO.ordno}&ordstate=none";
		} else {
			history.back();
		}
	</script>
	
	</c:when>
	<c:otherwise>
	
	<script type="text/javascript">
		if (confirm("주문정보를 삭제 하시겠습니까?")) {
			location.href="./OrderDeleteView?ordno=${orderDTO.ordno}&ordstate=completed";
		} else {
			history.back();
		}
	</script>
			
	</c:otherwise>
	</c:choose>

</body>
</html>