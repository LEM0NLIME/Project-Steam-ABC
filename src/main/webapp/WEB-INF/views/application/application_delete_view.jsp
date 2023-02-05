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
				alert("취소가 완료되었습니다.");
				location.href = "./ApplicationSelectMy?mid=${sessionID}";
			</script>
			</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("신청 정보 삭제가 완료되었습니다.");
				location.href = "./ApplicationSelectAll";
			</script>
		</c:otherwise>
	</c:choose>
	
</body>
</html>