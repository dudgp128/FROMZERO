<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
String store_id = (String) session.getAttribute("store_id");
session.setAttribute("store_id", store_id);
String user_id = (String) session.getAttribute("user_id");
String user_name = (String) session.getAttribute("user_name");
%>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
table {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

div {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

tr {
	background-color: white;
}
</style>
</head>
<body style="overflow-x: hidden">
	
	<br />

	<header>
		<h1>
			<a href="admin_point.jsp"> <img src="./농부제로로고.png" width="200px"
				alt="My Image">
			</a>
		</h1>
	</header>
	</br>

	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a href="admin-main.jsp" class="menuLink"
				href="">들어온 주문내역 확인</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="update_stock.jsp"
				class="menuLink" href="">재고 변경</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="admin_point.jsp" class="menuLink"
				href="">고객 포인트 차감</a></li>

		</ul>
	</nav>


	<ul class="loginarea">
		<li><a><%=user_name%> 관리자님, 안녕하세요!</a>
		<li><a href="./doLogout">logout</a></li>
		<li><a href="main.jsp">home</a></li>
	</ul>
	
	</br>
	</br>
	

	
	<div style="text-align: center">
		<div style="display: inline-block;">
		
			<form method="post" action="uploadAction.jsp" enctype="multipart/form-data" style="width: 300px">
				<input type="file" name="file" id="image" accept="image/*"
					onchange="setThumbnail(event);" /> 
					<img
					style="width: 300px; margin-top: 10px; border: dashed #D3D3D3;"
					id="preview-image"
					src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					
					
				<script> 
					function setThumbnail(event) {
						var reader = new FileReader();
						reader.onload = function(event) {
							var img = document.getElementById("preview-image");
							img.setAttribute("src", event.target.result);
						};
						reader.readAsDataURL(event.target.files[0]);
					}
				</script>
				
				<table style="width: 300px;">
					<tr>
						<th>제품</th>
						<td><input name="name" maxlength="50"
							style="display: block; width: 100%; max-height: 100%;" required></td>
					</tr>
					<th>금액</th>
					<td><input name="price" maxlength="10"
						style="display: block; width: 100%; max-height: 100%;" required></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input name="num" maxlength="10"
							style="display: block; width: 100%; max-height: 100%;" required></td>
					</tr>
				</table>				
				<button class="test-result-button" type="submit" style="margin-top: 20px">등록하기</button>
			</form>
		</div>
	</div>
	<br />
	<br />
	<br />

</body>

</html>