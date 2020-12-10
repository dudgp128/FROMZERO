<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
.box {
	border: solid 1px green;
	background-color: white;
	padding: 50px;
	display: inline-block;
	width: 1050px;
}

.img_about {
	width: 1050px;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
	<div class="big-grid">
		<br /> <br /> <br />
		<div class="box">
			<h1 style='color: green;'>about ZEROWASTE</h1>
			<br /> <br /> <br />
			<ul class="row_ul">
				<li class="row_li">
					<div>
						<img class="img_about" src="images/aboutZW1.jpg"> <br />
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_about" src="images/aboutZW2.jpg"> <br />
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_about" src="images/aboutZW3.jpg"> <br />
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_about" src="images/aboutZW4.jpg"> <br />
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_about" src="images/aboutZW5.jpg"> <br />
					</div>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>