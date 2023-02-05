<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./img/webIcon.png" type="image/x-icon">
<title>ABC_MART</title>
<script type="text/javascript">

if (${sessionID !='admin'}) {
	alert("권한이 없습니다");
	history.back();
}
</script>

</head>
<body>
<script type="text/javascript">
alert("게시글을 수정하였습니다.")
location.href="./CustomerListPage";
	   
</script>
</body>
</html>