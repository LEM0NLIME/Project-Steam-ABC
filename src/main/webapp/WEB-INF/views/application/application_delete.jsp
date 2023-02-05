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
	<c:when test="${aplstate eq 'cancel'}">

	<script type="text/javascript">
		if (confirm("신청을 취소 하시겠습니까?")) {
			location.href="./ApplicationDeleteView?aplno=${applicationDTO.aplno}&aplstate=cancel";
		} else {
			history.back();
		}
	</script>
	
	</c:when>
	<c:otherwise>
	
	<script type="text/javascript">
		if (confirm("신청 정보를 삭제 하시겠습니까?")) {
			location.href="./ApplicationDeleteView?aplno=${applicationDTO.aplno}&aplstate=delete";
		} else {
			history.back();
		}
	</script>
			
	</c:otherwise>
	</c:choose>

</body>
</html>