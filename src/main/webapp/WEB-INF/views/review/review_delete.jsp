<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
</head>
<body>

<script type="text/javascript">

if(confirm("정말로 삭제 하시겠습니까?")) {
	
	location.href="./ReviewDeleteView?rvno=${reviewDTO.rvno}";
	
}else {
	
	alert("삭제가 취소 되었습니다.");
	history.back();
	
}


</script>

</body>
</html>