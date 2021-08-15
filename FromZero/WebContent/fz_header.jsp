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
<br/><br/>
	<header>
			
			<a href="main.jsp"> <img src="./농부제로로고.png" width="200px"
				alt="My Image">
			</a>
		
	</header>
<br/>
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="introduce.jsp">INTRODUCE</a>
				<ul class="submenu" style="white-space: normal">
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="shop.jsp">ONLINE
					SHOP</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="living.jsp" class="submenuLink">LIVING</a></li>
					<li><a href="bathroom.jsp" class="submenuLink">BATHROOM</a></li>
					<li><a href="kitchen.jsp" class="submenuLink">KITCHEN</a></li>
					<li><a href="kit.jsp" class="submenuLink">KIT</a></li>
					<li><a href="etc.jsp" class="submenuLink">ETC</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink"
				href="map.jsp">OFFLINE SHOP</a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="eco_tip.jsp">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="eco_tip.jsp" class="submenuLink">ECO TIP</a></li>
					<li><a href="exchange.jsp" class="submenuLink">ECO POINT</a></li>
					<li><a href="test.jsp" class="submenuLink">ECO LEVEL TEST</a></li>
					<li><a href="recycling_method.jsp" class="submenuLink">RECYCLING
							METHOD</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="notice.jsp">GREEN
					BOARD</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
					<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
					<li><a href="QnA.jsp" class="submenuLink">QNA</a></li>
				</ul></li>
		</ul>
	</nav>

	<ul class="loginarea">
		<form style="margin-left: 100px" method="post" action="doSearch">
			<%
				if (user_name == null) {
			%>
			<li><a href="login.jsp">LOGIN</a></li>
			<li><a href="join.jsp">JOIN</a></li>
			<%
				} else if (user_name.equals("알맹상점") || user_name.equals("지구샵") || user_name.equals("더피커") || user_name.equals("라마홈")
					|| user_name.equals("송포얼스") || user_name.equals("디어얼스")) {
			%>
			<li><a href="myPage.jsp"><img src="images/mypage.png"
					width=25>
			</a></li>
			<li><%=user_name%>님 환영합니다!</li>
			<li><a href="cart.jsp">CART</a></li>
			<li><a href="./doLogout">LOGOUT</a></li>
			<li><a href="admin-main.jsp">내 상점 관리하기</a></li>
			<%
				} else {
			%>
			<li><a href="myPage.jsp"> <img src="images/mypage.png"
					width=25>
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
					<img src="images/magnifying-glass.png" width=20>
				</button>
			</li>
		</form>

	</ul>
