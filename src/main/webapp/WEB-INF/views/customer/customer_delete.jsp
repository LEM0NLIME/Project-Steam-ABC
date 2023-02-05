<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
</head>
<body>

<form method="get">

<script type="text/javascript">
if (confirm("삭제 하시겠습니까?") == true){
	
	   location.href="./CsDeleteCheck?sno=${customerDTO.sno}";
	 }else{
	   history.back();
	 }
</script>


</form>
</body>
</html>