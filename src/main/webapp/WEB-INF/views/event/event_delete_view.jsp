<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
</head>
<body>

<c:choose>

<c:when test="${permission  eq 'available'}">

<script type="text/javascript">
alert("선택하신 이벤트가 삭제되었습니다.")
location.href="./EventSelect";
</script>

</c:when>

<c:otherwise>

<script type="text/javascript">
alert("권한이 없습니다.")
location.href="./EventSelect";
</script>

</c:otherwise>

</c:choose>

</body>
</html>