<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<script src="level-calculate.js"></script>
</head>
<body style="overflow-x: hidden; text-align: center;" onload="show();">
	<%@ include file="./fz_header.jsp" %>


	<div class="title">
		<h2 style="text-align: center">레벨 테스트</h2>
		<h4 style="text-align: center">나는 제로웨이스트 입문자? 고수? 내 제로웨이스트 레벨을
			알아보자!</h4>
	</div>

	<form name="question" style="margin:0 auto">
		<div style="margin:0 auto">

			<br />
			<br /> <img id="img" src="" border="0" width="250px"> <br />
			<br />
			<br />
			<div id="result" style="font-weight: bold"></div>
			<br />
		</div>
	</form>


	<br />
	<br />
</body>
</html>