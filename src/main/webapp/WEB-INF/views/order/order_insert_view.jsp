<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
</head>
<body>
	<script type="text/javascript">
		alert("주문이 완료되었습니다.")
		location.href="./OrderSelectMy?mid=${sessionID}";
	</script>
</body>
</html>