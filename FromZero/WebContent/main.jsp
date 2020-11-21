<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
<% User user = (User)request.getAttribute("user"); %>
<!--  <% session.setAttribute("user", user); %>--> 
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
	text-transform: uppercase;
	height: 250px; /* 높이를 250px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red;
	background-color: #dddddd;
}

.loginarea li {
	display: inline;
	/*text-transform: uppercase;*/
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
					<li><a href="living.html" class="submenuLink">LIVING</a></li>
					<li><a href="bathroom.html" class="submenuLink">BATHROOM</a></li>
					<li><a href="kitchen.html" class="submenuLink">KITCHEN</a></li>
					<li><a href="kit.html" class="submenuLink">KIT</a></li>
					<li><a href="etc.html" class="submenuLink">ETC</a></li>
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
		<li><%= user.getMemid() %>님</li>
		<li><a href="cart.html">CART</a></li>
		<li><a href="login.html">LOGIN</a></li>
		<li><a href="join.html">JOIN</a></li>
	</ul>

	<div id="slider-wrap">
		<ul id="slider">
			<li>
				<div></div> <img src="images/img01.jpg">
			</li>

			<li>
				<div></div> <img src="images/img02.jpg">
			</li>

			<li>
				<div></div> <img src="images/img03.jpg">
			</li>

			<li>
				<div></div> <img src="images/img04.jpg">
			</li>

			<li>
				<div></div> <img src="images/img05.jpg">
			</li>
		</ul>

		<div class="slider-btns" id="next">
			<span>▶</span>
		</div>
		<div class="slider-btns" id="previous">
			<span>◀</span>
		</div>

		<div id="slider-pagination-wrap">
			<ul>
			</ul>
		</div>
	</div>
	<br></br>
	<br></br>
	<br></br>


	<div doz_type="widget" id="w20200430557f107c8695a">
		<div class="_widget_data " data-widget-name="갤러리"
			data-widget-type="gallery2" data-widget-anim="none"
			data-widget-anim-duration="0.7" data-widget-anim-delay="0"
			data-widget-parent-is-mobile="N">
			<div class="widget _gallery_wrap ">
				<div id="container_w20200430557f107c8695a"
					class="img_rendering grid_02 type_grid img_border gallery2 "
					style="padding-bottom: 0px; height: auto; margin: 0px -15px;">
					<div class="_gallery_row gallery_row tabled">
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/e535a7276e76f.png">
							<div id="caption_3884542" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ALL
									PRODUCT</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>전체 상품.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="all.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="all.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200502/1812d3ebea70c.png&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200502/1812d3ebea70c.png)"
									data-src="https://cdn.imweb.me/thumbnail/20200502/76f65282799e2.png"
									data-sub-html="#caption_3884542" data-no="0"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200502/76f65282799e2.png"
								data-sub-html="#caption_3884542" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="all.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ALL
										PRODUCT</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>전체 상품.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="all.html" style="display: block"><span></span></a><a
										href="all.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/42179990e4d51.jpg">
							<div id="caption_3838152" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">LIVING</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>일상에서.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="living.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="living.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/ca2f5493f3604.jpg&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200521/ca2f5493f3604.jpg)"
									data-src="https://cdn.imweb.me/thumbnail/20200521/77694d969bc9a.jpg"
									data-sub-html="#caption_3838152" data-no="1"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200521/77694d969bc9a.jpg"
								data-sub-html="#caption_3838152" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="living.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">LIVING</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>일상에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="living.html" style="display: block"><span></span></a><a
										href="living.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/74d47eda697d6.jpg">
							<div id="caption_3838093" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BATHROOM
								</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>욕실에서.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="bathroom.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="bathroom.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/06038cc8092a7.jpg&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200521/06038cc8092a7.jpg)"
									data-src="https://cdn.imweb.me/thumbnail/20200521/0ff49d3b24d1d.jpg"
									data-sub-html="#caption_3838093" data-no="2"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200521/0ff49d3b24d1d.jpg"
								data-sub-html="#caption_3838093" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="bathroom.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BATHROOM
									</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>욕실에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="bathroom.html" style="display: block"><span></span></a><a
										href="bathroom.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
					</div>
					<div class="_gallery_row gallery_row tabled">
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/ec5a57b06213f.jpg">
							<div id="caption_3838142" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KITCHEN</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>부엌에서.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="kitchen.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="kitchen.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/35dab18b68bc3.jpg&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200521/35dab18b68bc3.jpg)"
									data-src="https://cdn.imweb.me/thumbnail/20200521/db2e758a70105.jpg"
									data-sub-html="#caption_3838142" data-no="3"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200521/db2e758a70105.jpg"
								data-sub-html="#caption_3838142" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="kithen.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KITCHEN</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>부엌에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="kitchen.html" style="display: block"><span></span></a><a
										href="kithen.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/580422ca58936.png">
							<div id="caption_3838094" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">OFFICE</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>사무실에서.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="office.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="office.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200502/75743900a9ff6.png&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200502/75743900a9ff6.png)"
									data-src="https://cdn.imweb.me/thumbnail/20200502/12e77bd028f3c.png"
									data-sub-html="#caption_3838094" data-no="4"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200502/12e77bd028f3c.png"
								data-sub-html="#caption_3838094" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="office.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">OFFICE</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>사무실에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="office" style="display: block"><span></span></a><a
										href="office.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/2369049e4d258.jpg">
							<div id="caption_3838108" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BOOK</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>책 읽을 때.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="book.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="book.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/884887fbae7da.jpg&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200521/884887fbae7da.jpg)"
									data-src="https://cdn.imweb.me/thumbnail/20200521/6b6c8e53b2830.jpg"
									data-sub-html="#caption_3838108" data-no="5"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200521/6b6c8e53b2830.jpg"
								data-sub-html="#caption_3838108" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="book.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BOOK</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>책 읽을 때.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="book.html" style="display: block"><span></span></a><a
										href="book.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
					</div>
					<div class="_gallery_row gallery_row tabled">
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/60742c7012d49.png">
							<div id="caption_3838155" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">FOOD</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>먹을 때.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="food.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="food.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200502/0001b66d61b62.png&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200502/0001b66d61b62.png)"
									data-src="https://cdn.imweb.me/thumbnail/20200502/06f2179c4f2be.png"
									data-sub-html="#caption_3838155" data-no="6"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200502/06f2179c4f2be.png"
								data-sub-html="#caption_3838155" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="food.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">FOOD</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>먹을 때.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="food.html" style="display: block"><span></span></a><a
										href="food.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="_item item_gallary"
							style="position: relative; padding: 15px;"
							data-org="S2017101059dc82fe9c146/0969b3ab68ba5.jpg">
							<div id="caption_3838156" style="display: none">
								<h4></h4>
								<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ETC</h6>
								<h5 style="margin: 0; line-height: 1.6;">
									<strong>그 외.</strong>
								</h5>
								<p class="hidden-xs hidden-sm">
									<br> <br>
								</p>
								<p></p>
								<h6 class="m_picker_btn_go picker_btn_go">
									<span><a href="etc.html">go →</a></span>
								</h6>
								<p></p>
							</div>
							<a class="item_container _item_container _fade_link "
								href="etc.html" style="display: block">
								<div class="img_wrap _img_wrap " id="gal_item_"
									style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/334ca6537bf21.jpg&quot;); min-height: 305px;"
									data-bg="url(https://cdn.imweb.me/thumbnail/20200521/334ca6537bf21.jpg)"
									data-src="https://cdn.imweb.me/thumbnail/20200521/43f7f5931eefe.jpg"
									data-sub-html="#caption_3838156" data-no="7"></div>
							</a>
							<div class="text_wrap _text_wrap " id="gal_item_"
								data-src="https://cdn.imweb.me/thumbnail/20200521/43f7f5931eefe.jpg"
								data-sub-html="#caption_3838156" style="display: table;">
								<a class="item_container _item_container _fade_link "
									href="etc.html" style="display: block">
									<p class="title"></p>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ETC</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>그 외.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p> <span class="body"></span>
								</a>
								<h6 class="m_picker_btn_go picker_btn_go">
									<a class="item_container _item_container _fade_link "
										href="etc.html" style="display: block"><span></span></a><a
										href="etc.html">go →</a>
								</h6>
								<p></p>
							</div>
							<div class="slide_overlay"></div>
						</div>
						<div class="dummy_col item_gallary _item _dummy_item"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<script>
		//slide-wrap
		var slideWrapper = document.getElementById('slider-wrap');
		//current slideIndexition
		var slideIndex = 0;
		//items
		var slides = document.querySelectorAll('#slider-wrap ul li');
		//number of slides
		var totalSlides = slides.length;
		//get the slide width
		var sliderWidth = slideWrapper.clientWidth;
		//set width of items
		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})
		//set width to be 'x' times the number of slides
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';

		// next, prev
		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});

		// hover
		slideWrapper.addEventListener('mouseover', function() {
			this.classList.add('active');
			clearInterval(autoSlider);
		});
		slideWrapper.addEventListener('mouseleave', function() {
			this.classList.remove('active');
			autoSlider = setInterval(function() {
				plusSlides(1);
			}, 3000);
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}

		//pagination
		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#slider-pagination-wrap ul')
					.appendChild(li);
		})

		function pagination() {
			var dots = document
					.querySelectorAll('#slider-pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();
		var autoSlider = setInterval(function() {
			plusSlides(1);
		}, 3000);
	</script>

</body>
</html>