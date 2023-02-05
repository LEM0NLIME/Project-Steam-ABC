<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>
<body>

<c:choose>

<c:when test="${check eq 'false'}">

<script type="text/javascript">
alert("로그인에 실패했습니다, 아이디와 비밀번호를 다시 입력해주세요.");
history.back();
</script>

</c:when>

<c:otherwise>

<script type="text/javascript">
alert("${memberDTO.mname}" + "님 환영합니다.");
location.href="./abc_main.jsp";
</script>

</c:otherwise>


</c:choose>

</body>
</html>