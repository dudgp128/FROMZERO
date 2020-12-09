<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<title>From zero</title>

</head>
<body">
	<div style="margin-top:200px;"class="big-shop-grid">
		<h1>선택하지 않은 항목이 존재합니다.</h1>
		<p>Error Type : <%=exception.getClass().getName() %><br/>
				Error Message : <%=exception.getMessage() %> 
			</p>
			<br/>
			<br/>
		<button style="padding: 15px" type="button"
			onclick="javascript:history.back()"> 뒤로 가기</button><br/>
	</div>
</body>
</html>