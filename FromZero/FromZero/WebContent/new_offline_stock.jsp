<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<%
String store_id = (String) session.getAttribute("store_id");
session.setAttribute("store_id", store_id);
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
	<%@ include file="./fz_header.jsp"%>
	<br />
	<br />

	
	<div style="text-align: center">
		<div style="display: inline-block;">
		
			<!--파일-이미지, 상품명 , 가격, 수량  -->
			<form method="post" action="uploadAction.jsp" enctype="multipart/form-data" style="width: 300px">
				<input type="file" name="file" id="image" accept="image/*"
					onchange="setThumbnail(event);" /> 
					<img
					style="width: 300px; margin-top: 10px; border: dashed #D3D3D3;"
					id="preview-image"
					src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
				<script> //이미지 미리보기 기능 
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
				<button type="submit" style="margin-top: 20px">등록하기</button>
			</form>
		</div>
	</div>
	<br />
	<br />
	<br />

</body>

</html>