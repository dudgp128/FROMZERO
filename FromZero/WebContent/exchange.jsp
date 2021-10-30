<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<script src="point-calculate.js"></script>
<style>
div, table,tr,td{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	background-color:#FFFFFF;
	border-collapse: collapse;
	border-spacing: 0;
	}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div>
		<br /> <br /> <br />
		<h2 style="text-align:center">에코 마일리지 교환 페이지</h2>
		<p style="text-align:center">
			집에 있는 공병, 폐지, 등 재활용품을 모아 보내면 사이트의 포인트로 교환해드립니다!<br /> <br />
		
			<form style="margin:0 auto;" method="post" action="doPoint">
				<table style="margin:0 auto;" >
					<tr>
						<td>
							<div>
								<img class="img_exchange" src="exchange/초록병.jpg"> <br />
								<p>소주병 (1개/100원)</p>
								<input id="soju" type="number" name="soju" min="0"  max="10"
									step="1" value="0" />
							</div>
						</td>
						<td>
							<div>
								<img class="img_exchange" src="exchange/맥주병.jpg"> <br />
								<p>맥주병 (1개/140원)</p>
								<input id="macju" type="number" name="beer" min="0" max="10"
									step="1" value="0" />
							</div>
						</td>
						<td>
							<div>
								<img class="img_exchange" src="exchange/우유팩.png"> <br />
								<p>우유팩(1L/400원)</p>
								<input id="milk" type="number" name="milk" min="0" max="10"
									step="1" value="0" />
							</div>
						</td>
						<td>
							<div>
								<img class="img_exchange" src="exchange/생수병.jpg"> <br />
								<p>생수통 (1L/50원)</p>
								<input id="water" type="number" name="water" min="0" max="10"
									step="1" value="0" />
							</div>
						</td>
					</tr>
				</table>
				<br />
				<div style="margin:0 auto; width:70%">
					<table style="margin:0 auto;">
						<tr>
							<td>
								<button class="test-result-button" type="button"
									onclick="call()">미리보기</button>
							</td>
							<td><input id="display" type="text" /> <input
								id="calculate-result" name="point" type="text" /></td>
							<td>
								<button class="test-result-button" type="reset">초기화</button>
							</td>
							<td>
								<button class="test-result-button" type="submit"
									onclick="call()">전환하기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
	</div>
</body>
</html>