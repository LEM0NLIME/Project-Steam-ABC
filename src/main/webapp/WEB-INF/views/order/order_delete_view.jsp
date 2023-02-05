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

	<c:choose>
		<c:when test="${sessionID eq 'admin'}">
			<script type="text/javascript">
				alert("취소가 완료되었습니다.");
				location.href = "./OrderSelectAll";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("취소가 완료되었습니다.");
				location.href = "./OrderSelectMy?mid=${sessionID}";
			</script>
		</c:otherwise>
	</c:choose>
	
	</c:when>
	<c:otherwise>
	
	<c:choose>
		<c:when test="${sessionID eq 'admin'}">
			<script type="text/javascript">
				alert("삭제가 완료되었습니다.");
				location.href = "./OrderSelectAll";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("삭제가 완료되었습니다.");
				location.href = "./OrderSelectMy?mid=${sessionID}";
			</script>
		</c:otherwise>
	</c:choose>
			
	</c:otherwise>
	</c:choose>

	
	
	
	
</body>
</html>