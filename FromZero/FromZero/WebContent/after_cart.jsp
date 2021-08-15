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
		var cart = confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?");
		
		if(cart == true){
			window.location.replace('cart.jsp');
		}
		else{
			history.back();
		}
	</script>
</body>
</html>