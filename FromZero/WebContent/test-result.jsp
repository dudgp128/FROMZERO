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
<body style="overflow-x: hidden" onload="show();">
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

<br /><br />
<img id="img" src="" border="0" width="250px">
<br /><br /><br />
<div id="result" style="font-weight:bold"></div>
<br />
</div>
</form>


<br /><br />
</body>
</html>