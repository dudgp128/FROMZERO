<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<%
	//String user_id = (String) session.getAttribute("user_id"); //세션 값 불러오기
%>
<meta charset="UTF-8">
<title>From zero</title>
<script src="point-calculate.js"></script>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>

	<div class="big-grid">
		<br /> <br /> <br />
		<h2>에코 마일리지 교환 페이지</h2>
		<p>
			집에 있는 공병, 폐지, 등 재활용품을 모아 보내면 사이트의 포인트로 교환해드립니다!<br /> <br />
		<div class=div-grid style="width:80%;">
			<form style="margin-right:50px;" method="post" action="doPoint">
				<ul class="row_ul">
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/소주병.jpg"> <br />
							<p>소주병 (1개/100원)</p>
							<input id="soju" type="number" name="soju" min="0" , max="10"
								step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/맥주병.jpg"> <br />
							<p>맥주병 (1개/140원)</p>
							<input id="macju" type="number" name="beer" min="0" , max="10"
								step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/우유팩.jpg"> <br />
							<p>우유팩(1L/400원)</p>
							<input id="milk" type="number" name="milk" min="0" , max="10"
								step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/생수병.jpg"> <br />
							<p>생수통 (1L/50원)</p>
							<input id="water" type="number" name="water" min="0" , max="10"
								step="1" value="0" />
						</div>
					</li>
				</ul>
				<br />
				<div>
					<button class="point-reset" type="button" onclick="call()">포인트
						미리보기</button>
					<input id="display" type="text" /> <input id="calculate-result"
						name="point" type="text" />
					<button class="point-reset" type="reset">초기화</button>
					<br />
					<button class="point-reset" type="submit" onclick="call()">포인트
						전환하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>