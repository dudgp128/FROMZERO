<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
header {
	background-size: 1600px 200px;
	background-repeat: no-repeat;
	line-height: 170px;
	font-size: 30px;
	text-align: center;
	height: 160px;
}

a {
	text-decoration: none;
	color: #000000;
}

nav {
	background-color: #CEF6CE;
	list-style-type: none;
	text-align: center;
	margin-right: 0;
	padding: 10px;
}

#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	width: 100%; /* 메인 메뉴의 넓이 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	white-space: nowrap;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white;
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center;
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
	display: inline-block;
	z-index: 1; /*제일 앞에 표시되도록*/
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none;
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 200px;
	font-size: 14px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
}

.menuLink { /* 상위 메뉴의 글씨색을 설정 */
	color: black;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: red;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: green;
	background-color: white;
	border: solid 1px green;
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 호버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 250px; /* 높이를 250px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red;
	background-color: #dddddd;
}

.loginarea li {
	display: inline;
	text-transform: uppercase;
	padding: 0 10px;
	letter-spacing: 0px;
	font-size: 13px;
}

.loginarea {
	padding: 0 30px;
	clear: both;
	position: absolute;
	width: 200;
	height: 30px;
	float: right;
	top: 0px;
	right: 10px;
	overflow: hidden;
	letter-spacing: 5px;
}

/*GLOBALS*/
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slider-wrap {
	width: 100%;
	height: 400px; /*dot 위치 확인*/
	position: relative;
	overflow: hidden;
}

#slider-wrap ul#slider {
	height: 100%;
	position: absolute;
	top: 70px; /*내비바와 이미지 슬라이드 간 거리*/
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
	height: 400px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 85%;
	height: 100%;
}

/*btns*/
.slider-btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.slider-btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: -50px;
	border-radius: 7px 0px 0px 7px;
	color: #eee;
}

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
	color: #eee;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*bar*/
#slider-pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#slider-pagination-wrap ul {
	width: 100%;
}

#slider-pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#slider-pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

#slider-wrap img {
	display: block;
	margin: 0px auto;
	z-index: 2;
}

/*ANIMATION*/
#slider-wrap ul, #slider-pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

#w20200430557f107c8695a .gallery_row {
	width: 100%;
	table-layout: fixed;
	height: 100%;
}

#w20200430557f107c8695a .item_gallary {
	border-radius: 0px;
	display: table-cell; /*중요*/
	vertical-align: top;
}

element.style {
	position: relative;
	padding: 15px;
}

.tabled {
	display: table;
}

.big-shop-grid {
	margin-left: 100px
}

.ul-shop-grid, #li-living-item-box {
	list-style-type: none;
	float: left;
	margin-right: 40px;
}

.img-display-box {
	height: 220px;
	width: 220px
}

.big-category-text {
	margin: 10px;
	margin-top: 50px;
	margin-bottom: 20px;
}

  
div {
	text-align: center;
	}
	
div.title {
	padding: 4% 0% 3% 0%;
}

div.question_box {
	background-color:#E6E6E6;
	margin: 0% 20% 2% 20%;
	padding: 2% 0% 2% 0%;
}
	
div.question {
	margin:15px 0px 35px 0px;
}



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
	
/* 버튼 */
button {
    width:100px;
    background-color: #A9F5A9;
    border: none;
    color:#6E6E6E;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    font-weight:bold;
    margin: 4px;
    cursor: pointer;
    border-radius:10px 0 10px 0;
}

button:hover {
    background-color: #04B431;
    color:#fff;
}




</style>
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
			<li class="topMenuLi"><a class="menuLink" href="shop.html">SHOP</a>
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
	<input type="radio" id="q7a2" name="q7" value="4"><label for="q7a2">특수규격마대를 사용한다.(O)</label><br>
	<input type="radio" id="q7a3" name="q7" value="0"><label for="q7a3">유리류로 분리배출한다.</label>
	<input type="radio" id="q7a4" name="q7" value="0"><label for="q7a4">타는 쓰레기에 버린다.</label>
</div>

<div class="question">
	<h4>Q8</h4>
	<h5>비닐류 분리배출 시 틀린점은?</h5>
	<input type="radio" id="q8a1" name="q8" value="0"><label for="q8a1">이물질을 완전히 제거하여 배출한다.</label>
	<input type="radio" id="q8a2" name="q8" value="0"><label for="q8a2">뽁뽁이도 비닐류이다.</label><br>
	<input type="radio" id="q8a3" name="q8" value="4"><label for="q8a3">유색비닐도 재활용이 된다.(O)</label>
	<input type="radio" id="q8a4" name="q8" value="0"><label for="q8a4">투명한 비닐봉투에 담아 배출한다.</label>
</div>
</div>
</form>

<div class="button"><button class ="button" type="button" onclick="call()">결과 보기</button></div>
<input type = "hidden" id="score" type="text"/>

<img id="img" src="" border="0" width="250px">
<div id="result"></div>
</body>
</html>