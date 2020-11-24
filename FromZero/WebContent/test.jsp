<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* 라디오버튼 */

input[type=radio] {
		display:none;
	}

input[type=radio] + label {
	display:inline-block;
	margin: 3px;
	padding: 3px 10px;
	margin-top:15px;
	margin-bottom: 0;
	font-size: 13px;
	line-height: 20px;
	color: #333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255,255,255,0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	background-image: -moz-linear-gradient(top,#fff,#e6e6e6);
	background-image: -webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));		
	background-image: -webkit-linear-gradient(top,#fff,#e6e6e6);
	background-image: -o-linear-gradient(top,#fff,#e6e6e6);
	background-image: linear-gradient(to bottom,#fff,#e6e6e6);
	background-repeat: repeat-x;
	border: 1px solid #ccc;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
	border-bottom-color: #b3b3b3;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
	box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
	}

input[type=radio]:checked + label {	   
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
	box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);			
	background-color:#e0e0e0;
	}
	
	
</style>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<script src="level-calculate.js"></script>
</head>
<body style="overflow-x: hidden">
	<header>
		<h1>
			<a href='main.html'>From zero</a>
		</h1>
	</header>
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="ourStory.html">OUR
					STORY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="introduce.html" class="submenuLink">사이트 소개</a></li>
					<li><a href="guide.html" class="submenuLink">이용 안내</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="shop.jsp">SHOP</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="living.jsp" class="submenuLink">LIVING</a></li>
					<li><a href="bathroom.jsp" class="submenuLink">BATHROOM</a></li>
					<li><a href="kitchen.jsp" class="submenuLink">KITCHEN</a></li>
					<li><a href="kit.jsp" class="submenuLink">KIT</a></li>
					<li><a href="etc.jsp" class="submenuLink">ETC</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="offline.html">OFFLINE</a>
			</li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="ecoDiary.html">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="aboutZW.html" class="submenuLink">ABOUT ZW</a></li>
					<li><a href="ecoTip.html" class="submenuLink">ECO TIP</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="greenBoard.html">GREEN
					BOARD</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="notice.html" class="submenuLink">NOTICE</a></li>
					<li><a href="faq.html" class="submenuLink">FAQ</a></li>
					<li><a href="qna.html" class="submenuLink">QNA</a></li>
				</ul></li>
		</ul>
	</nav>


	<ul class="loginarea">
		<li><a href="myPage.html"> <img src="images/mypage.png"
				width=25 height=20>
		</a></li>
		<li><a href="cart.html">cart</a></li>
		<li><a href="login.html">login</a></li>
		<li><a href="join.html">join</a></li>
	</ul>

		<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				width=40 height=50></a></li>
		<li><a href="test.jsp"><img src="images/test.png" width=40
				height=50></a></li>
	</ul>

<!-- 테스트 페이지 본문 -->

<div class="title">
<h2 style="text-align:center">레벨 테스트</h2>
<h4 style="text-align:center">나는 제로웨이스트 입문자? 고수? 내 제로웨이스트 레벨을 알아보자!</h4>
</div>
 
<form name="question">
<div class="question_box">
<div class="question">
	<h4>Q1</h4>
	<h5>나는 카페에서 음료를 마실 때 플라스틱 컵 대신 텀블러를 이용한다.</h5>
	<input type="radio" id="q1a1" name="q1" value="4" checked><label for="q1a1">항상</label>
	<input type="radio" id="q1a2" name="q1" value="3"><label for="q1a2">자주</label>
	<input type="radio" id="q1a3" name="q1" value="2"><label for="q1a3">종종</label>
	<input type="radio" id="q1a4" name="q1" value="1"><label for="q1a4">전혀</label>
</div>

<div class="question">
	<h4>Q2</h4>
	<h5>나는 카페에서 음료를 마실 때 플라스틱 컵 대신 텀블러를 이용한다.</h5>
	<input type="radio" id="q2a1" name="q2" value="4"><label for="q2a1">항상</label>
	<input type="radio" id="q2a2" name="q2" value="3"><label for="q2a2">자주</label>
	<input type="radio" id="q2a3" name="q2" value="2"><label for="q2a3">가끔</label>
	<input type="radio" id="q2a4" name="q2" value="1"><label for="q2a4">전혀</label>
</div>

<div class="question">
	<h4>Q3</h4>
	<h5>나는 쇼핑할 때 장바구니를 이용한다.</h5>
	<input type="radio" id="q3a1" name="q3" value="4"><label for="q3a1">항상</label>
	<input type="radio" id="q3a2" name="q3" value="3"><label for="q3a2">자주</label>
	<input type="radio" id="q3a3" name="q3" value="2"><label for="q3a3">가끔</label>
	<input type="radio" id="q3a4" name="q3" value="1"><label for="q3a4">전혀</label>
</div>

<div class="question">
	<h4>Q4</h4>
	<h5>나는 플라스틱 분리수거 시 물로 깨끗이 씻은 후, 잘 말려서 분리수거한다.</h5>
	<input type="radio" id="q4a1" name="q4" value="4"><label for="q4a1">항상</label>
	<input type="radio" id="q4a2" name="q4" value="3"><label for="q4a2">자주</label>
	<input type="radio" id="q4a3" name="q4" value="2"><label for="q4a3">가끔</label>
	<input type="radio" id="q4a4" name="q4" value="1"><label for="q4a4">전혀</label>
</div>

<div class="question">
	<h4>Q5</h4>
	<h5>나는 종이류 분리수거 시 오염된 종이는 배출하지 않는다.</h5>
	<input type="radio" id="q5a1" name="q5" value="4"><label for="q5a1">항상</label>
	<input type="radio" id="q5a2" name="q5" value="3"><label for="q5a2">자주</label>
	<input type="radio" id="q5a3" name="q5" value="2"><label for="q5a3">가끔</label>
	<input type="radio" id="q5a4" name="q5" value="1"><label for="q5a4">전혀</label>
</div>
       
 <div class="question">
	<h4>Q6</h4>
	<h5>나는 스팸메일을 자주 정리한다.</h5>
	<input type="radio" id="q6a1" name="q6" value="4"><label for="q6a1">항상</label>
	<input type="radio" id="q6a2" name="q6" value="3"><label for="q6a2">자주</label>
	<input type="radio" id="q6a3" name="q6" value="2"><label for="q6a3">가끔</label>
	<input type="radio" id="q6a4" name="q6" value="1"><label for="q6a4">전혀</label>
</div>

<div class="question">
	<h4>Q7</h4>
	<h5>깨진 유리의 양이 많을 경우 분리배출법은?</h5>
	<input type="radio" id="q7a1" name="q7" value="0"><label for="q7a1">신문지에 싸서 일반 종량제로 버린다.</label>
	<input type="radio" id="q7a2" name="q7" value="4"><label for="q7a2">특수규격마대를 사용한다.</label><br>
	<input type="radio" id="q7a3" name="q7" value="0"><label for="q7a3">유리류로 분리배출한다.</label>
	<input type="radio" id="q7a4" name="q7" value="0"><label for="q7a4">타는 쓰레기에 버린다.</label>
</div>

<div class="question">
	<h4>Q8</h4>
	<h5>비닐류 분리배출 시 틀린점은?</h5>
	<input type="radio" id="q8a1" name="q8" value="0"><label for="q8a1">이물질을 완전히 제거하여 배출한다.</label>
	<input type="radio" id="q8a2" name="q8" value="0"><label for="q8a2">뽁뽁이도 비닐류이다.</label><br>
	<input type="radio" id="q8a3" name="q8" value="4"><label for="q8a3">유색비닐도 재활용이 된다.</label>
	<input type="radio" id="q8a4" name="q8" value="0"><label for="q8a4">투명한 비닐봉투에 담아 배출한다.</label>
</div>
</div>
</form>

<div class="button"><button class ="test-result-button" id="button" type="button" onclick="call()">결과 보기</button></div>

<input type = "hidden" id="score" type="text"/>
<img id="img" src="" border="0" width="250px">
<div id="result"></div>
</body>
</html>