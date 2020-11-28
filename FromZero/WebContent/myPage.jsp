<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<%
	User user = (User) request.getAttribute("user");
%>
<%
	String user_id = (String) session.getAttribute("user_id"); //세션 값 불러오기
%>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
.inside {
	padding: 10px;
	margin-top: 20px;
	margin-left: 10px;
	margin-right: 10px;
}

.left-menu {
	background-color: #CEF6CE;
	list-style-type: none;
	text-align: center;
	margin-right: 0;
	padding: 10px;
	width: 200px;
	height: 100px;
	font-size: 16px;
	font-weight: bold;
	font-family: "Trebuchet MS", Tmon소리 Black;
	display: inline-block;
}

.left-menu li {
	margin: 10px;
}

.info {
	background-color: #e2e2e2;
	width: 970px;
	height: 100px;
	float: right;
	margin-right: 10px;
	margin-left: 10px;
	padding: 10px;
	display: inline-block;
}

.intro {
	display: inline-block;
}

.point-view {
	display: inline-block;
	float: right;
	margin-right: 10px;
	margin-left: 10px;
	text-align: center;
	font-weight: bold;
}

.point-view ul {
	display: flex;
	align-center: flex-start;
	flex-direction: column;
	flex-wrap: wrap;
	overflow: auto;
	margin: 0 0 20px 20px;
}

.point-view li {
	margin: 5px 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	font-size: 29px;
	margin-bottom: 5px;
}
</style>
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


	<form method="post" action="doSearch">
		<ul class="loginarea">
			<li><a href="login.html"> <img src="images/mypage.png"
					width=25 height=20>
			</a></li>
			<li><a href="login.html">cart</a></li>
			<li><a href="login.html">login</a></li>
			<li><a href="join.html">join</a></li>
			<li><input type="text" name="search_text"></li>
			<li style='top: 100px; padding: 0 0px;'>
				<button type="submit">
					<img src="images/magnifying-glass.png" width=20 height=20>
				</button>
			</li>
		</ul>
	</form>

	<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				style="width: 50px; height: 50px;"></a></li>
		<li><a href="test.jsp"><img src="images/test.png"
				style="width: 50px; height: 50px;"></a></li>
	</ul>

	<div class="inside">
		<div class="left-menu">
			<ul>
				<li style="color: #33cc00"><a href="myPage.jsp">주문조회</a></li>
				<li><a href="info-modify.jsp">회원정보 수정</a></li>
				<li><a href="info-exit.jsp">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="info">
			<div class="intro">
				<div style='font-weight: bold; font-size: 26px; padding: 10px;'>
					<%=user.getName()%>님, 안녕하세요.
				</div>
				<div class="total-price" style='font-size: 16px; padding: 10px;'>누적구매금액:
					0원</div>
			</div>
			<!-- <div class="point-view">
				<a href="point.html">
					<ul>
						<li style="font-size: 29px; margin-bottom: 5px;">포인트</li>
						<li style="font-size: 29px; margin-bottom: 5px;">레벨</li>
					</ul>
					<ul>
						<li style="font-size: 29px; margin-bottom: 5px;">0</li>
						<li style="font-size: 29px; margin-bottom: 5px;">나무</li>
					</ul>
					 <div style="font-size: 29px;">0</div> 
				</a>
			</div> -->
			<div class="point-view">
				<a href="point.html"> <!-- 공병 개수 보여주는거 어떻게 할것인지 결정하기  -->
					<ul>
						<li>포인트</li>
						<li style='font-size: 26px'>0</li>
					</ul>
				</a>
			</div>
			<div class="point-view">
				<a href="test.jsp">
					<ul>
						<li>레 벨</li>
						<!-- 레벨 디비 저장해서 가져오는거 구현하기 -->
						<li style='font-size: 26px'>나무</li>
					</ul>
				</a>
			</div>
		</div>
		<br />
		<div style="font-size: 15px; padding: 70px; text-align: center;">주문내역이
			없습니다.</div>
		<!-- 오프라인구매내역/온라인구매내역으로 나눠서 테이블에서 가져오기 -->
	</div>
</body>
</html>