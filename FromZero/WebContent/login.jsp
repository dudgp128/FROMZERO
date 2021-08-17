<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>From Zero</title>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<style>
input {
	line-height: 25px;
}

table.loginTable {
	margin: 0 auto;
	width: 35%;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="./fz_header.jsp"%>

	<div class="big-grid">
		<br /> <br /> <br />
		<h2>LOGIN</h2>
		<br /> <br />
	
	<div style="text-align: center">
		<form method="post" action="doLogin" style="margin-left:30px;">
		<div class="question_box" style="text-align: center">
		
		<table class="loginTable" border="0" >
			<tr>
			    <td>아이디</td>
			    <td><input type="text" name="mid" required /></td>
			</tr>
			<tr>
			    <td>비밀번호</td>
			    <td><input type="password" name="passwd" required /></td>
			</tr>
		</table> 
		<br />
			<input style="height:40px"class="test-result-button" type="submit"  value="LOGIN" />
			<button style="height:40px" class="test-result-button"><a href="join.jsp"> JOIN </a></button>
			
		</div>
		</form>
	</div>

</body>
</html>