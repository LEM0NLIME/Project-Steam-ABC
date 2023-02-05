<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC_MART</title>
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
</head>
<body>
	<script type="text/javascript">
	
	if (confirm("작성한 내용은 저장되지 않습니다. 돌아가시겠습니까?")) {
		location.href="./OrderSelectDetail?ordno=${orderDTO.ordno}";
	} else {
		history.back();
	}
	
	</script>
</body>
</html>