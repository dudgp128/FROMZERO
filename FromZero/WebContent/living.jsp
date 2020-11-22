<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
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

<!--
체크박스-->th, td {
	padding: 13px;
}

table {
	margin: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	background-color: #E6E6E6;
}
</style>
<meta charset="UTF-8">
<title>From zero</title>
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


	<!-- 체크박스 -->

	<form>
		<table>
			<tr>
				<th>상세검색</th>
				<td />
				<td />
				<td />
				<td />
			</tr>
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" name="smallCategory"
						value="straw" id="straw"> 빨대</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						value="tumblr" id="tumblr"> 텀블러</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						value="carrier" id="carrier"> 장바구니</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						value="pouch" id="pouch"> 파우치</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						value="strawPouch" id="strawPouch"> 빨대 주머니</label></td>
			</tr>


			<tr>
				<th>브랜드</th>
				<td><label><input type="checkbox" name="brandName"
						value="thepicker" id="thepicker"> 더피커</label></td>
				<td><label><input type="checkbox" name="brandName"
						value="jigushop" id="jigushop"> 지구샵</label></td>
				<td><label><input type="checkbox" name="brandName"
						value="zwshop" id="zwshop"> 제로웨이스트샵</label></td>
				<td><label><input type="checkbox" name="brandName"
						value="jigusalimi" id="jigusalimi"> 지구살림e</label></td>
				<td />
			</tr>


			<tr>
				<th>가격</th>
				<td><label><input type="checkbox" name="price"
						value="one" id="one"> ~1만원</label></td>
				<td><label><input type="checkbox" name="price"
						value="three" id="three"> ~3만원</label></td>
				<td><label><input type="checkbox" name="price"
						value="five" id="five"> ~5만원</label></td>
				<td />
				<td style="text-align: right;"><input type="submit" value="검색" />
				<td />
			</tr>
		</table>
	</form>
	<div class="big-shop-grid">
		<h2 class="big-category-text">LIVING</h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
				<%
					PreparedStatement pstmt = null;
				ResultSet rset = null;
				Connection conn = null;
				Properties connectionProps = new Properties();

				String DBUrl = "jdbc:mysql://localhost:3306/fz_webapp";
				String DBuser = "fz_webapp";
				String DBpasswd = "fz_webapp";
				String DBTimeZone = "UTC";

				connectionProps.put("user", DBuser);
				connectionProps.put("password", DBpasswd);
				connectionProps.put("serverTimezone", DBTimeZone);
				String name = null;
				try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='living' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String productname = null;
				String price = null;
				int img_count = 0;
				String img_li = null;

				while (rset.next()) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "living/living (" + img_count + ").jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</body>
</html>