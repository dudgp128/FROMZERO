<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
.img_profile {
	width: 300px;
}

.row_li {
	margin: 10px;
}

.clear {
	clear: both;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
	<div class="big-grid">
		<br /> <br /> <br />
		<div class=div-grid
			style="border: solid 1px green; background-color: white; padding: 50px;">
			<h1 style='color: green;'>WELCOME TO FROMZERO</h1>
			<br /> <br /> <br />

			<ul class="row_ul">
				<li class="row_li">
					<div>
						<img class="img_profile" src="images/YH.jpg"> <br />
						<h3>배유하</h3>
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_profile" src="images/MS.jpg"> <br />
						<h3>유민서</h3>
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_profile" src="images/SH.jpg"> <br />
						<h3>이소희</h3>
					</div>
				</li>
				<li class="row_li">
					<div>
						<img class="img_profile" src="images/YHY.jpg"> <br />
						<h3>조영혜</h3>
					</div>
				</li>
			</ul>
			<br />
			<br /> <br /> <br />
			<div class=clear>
			<h3 style="position: relative;">
				 <br /> <br /> <br /> '프롬제로'에 오신 것을 환영합니다! 저희는 개발자 배유하,
				유민서, 이소희, 조영혜 입니다.<br /> <br /> <br /> <br /> 제로웨이스트란 ‘0’의 zero와
				‘쓰레기’의 waste의 합성어로, 쓰레기가 배출 되지 않는 것을 의미합니다.<br /> <br /> <br />
				미래세대를 위해 지속가능한 지구를 물려주는 것은 현 세대가 실천해야하는 필수불가결한 것이라고 생각했습니다.<br /> <br />
				동물 보호와 환경 보호를 할 수 있는 비건도 많아지고 있을 뿐더러, 제로웨이스트 또한 이러한 환경 보호를 실천하는
				선두주자로 떠오르고 있습니다.<br /> <br /> <br /> <br /> <br /> 따라서 제로웨이스트
				운동 장려를 통한 환경 보호를 위해 온 오프라인 제로웨이스트 플랫폼, 'From zero'를 만들게 되었습니다.<br />
				<br />
			</h3>
			<br /> <br /> <br />
			</div>
		</div>
		<br /> <br />
	</div>
</body>
</html>