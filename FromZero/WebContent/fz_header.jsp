<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	//buying, exchange, myPage 확인
String user_id = (String) session.getAttribute("user_id");
String user_name = (String) session.getAttribute("user_name"); //세션 값 불러오기
%>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<header>
		<h1>
			<a href='main.jsp'>From zero</a>
		</h1>
	</header>
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="introduce.jsp">OUR
					STORY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="introduce.jsp" class="submenuLink">사이트 소개</a></li>
					<li><a href="guide.jsp" class="submenuLink">이용 안내</a></li>
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
			<li class="topMenuLi"><a class="menuLink"
				href="offline_store.jsp">OFFLINE</a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="aboutZW.jsp">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="aboutZW.jsp" class="submenuLink">ABOUT ZW</a></li>
					<li><a href="eco_tip.jsp" class="submenuLink">ECO TIP</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="notice.jsp">GREEN
					BOARD</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
					<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
					<li><a href="qna.jsp" class="submenuLink">QNA</a></li>
				</ul></li>
		</ul>
	</nav>

	<ul class="loginarea">
		<form method="post" action="doSearch">
			<%
				if (user_name == null) {
			%>
			<li><a href="login.html">LOGIN</a></li>
			<li><a href="join.html">JOIN</a></li>
			<%
				} else {
			%>
			<li><a href="myPage.jsp"> <img src="images/mypage.png"
					width=25 height=20>
			</a></li>
			<li><%=user_name%>님 환영합니다!</li>
			<li><a href="cart.jsp">CART</a></li>
			<li><a href="./doLogout">LOGOUT</a></li>
			<%
				}
			%>
			<li><input type="text" name="search_text"></li>
			<li style='top: 100px; padding: 0 0px;'>
				<button type="submit">
					<img src="images/magnifying-glass.png" width=20 height=20>
				</button>
			</li>
		</form>

	</ul>

	<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				width=40 height=50></a></li>
		<li><a href="test.jsp"><img src="images/test.png" width=40
				height=50></a></li>
	</ul>