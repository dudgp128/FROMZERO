<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body>
	<script>
		var cart = confirm("로그인이 필요한 기능입니다. 로그인을 하시겠습니까?");

		if(cart == true){
			window.location.replace('login.jsp');
		}
		else{
			history.back();
		}

	</script>
</body>
</html>